import 'package:flutter/material.dart';
import 'package:streams_exercises/features/chat/chat_message.dart';
import 'package:streams_exercises/features/chat/chat_repository.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.chatRepository,
  });

  final ChatRepository chatRepository;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final List<ChatMessage> messages = [];

  @override
  void initState() {
    super.initState();
    widget.chatRepository.messages.listen((message) {
      setState(() {
        messages.add(message);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
        backgroundColor: const Color.fromARGB(255, 3, 228, 10),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.message,
                      color: Color.fromARGB(255, 1, 157, 171)),
                  title: Text(messages[index].user),
                  subtitle: Text(messages[index].message),
                  trailing: const Icon(Icons.check,
                      color: Color.fromARGB(255, 251, 6, 18)),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: widget.chatRepository.startSendingMessages,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 11, 148, 27),
              ),
              child: const Text("Start Chat"),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.chatRepository.dispose();
    super.dispose();
  }
}
