import 'dart:io';

import 'package:alfred/alfred.dart';
import 'funcs/get_original.dart';
import 'funcs/make_short.dart';
import 'model/html_model.dart';

void main() async {
  final app = Alfred();

  app.get('/:code', (req, res) {
    if (req.params['code'] != null) {
      var _link = getOriginal(req);
      if (_link != null) {
        res.headers.contentType = ContentType.html;
        return htmlModel(_link);
      } else {
        return 'Not Found Bro';
      }
    }
  });
  app.post('/short', (req, res) => makeShort(req));

  final envPort = Platform.environment['PORT'];

  await app.listen(envPort != null ? int.parse(envPort) : 8080);
}
