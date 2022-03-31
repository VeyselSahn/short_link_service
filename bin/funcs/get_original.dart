import 'package:alfred/alfred.dart';

import '../links/shorted_links.dart';

String getOriginal(HttpRequest req) {
  try {
    for (var item in shortedLinks) {
      if (item.code == req.requestedUri.pathSegments.last) {
        return item.originalLink;
      }
    }
    return '404 Not Found';
  } catch (e) {
    return e.toString();
  }
}
