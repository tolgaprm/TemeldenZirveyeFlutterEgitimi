import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:ogrenci_app/models/Ogretmen.dart';

class DataService {
  final String baseUrl = "https://615d80a012571a0017207680.mockapi.io/";

  Future<Ogretmen> ogretmenIndir() async {
    final response = await http.get(Uri.parse('$baseUrl/ogretmen/1'));

    if (response.statusCode == 200) {
      return Ogretmen.fromMap(jsonDecode(response.body));
    } else {
      throw Exception("Ogretmen İndirilemedi");
    }
  }
}

final dataServiceProvider = Provider((ref) {
  return DataService();
});
