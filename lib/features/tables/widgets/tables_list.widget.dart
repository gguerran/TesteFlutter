import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_flutter/features/tables/stores/tables.store.dart';
import 'package:teste_flutter/features/tables/widgets/table_card.widget.dart';

class TablesList extends StatefulWidget {
  const TablesList({super.key});

  @override
  State<TablesList> createState() => _TablesListState();
}

class _TablesListState extends State<TablesList> {
  @override
  Widget build(BuildContext context) {
    final tables = Provider.of<TablesStore>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
            builder: (context) {
              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: tables.tables
                    .map((e) => TableCard(tableEntity: e))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
