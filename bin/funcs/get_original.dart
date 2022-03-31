import 'package:alfred/alfred.dart';

import '../links/shorted_links.dart';

String? getOriginal(HttpRequest req) {
  for (var item in shortedLinks) {
    if (item.code == req.requestedUri.pathSegments.last) {
      return item.originalLink;
    }
  }

  return null;
}
