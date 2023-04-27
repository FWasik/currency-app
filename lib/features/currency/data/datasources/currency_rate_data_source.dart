import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CurrencyRatesDataSource {
  Future<Map<String, dynamic>?> fetchRates(String currency) async {
    var dateTimeToday = DateTime.now();

    String today = DateFormat('yyyy-MM-dd').format(dateTimeToday);
    String fromDate = DateFormat('yyyy-MM-dd')
        .format(dateTimeToday.subtract(const Duration(days: 30)));

    Uri url = Uri.parse(
        'http://api.nbp.pl/api/exchangerates/rates/A/$currency/$fromDate/$today/');

    final response = await http.get(url);

    return jsonDecode(response.body);
  }
}
