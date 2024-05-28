import 'package:url_launcher/url_launcher.dart';

class PhoneCall{
  static   Future<void> makingPhoneCall(String? mobile1) async {
    String dialUri = "tel:+91$mobile1"; //
    var url = Uri.parse(dialUri);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // telephone call
  static  Future<void> makingPhoneCalltele(String? mobile1) async {
    String dialUri = "tel:$mobile1"; //
    var url = Uri.parse(dialUri);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}