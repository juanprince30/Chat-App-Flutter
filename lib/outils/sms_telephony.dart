
import 'package:another_telephony/telephony.dart';

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
    telephony.sendSms(
        to: numberPhone,
        message: code
    );
  }

}