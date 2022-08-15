import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

Future<String> readJsonFromFile(String? name) async {
  if (name == null) {
    return '';
  }
  try {
    var dir = Directory.current.path;
    if (dir.endsWith('/test')) {
      dir = dir.replaceAll('/test', '');
    }
    return File('$dir/test/util/json/$name').readAsStringSync();
  } catch (e) {
    return rootBundle.loadString('test/util/json/$name');
  }
}

Future<Map<String, dynamic>> decodeJsonFileAsMap(String name) async {
  return json.decode(await readJsonFromFile(name)) as Map<String, dynamic>;
}

Future<List<dynamic>> decodeJsonFileAsList(String name) async {
  return json.decode(await readJsonFromFile(name)) as List<dynamic>;
}
