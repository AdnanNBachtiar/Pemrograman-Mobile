import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kontak Ku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontak Ku'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              contacts[index].name,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              contacts[index].phoneNumber,
              style: TextStyle(fontSize: 16.0),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  contacts.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newContact = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddContactPage()),
          );
          if (newContact != null) {
            setState(() {
              contacts.add(newContact);
            });
          }
        },
        child: Icon(Icons.add),
      ),
      // Memberi warna latar belakang pada bagian bawah
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}

class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

class AddContactPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kontak'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text;
                final phone = phoneController.text;
                if (name.isNotEmpty && phone.isNotEmpty) {
                  Navigator.pop(
                    context,
                    Contact(name: name, phoneNumber: phone),
                  );
                }
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
