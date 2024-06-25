class ChatMessage {
  final String user;
  final String message;

  ChatMessage({required this.user, required this.message});
}

List<ChatMessage> mockMessages = [
  ChatMessage(user: "Alice", message: "Hallo, wie geht's?"),
  ChatMessage(
      user: "Bob", message: "Mir geht's gut, und dir? Was macht Flutter?"),
  ChatMessage(
      user: "Alice", message: "Auch gut, danke! Flutter ist sehr kompliziert!"),
  ChatMessage(user: "Bob", message: "Dann musst Du noch viel üben!"),
  ChatMessage(user: "Alice", message: "Ich habe leider zu wenig Zeit!"),
  ChatMessage(
      user: "Bob",
      message:
          "Das ist schade,denn man kann viel mit Flutter machen! Oder nimm einefach ChatGPT :-)"),
];
