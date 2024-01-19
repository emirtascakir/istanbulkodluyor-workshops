import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emir_s_whatsapp_clone/views/message_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseFireStore = FirebaseFirestore.instance;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void _quit() async {
    await firebaseAuthInstance.signOut();
  }

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<List<Map<String, dynamic>>> getUsers() async {
    QuerySnapshot querySnapshot = await usersCollection.get();
    List<Map<String, dynamic>> users = [];

    querySnapshot.docs.forEach((doc) {
      users.add(doc.data() as Map<String, dynamic>);
    });

    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF25D366),
        actions: [
          IconButton(
              onPressed: () => _quit(),
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ))
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Map<String, dynamic>> users = snapshot.data ?? [];

            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: users.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> user = users[index];
                return ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MessageView(user: user))),
                  title: Text(
                    user['nameSurname'],
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  // Diğer string değerlerini buraya ekleyebilirsiniz.
                );
              },
            );
          }
        },
      ),
    );
  }
}
