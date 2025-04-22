import 'package:flutter/material.dart';

class NotificationDialog extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onConfirm;

  const NotificationDialog({
    required this.isEnabled,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(isEnabled 
          ? 'Desativar Notificações?' 
          : 'Ativar Notificações?'),
      content: const Text('Você pode alterar isso nas configurações a qualquer momento.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.pop(context);
          },
          child: const Text('Confirmar'),
        ),
      ],
    );
  }
}
