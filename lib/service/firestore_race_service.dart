import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/message.dart';
import 'race_service_support.dart';

// TODO: Need to refactor and delegate to a repo

class FirestoreRaceService extends RaceServiceSupport {
  static FirestoreRaceService? _instance;

  final FirebaseFirestore _db;

  FirestoreRaceService._(super.playerId, this._db) {
    _instance = this;
  }

  static Future<FirestoreRaceService> init(
          final String playerId, final FirebaseFirestore db) async =>
      FirestoreRaceService._(playerId, db);

  static FirestoreRaceService get I => FirestoreRaceService._instance!;

  @override
  Stream<List<Message>> getMessages({int? maxMessages}) {
    throw UnimplementedError();
  }
}
