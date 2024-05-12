import 'package:bookly_app/core/utils/functions/custom_snakeBar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> lunchCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customSnakeBar(context, 'Can not lunch $url');
    }
  }
}
