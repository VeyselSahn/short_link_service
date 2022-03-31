import 'dart:convert';

import 'package:alfred/alfred.dart';
import 'package:shelf/shelf.dart';

import '../funcs/make_short.dart';

Future<String> postRoutes(HttpRequest req) async {
  try {
    switch (req.requestedUri.pathSegments.last) {
      case 'short':
        var _body = await req.first;
        var _firstDec = utf8.decode(_body);
        Map<String, dynamic> _decode = jsonDecode(_firstDec);
        var _res = makeShort(_decode['link']);
        return jsonEncode(_res);
      default:
        return '404 Not found';
    }
  } catch (e) {
    return e.toString();
  }
}
