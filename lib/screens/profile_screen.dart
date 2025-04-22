import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _nameController;
  late String _imageUrl;
  bool _isEditing = false;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserProvider>(context, listen: false).user;
    _nameController = TextEditingController(text: user?['name'] ?? '');
    _imageUrl = user?['imageUrl'] ?? '';
  }

  Future<void> _pickImage() async {
    if (!_isEditing) return;
    
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageUrl = image.path;
      });
    }
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
      if (!_isEditing) {
        _saveChanges();
      }
    });
  }

  void _saveChanges() {
    Provider.of<UserProvider>(context, listen: false).updateProfile(
      name: _nameController.text,
      imageUrl: _imageUrl,
    );
  }

  ImageProvider _getImageProvider() {
    if (_imageUrl.startsWith('http')) {
      return NetworkImage(_imageUrl);
    } else if (_imageUrl.isNotEmpty) {
      return FileImage(File(_imageUrl));
    }
    return const AssetImage('assets/default_avatar.png');
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.save : Icons.edit),
            onPressed: _toggleEditing,
          ),
        ],
      ),
      body: user == null
          ? const Center(child: Text('Nenhum usuário logado'))
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  GestureDetector(
                    onTap: _isEditing ? _pickImage : null,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: _imageUrl.isNotEmpty
                              ? _getImageProvider()
                              : null,
                          child: _imageUrl.isEmpty
                              ? const Icon(Icons.person, size: 40)
                              : null,
                        ),
                        if (_isEditing)
                          const CircleAvatar(
                            radius: 15,
                            child: Icon(Icons.edit, size: 18),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      prefixIcon: Icon(Icons.person),
                    ),
                    enabled: _isEditing,
                  ),
                  const SizedBox(height: 30),
                  const Text('Informações do usuário:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text('Email'),
                    subtitle: Text(user['email']),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('Telefone'),
                    subtitle: Text(user['phone']),
                  ),
                ],
              ),
            ),
    );
  }
}