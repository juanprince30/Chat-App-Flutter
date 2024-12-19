// import 'package:another_telephony/constants.dart';
// import 'package:another_telephony/filter.dart';
import 'package:another_telephony/telephony.dart';
import 'package:permission_handler/permission_handler.dart';

class SmsTelephony {

  static late Telephony telephony;

  static void createTelephonyInstance()  {
    telephony = Telephony.instance;
  }

  static Future<bool?> askPermission() async {
    bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions ;

    return permissionsGranted;
  }

  static void sendSMSTelephony(String numberPhone, String code) {
    final SmsSendStatusListener listener = (SendStatus status) {
      switch (status) {
        case SendStatus.SENT:
          print("SMS envoyé avec succès !");
          break;
        case SendStatus.DELIVERED:
          print("SMS délivré avec succès !");
          break;
        default:
          print("Statut inconnu : $status");
      }
    };

    telephony.sendSms(
      to: numberPhone,
      message: code,
      statusListener: listener,
    );
  }

  static Future<List<SmsMessage>> getAllSendSMS() async {
    List<SmsMessage> sentMessages = [];
    try {
      PermissionStatus status = await Permission.sms.request();
      if (status.isGranted) {
        print("Permissions SMS accordées.");
        List<SmsMessage> allSentMessages = await telephony.getSentSms();
        print("Tout les messages : $allSentMessages"); // +22667501316
        print("premiermessage : ${allSentMessages.first.address}");
        sentMessages = allSentMessages
            .where((message) => message.address == '+22654789089')
            .toList();
        print("Messages envoyés par 22654789089 : $sentMessages");
        print("Nombre de messages envoyés : ${sentMessages.length}");
      } else {
        print("Permissions SMS non accordées.");
      }
    } catch (e) {
      print("Erreur lors de la récupération des SMS envoyés : $e");
    }
    return sentMessages;
  }



  static Future<String?> getLastSendSMS() async {
    try {
      List<SmsMessage> sentMessages = await getAllSendSMS();

      if (sentMessages.isNotEmpty) {
        SmsMessage lastSentSms = sentMessages.reduce((a, b) {
          DateTime dateA = DateTime.fromMillisecondsSinceEpoch(a.dateSent ?? 0);
          DateTime dateB = DateTime.fromMillisecondsSinceEpoch(b.dateSent ?? 0);
          return dateA.isAfter(dateB) ? a : b;
        });

        print("Dernier SMS envoyé : ${lastSentSms.body}");
        print("Envoyé à : ${lastSentSms.address}");

        return lastSentSms.body;
      } else {
        print("Aucun SMS envoyé trouvé.");
        return null;
      }
    } catch (e) {
      print("Erreur lors de la récupération du dernier SMS envoyé : $e");
      return null;
    }
  }
}