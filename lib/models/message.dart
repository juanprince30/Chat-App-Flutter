
class Message {
  String _body;
  int _sendPersonId;
  int _getPersonId;

  Message(
      {required String body,
      required int getPersonId,
      required int sendPersonId})
      : _body = body,
        _sendPersonId = sendPersonId,
        _getPersonId = getPersonId;

  // getter
  String get body => _body;
  int get sendPersonId => _sendPersonId;
  int get getPersonId => _getPersonId;

  // setter
  set body(String value) => _body = value;
  set sendPersonId(int value) => _sendPersonId = value;
  set getPersonId(int value) => _getPersonId = value;



}
