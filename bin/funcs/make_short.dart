import 'dart:convert';
import 'dart:math';
import 'package:alfred/alfred.dart';

import '../links/shorted_links.dart';
import '../model/link_model.dart';

Future<Map<String, dynamic>> makeShort(HttpRequest req) async {
  var _body = await req.first;
  var _firstDec = utf8.decode(_body);
  String link = jsonDecode(_firstDec)['link'];
  var code = getRandomString(5);
  var shortLink = req.requestedUri.origin + '/' + code;
  var _model = LinkModel(originalLink: 'http://' + link, shortLink: shortLink, code: code);

  //
  if (shortedLinks.length > 10) {
    shortedLinks.clear();
    shortedLinks.add(basic);
  }
  shortedLinks.add(_model);
  return _model.toJson();
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) =>
    String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
