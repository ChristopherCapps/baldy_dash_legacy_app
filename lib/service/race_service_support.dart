import 'package:http/http.dart' as http;
import './race_service.dart';

abstract class RaceServiceSupport extends RaceService {
  final String playerId;

  RaceServiceSupport(this.playerId);

  @override
  Future<String> sendMessage(final String text) async {
    //final url = Uri.https('quest-baldy-dash.ue.r.appspot.com', playerId);
    final url = Uri.http('localhost:8080', '/messages/$playerId');
    final response = await http.post(url, body: text);
    return response.headers['location'] ?? '';
  }
}
