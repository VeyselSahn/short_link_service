import 'dart:io';

import '../funcs/get_original.dart';
import '../funcs/make_short.dart';

Future startResponse(HttpRequest req) async {
  try {
    req.response.headers.contentType = ContentType.json;
    req.response.headers.add(
      'Access-Control-Allow-Origin',
      '*',
      preserveHeaderCase: true,
    );
    print(req.method + ' ' + req.requestedUri.toString());
    if (req.method == 'GET') {
      switch (req.requestedUri.pathSegments.last) {
        case ('/'):
          return 'Welcome the server';
        default:
          return getOriginal(req);
      }
    } else if (req.method == 'POST') {
      switch (req.requestedUri.pathSegments.last) {
        case ('add'):
          return await makeShort(req);
        default:
          req.response.statusCode = HttpStatus.badRequest;
      }
    }
  } catch (e) {
    print('Something went wrong: $e');
    req.response.statusCode = HttpStatus.internalServerError;
  }
}
