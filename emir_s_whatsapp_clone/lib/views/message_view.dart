import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final firebaseAuthInstance = FirebaseAuth.instance;
final firebaseFireStore = FirebaseFirestore.instance;

class MessageView extends StatefulWidget {
  const MessageView({super.key, required this.user});
  final Map<String, dynamic> user;
  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  final _messageController = TextEditingController();

  void _sendMessage() async {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      try {
        await firebaseFireStore.collection('messages').add({
          'text': text,
          'timestamp': FieldValue.serverTimestamp(),
          'from': firebaseAuthInstance.currentUser!.uid,
          'to': widget.user['uid']
        });
        _messageController.clear();
      } catch (e) {
        print('error $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF25D366),
          title: Text(widget.user['nameSurname']),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder(
              stream: firebaseFireStore
                  .collection('messages')
                  .orderBy('timestamp', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                var documents = snapshot.data?.docs;
                var filteredDocuments = documents?.where((doc) {
                  var from = doc['from'];
                  var to = doc['to'];
                  return (from == widget.user['uid'] &&
                          to == firebaseAuthInstance.currentUser!.uid ||
                      (from == firebaseAuthInstance.currentUser!.uid &&
                          to == widget.user['uid']));
                }).toList();
                return Expanded(
                  child: ListView.builder(
                    itemCount: filteredDocuments?.length,
                    itemBuilder: (context, index) {
                      var document = filteredDocuments?[index];
                      var timeStamp = filteredDocuments?[index]['timestamp'];
                      int milliseconds = (timeStamp.seconds * 1000 +
                              timeStamp.nanoseconds / 1000000)
                          .toInt();
                      DateTime date =
                          DateTime.fromMillisecondsSinceEpoch(milliseconds);
                      return ListTile(
                        title: Text(
                          document?['text'],
                          textAlign: document?['from'] ==
                                  firebaseAuthInstance.currentUser!.uid
                              ? TextAlign.end
                              : TextAlign.start,
                          style: const TextStyle(
                              fontSize: 22, color: Colors.black),
                        ),
                        subtitle: Text(
                          date.toString(),
                          textAlign: document?['from'] ==
                                  firebaseAuthInstance.currentUser!.uid
                              ? TextAlign.end
                              : TextAlign.start,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    minLines: 1,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Mesajınız..",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _sendMessage();
                    FocusScope.of(context).unfocus();
                  },
                  icon: const Icon(
                    Icons.send,
                    size: 26,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
