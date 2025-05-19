import 'package:flutter/material.dart';
import 'package:teste_flutter/features/tables/stores/table.store.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class CustomerListDialog extends StatefulWidget {
  final TextEditingController controller;
  final TableStore tableStore;

  const CustomerListDialog({
    super.key,
    required this.controller,
    required this.tableStore,
  });

  @override
  State<CustomerListDialog> createState() => _CustomerListDialogState();
}

class _CustomerListDialogState extends State<CustomerListDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Clientes nesta conta"),
          const SizedBox(height: 16),
          Text(
            "Associe os clientes aos pedidos para salvar o pedido no histórico do cliente, pontuar no fidelidade e fazer pagamentos no fiado.",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  color: context.appColors.darkGrey,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 350,
                height: 40,
                child: TextFormField(
                  controller: widget.controller,
                  decoration: const InputDecoration(
                    labelText: "Quantidade de pessoas",
                  ),
                  enabled: false,
                ),
              ),
              InkWell(
                onTap: () {
                  widget.controller.text =
                      (int.parse(widget.controller.text) + 1).toString();
                },
                child: const Icon(Icons.add),
              ),
              InkWell(
                onTap: () {
                  if (int.parse(widget.controller.text) == 0) return;
                  widget.controller.text =
                      (int.parse(widget.controller.text) - 1).toString();
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
