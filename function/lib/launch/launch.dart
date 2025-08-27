import 'package:url_launcher/url_launcher.dart';

class Launch {
  static Future cellphone(String cellphone) async {
    var uri = Uri(scheme: 'tel', path: cellphone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  static Future sms(String cellphone) async {
    var uri = Uri(scheme: 'sms', path: cellphone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,mode: LaunchMode.externalApplication);
    }
  }

  static Future url(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
