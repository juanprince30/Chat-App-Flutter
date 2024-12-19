
class Country{

  String _id;
  String _flag;

  Country({
    required String id,
    required String flag,
  })  : _id = id,
        _flag = flag;

  // getters
  String get id => _id;
  String get flag => _flag;


  // setters
  set id(String value) => _id = value;
  set flag(String value) => _flag = value;

}