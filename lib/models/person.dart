class Person {
  String _firstName;
  String? _lastName;
  String _nationalityId;
  String _number;

  Person({
    required String firstName,
    required String nationalityId,
    required String number,
    String? lastName,
  })  : _firstName = firstName,
        _nationalityId = nationalityId,
        _number = number,
        _lastName = lastName;

  // getters
  String get firstName => _firstName;
  String? get lastName => _lastName;
  String get nationalityId => _nationalityId;
  String get number => _number;

  // setters
  set firstName(String value) => _firstName = value;
  set lastName(String? value) => _lastName = value;
  set nationalityId(String value) => _nationalityId = value;
  set number(String value) => _number = value;
}
