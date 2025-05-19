import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';
import 'package:teste_flutter/features/tables/stores/table.store.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/features/tables/widgets/customers_list_dialog.widget.dart';
import 'package:teste_flutter/features/tables/widgets/table_dialog_actions.widget.dart';
import 'package:teste_flutter/features/tables/widgets/table_dialog_header.widget.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class TableDialog extends StatefulWidget {
  final TableEntity? tableEntity;

  const TableDialog({super.key, this.tableEntity});

  @override
  State<TableDialog> createState() => _TableDialogState();

  Future<TableEntity?> show(BuildContext context) async {
    return await showDialog<TableEntity?>(
      context: context,
      builder: (ctx) =>
          Provider<TablesStore>(create: (_) => context.read(), child: this),
    );
  }
}

class _TableDialogState extends State<TableDialog> {
  final TextEditingController _tableIdentificatorController =
      TextEditingController();
  final _customerCountController = TextEditingController()..text = 0.toString();
  late TableStore _tableStore;

  @override
  void initState() {
    super.initState();
    _tableStore = TableStore();
    if (widget.tableEntity != null) {
      _tableStore.setIdentificator(widget.tableEntity!.identification);
      _tableStore.addAllCustomers(widget.tableEntity!.customers);
      _customerCountController.text =
          widget.tableEntity!.customers.length.toString();
      _tableIdentificatorController.text = widget.tableEntity!.identification;
    }
  }

  @override
  void dispose() {
    _tableIdentificatorController.dispose();
    _customerCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tables = Provider.of<TablesStore>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: 450,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TableDialogHeader(
              tableIdentificator: widget.tableEntity?.identification,
              controller: _tableIdentificatorController,
            ),
            Divider(thickness: 5, color: context.appColors.grey),
            Observer(
              builder: (context) {
                return CustomerListDialog(
                  controller: _customerCountController,
                  tableStore: _tableStore,
                );
              },
            ),
            TableDialogActions(
              onSave: () {
                Navigator.of(context).pop(
                  TableEntity(
                    id: tables.tables.length,
                    identification: _tableIdentificatorController.text,
                    customers: _tableStore.customers,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
