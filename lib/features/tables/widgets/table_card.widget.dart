import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/features/tables/widgets/customers_counter.widget.dart';
import 'package:teste_flutter/features/tables/widgets/table_dialog.widget.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

const double _innerPadding = 1.0;
const double _topPadding = 5.0;

class TableCard extends StatefulWidget {
  final TableEntity tableEntity;
  const TableCard({super.key, required this.tableEntity});

  @override
  State<TableCard> createState() => _TableCardState();
}

class _TableCardState extends State<TableCard> {
  @override
  Widget build(BuildContext context) {
    final tables = Provider.of<TablesStore>(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(
        _innerPadding,
        _topPadding,
        _innerPadding,
        _innerPadding,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.appColors.lightGreen,
      ),
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              (widget.tableEntity.identification).toUpperCase(),
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.appColors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: _innerPadding),
          Card(
            elevation: 1,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () async {
                TableEntity? table =
                    await TableDialog(tableEntity: widget.tableEntity)
                        .show(context);
                if (table != null) {
                  tables.updateTable(table);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    CustomersCounter(
                      label: widget.tableEntity.customers.length.toString(),
                      iconWidth: 16,
                      color: context.appColors.darkGrey,
                      textStyle: context.textTheme.bodySmall
                          ?.copyWith(color: context.appColors.darkGrey),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
