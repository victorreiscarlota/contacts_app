import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../data/dummy_contacts.dart';
import 'contact_detail.dart';

class ContactSearchDelegate extends SearchDelegate<Contact?> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final List<Contact> allContacts = ContactsRepository.getContacts();
    final List<Contact> filteredContacts = allContacts.where((contact) {
      final queryLower = query.toLowerCase();
      return contact.name.toLowerCase().contains(queryLower) ||
          contact.phone.contains(query);
    }).toList();

    return ListView.builder(
      itemCount: filteredContacts.length,
      itemBuilder: (context, index) {
        final contact = filteredContacts[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(contact.imageUrl),
          ),
          title: Text(contact.name),
          subtitle: Text(contact.phone),
          onTap: () {
            close(context, contact);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactDetailScreen(contact: contact),
              ),
            );
          },
        );
      },
    );
  }
}