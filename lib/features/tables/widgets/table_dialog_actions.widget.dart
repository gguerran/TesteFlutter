import 'package:flutter/material.dart';

class TableDialogActions extends StatelessWidget {
  final void Function() onSave;
  const TableDialogActions({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          OutlinedButton(
            onPressed: Navigator.of(context).pop,
            child: const Text("Voltar"),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Colors.white,
            ),
            onPressed: onSave,
            child: const Text("Salvar"),
          )
        ],
      ),
    );
  }
}
