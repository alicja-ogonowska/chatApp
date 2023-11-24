import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String uid;
  final String message;
  final Timestamp? timestamp;

  Message({
    required this.uid,
    required this.message,
    this.timestamp,
  });

  factory Message.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Message(
      uid: data?['uid'],
      message: data?['message'],
      timestamp: data?['timestamp'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'message': message,
      'timestamp': timestamp ?? Timestamp.now(),
    };
  }
}

final messagesQuery =
    FirebaseFirestore.instance.collection('messages').orderBy('timestamp', descending: true);