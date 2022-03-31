import 'dart:io';

import 'package:alfred/alfred.dart';

import 'routes/general_routes.dart';

void main() async {
  final app = Alfred();

  final envPort = Platform.environment['PORT'];

  final server = await app.listen(envPort != null ? int.parse(envPort) : 8080);
  await for (var req in server) {
    var _response = await startResponse(req);
    req.response.write(_response);
    await req.response.flush();
    await req.response.close();
  }
}
