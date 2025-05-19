import 'package:flutter/material.dart';
import 'package:teste_flutter/utils/extension_methos/material_extensions_methods.dart';

class TableDialogHeader extends StatelessWidget {
  final String? tableIdentificator;
  final TextEditingController controller;

  const TableDialogHeader({
    super.key,
    required this.tableIdentificator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: tableIdentificator == null
                          ? "Nova mesa"
                          : "Editar informações da",
                    ),
                    if (tableIdentificator != null)
                      TextSpan(
                          text: tableIdentificator ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              InkWell(
                onTap: Navigator.of(context).pop,
                child: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: "Identificação da mesa",
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Identificação temporária para ajudar na identificação do cliente.",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  color: context.appColors.darkGrey,
                ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
