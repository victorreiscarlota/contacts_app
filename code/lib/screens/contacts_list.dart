import 'package:flutter/material.dart';
import '../widgets/contact_item.dart';
import '../data/dummy_contacts.dart';
import '../models/contact.dart';
import './contact_detail.dart';

class ContactsListScreen extends StatelessWidget {
  const ContactsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Contact> contacts = ContactsRepository.getContacts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (ctx, index) => ContactItem(
          contact: contacts[index],
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactDetailScreen(contact: contacts[index]),
            ),
          ),
        ),
      ),
    );
  }
}
