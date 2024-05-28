import 'package:url_launcher/url_launcher.dart';

class WebPage{
  static  void openwebpage(String urlname) async {
    var url = Uri.parse(urlname);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}