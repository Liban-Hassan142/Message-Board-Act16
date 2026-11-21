class Message {
  final String id;
  final String text;
  final String authorUid;
  final String authorName;

  Message({
    required this.id,
    required this.text,
    required this.authorUid,
    required this.authorName,
  });

  factory Message.fromMap(String id, Map<String, dynamic> data) {
    return Message(
      id: id,
      text: data['text'] ?? '',
      authorUid: data['authorUid'] ?? '',
      authorName: data['authorName'] ?? '',
    );
  }
}
