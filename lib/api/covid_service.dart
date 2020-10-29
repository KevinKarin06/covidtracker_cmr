import 'dart:convert';
import 'dart:io';

import 'package:covid19_tracker_cmr/model/covid19.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class CovidService {
  final String _url = 'https://api.covid19api.com/dayone/country/cameroon';
  String fileName = 'CachedData.json';

  Future<void> _deleteCachedContent() async {
    String fileName = 'CachedData.json';
    var cacheDir = await getTemporaryDirectory();
    if (await File(cacheDir.path + '/' + fileName).exists()) {
      cacheDir.delete(recursive: true);
      print('deleted Cached Data');
    }
  }

  Future<Covid19> _loadFromApi() async {
    String fileName = 'CachedData.json';
    var response = await http.get(_url);
    var parsed = jsonDecode(response.body);
    parsed.cast<Map<String, dynamic>>();
    var latestIndex = parsed.length - 1;
    print(parsed[latestIndex]);
    print('laded from api');
    var tempDir = await getTemporaryDirectory();
    File file = File(tempDir.path + '/' + fileName);
    file.writeAsString(response.body, flush: true, mode: FileMode.write);
    return Covid19.fromJson(parsed[latestIndex]);
  }

  Future<Covid19> getData({bool refresh = false}) async {
    if (refresh) {
      _deleteCachedContent();
      _loadFromApi();
    } else {
      var cacheDir = await getTemporaryDirectory();
      if (await File(cacheDir.path + '/' + fileName).exists()) {
        var jsonData = File(cacheDir.path + '/' + fileName).readAsStringSync();
        var parsed = jsonDecode(jsonData).cast<Map<String, dynamic>>();
        var latestIndex = parsed.length - 1;
        print(parsed[latestIndex]);
        print('loaded from file');
        return Covid19.fromJson(parsed[latestIndex]);
      } else {
        _loadFromApi();
      }
    }
  }
}
