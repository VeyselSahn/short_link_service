import 'dart:convert';
import 'package:alfred/alfred.dart';

import '../model/link_model.dart';

Future<Map<String, dynamic>> makeShort(HttpRequest req) async {
  var _body = await req.first;
  var _firstDec = utf8.decode(_body);
  String link = jsonDecode(_firstDec)['link'];
  var _cleaned = link.replaceAll(r'.com', r'');
  String code = base64Encode(utf8.encode(_cleaned));
  String shortLink = 'https://grisoft/' + code;
  return LinkModel(originalLink: 'http://' + link, shortLink: shortLink, code: code).toJson();
}
