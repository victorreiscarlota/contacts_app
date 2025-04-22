import 'package:flutter/material.dart';
import '../widgets/contact_item.dart';
import '../data/dummy_contacts.dart';
import '../models/contact.dart';
import 'contact_detail.dart';
import 'search_contact_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Contact> contacts = ContactsRepository.getContacts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: ContactSearchDelegate(),
          ),
          ),
        ],
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
