import 'package:url_launcher/url_launcher.dart';

class UrlService {
  static Future launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch url';
    }
  }
}
