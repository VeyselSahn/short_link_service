import 'dart:convert';

import 'package:alfred/alfred.dart';

import '../links/shorted_links.dart';

String getAll(HttpRequest req) {
  List<Map> _list = [];
  for (var i = 0; i < shortedLinks.length; i++) {
    _list.add(shortedLinks.elementAt(i).toJson());
  }
  return jsonEncode(_list);
}
