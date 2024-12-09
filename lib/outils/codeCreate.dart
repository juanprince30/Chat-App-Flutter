import 'dart:math';

String codeCreate() {

  final random = Random();
  String code="";
  for(int i=0; i<4; i++) {
    int randomInt = random.nextInt(10);
    code = "$code$randomInt";
  }

  return code;
}