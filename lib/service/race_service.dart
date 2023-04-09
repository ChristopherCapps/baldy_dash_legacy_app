import '../model/message.dart';

abstract class RaceService {
  Stream<List<Message>> getMessages({int? maxMessages});

  Future<String> sendMessage(String text);
}
