import 'package:chat_app/outils/codeCreate.dart';
import 'package:sms_advanced/sms_advanced.dart';
import 'dart:async';

String code = codeCreate();

Future<String> sendCodeSMS(String numberPhone) async {
  SmsSender sender = SmsSender();
  SmsMessage message = SmsMessage(numberPhone, code);

  final returnCode = Completer<String>();

  message.onStateChanged.listen((state) {
    if (state == SmsMessageState.Sent) {
      returnCode.complete(code);
    } else {
      returnCode.complete("Message non envoyé");
    }
  });
  sender.sendSms(message);

  return returnCode.future;
}

Future<SmsMessage?> getCodeSMS() async {

  SmsQuery query = SmsQuery();
  List<SmsMessage> messages = await query.querySms(
    kinds: [SmsQueryKind.Inbox],
    count: 1,
    sort: true,
  );

  return messages.isNotEmpty ? messages.first : null;
}

String? codeVerification() {
  return getCodeSMS().toString() == code ? code : null ;
}
