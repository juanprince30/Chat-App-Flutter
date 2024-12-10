class Message{
  String body;
  String sender;
  bool read;
  String date;
  String heure;
  String? image;

  Message({required this.image,required this.heure,required this.body, required this.sender, required this.read, required this.date});
}