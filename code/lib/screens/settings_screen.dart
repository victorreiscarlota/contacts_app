import 'package:flutter/material.dart';
import '../widgets/notification_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Privacidade',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            title: Text(
              'Sua privacidade é importante. Todos os dados são protegidos conforme nossa política de segurança.',
            ),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Notificações'),
            subtitle: const Text('Habilitar/Desabilitar notificações'),
            value: true,
            onChanged: (value) => showDialog(
              context: context,
              builder: (ctx) => NotificationDialog(
                isEnabled: value,
                onConfirm: () {/* Lógica real aqui */},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
