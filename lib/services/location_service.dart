import 'dart:convert';

import '../core/network_request/network_request.dart';

class LocationService {
  // ignore: prefer_final_fields
  static const String _googleAPIkey = '';
  final NetworkRequest _networkRequest = NetworkRequestImpl();

  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$_googleAPIkey';

    final response = await _networkRequest.get(url);
    late Map decodedJson;

    if (response.statusCode == 200) {
      decodedJson = json.decode(response.body);
    }

    final placeId = decodedJson['candidates'][0]['place_id'] as String;

    return placeId;
  }

  Future<Map<String, dynamic>> getPlace(String input) async {
    final placeId = await getPlaceId(input);
    late Map decodedJson;

    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$_googleAPIkey';
    final response = await _networkRequest.get(url);
    decodedJson = json.decode(response.body);

    final results = decodedJson['result'] as Map<String, dynamic>;
    return results;
  }
}
