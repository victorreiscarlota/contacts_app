import '../models/contact.dart';

class ContactsRepository {
  static List<Contact> getContacts() {
    return [
      Contact(
        id: '1',
        name: 'João Silva',
        phone: '(11) 9999-8888',
        imageUrl: 'https://picsum.photos/200?1',
      ),
      Contact(
        id: '2',
        name: 'Maria Oliveira',
        phone: '(21) 1234-5678',
        imageUrl: 'https://picsum.photos/200?2',
      ),
      Contact(
        id: '3',
        name: 'Carlos Souza',
        phone: '(31) 8765-4321',
        imageUrl: 'https://picsum.photos/200?3',
      ),
      Contact(
        id: '4',
        name: 'Ana Costa',
        phone: '(48) 3344-5566',
        imageUrl: 'https://picsum.photos/200?4',
      ),
      Contact(
        id: '5',
        name: 'Pedro Santos',
        phone: '(19) 1122-3344',
        imageUrl: 'https://picsum.photos/200?5',
      ),
      Contact(
        id: '6',
        name: 'Julia Pereira',
        phone: '(27) 9988-7766',
        imageUrl: 'https://picsum.photos/200?6',
      ),
      Contact(
        id: '7',
        name: 'Lucas Fernandes',
        phone: '(85) 4433-2211',
        imageUrl: 'https://picsum.photos/200?7',
      ),
      Contact(
        id: '8',
        name: 'Fernanda Almeida',
        phone: '(51) 6677-8899',
        imageUrl: 'https://picsum.photos/200?8',
      ),
      Contact(
        id: '9',
        name: 'Rafael Lima',
        phone: '(31) 5544-3322',
        imageUrl: 'https://picsum.photos/200?9',
      ),
      Contact(
        id: '10',
        name: 'Amanda Rocha',
        phone: '(11) 2233-4455',
        imageUrl: 'https://picsum.photos/200?10',
      ),
      Contact(
        id: '11',
        name: 'Bruno Carvalho',
        phone: '(21) 7788-9900',
        imageUrl: 'https://picsum.photos/200?11',
      ),
      Contact(
        id: '12',
        name: 'Camila Dias',
        phone: '(47) 6655-4433',
        imageUrl: 'https://picsum.photos/200?12',
      ),
      Contact(
        id: '13',
        name: 'Diego Martins',
        phone: '(81) 3322-1144',
        imageUrl: 'https://picsum.photos/200?13',
      ),
      Contact(
        id: '14',
        name: 'Laura Gomes',
        phone: '(98) 8877-6655',
        imageUrl: 'https://picsum.photos/200?14',
      ),
      Contact(
        id: '15',
        name: 'Gabriel Sousa',
        phone: '(62) 5544-3322',
        imageUrl: 'https://picsum.photos/200?15',
      ),
    ];
  }
}
