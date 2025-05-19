import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_flutter/features/tables/entities/table.entity.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/features/tables/widgets/customers_counter.widget.dart';
import 'package:teste_flutter/features/tables/widgets/table_dialog.widget.dart';
import 'package:teste_flutter/shared/widgets/search_input.widget.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class TablesHeader extends StatefulWidget {
  const TablesHeader({super.key});

  @override
  State<TablesHeader> createState() => _TablesHeaderState();
}

class _TablesHeaderState extends State<TablesHeader> {
  @override
  Widget build(BuildContext context) {
    final tables = Provider.of<TablesStore>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Text('Mesas', style: context.textTheme.titleLarge),
            const SizedBox(width: 20),
            SearchInput(onChanged: (value) => {}),
            const SizedBox(width: 20),
            Observer(
              builder: (context) => CustomersCounter(
                label: tables.tables.length.toString(),
              ),
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () async {
                debugPrint('criar nova mesa');
                TableEntity? table = await const TableDialog().show(context);
                if (table != null) {
                  tables.addTable(table);
                }
              },
              tooltip: 'Criar nova mesa',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
