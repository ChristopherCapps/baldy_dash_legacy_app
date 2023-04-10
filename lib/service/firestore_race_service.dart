import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/message.dart';
import 'race_service_support.dart';

class FirestoreRaceService extends RaceServiceSupport {
  static FirestoreRaceService? _instance;

  final FirebaseFirestore _db;
  final String _sessionId;

  FirestoreRaceService._(super.playerId, this._sessionId, this._db) {
    _instance = this;
  }

  static Future<FirestoreRaceService> init(
      final String playerId, final FirebaseFirestore db) async {
    final sessionId = (await db.collection('legacy').doc('bootstrap').get())
        .data()!['sessionId'] as String;
    final playersCollection = db.collection('legacy/$sessionId/players');
    final snapshot = await playersCollection.doc(playerId).get();
    if (!snapshot.exists) {
      await playersCollection.doc(playerId).set({});
    }

    return FirestoreRaceService._(playerId, sessionId, db);
  }

  static FirestoreRaceService get I => FirestoreRaceService._instance!;

  CollectionReference get _playersCollection =>
      _db.collection('legacy/$_sessionId/players');

  DocumentReference get _playerDocument => _playersCollection.doc(playerId);

  @override
  Stream<List<Message>> getMessages({int? maxMessages}) => _playerDocument
      .collection('messages')
      .orderBy('timestamp', descending: true)
      .limitToLast(maxMessages ?? 200)
      .snapshots()
      .map(
        (snapshot) => snapshot.docs.fold<List<Message>>(
          [],
          (listOfMessages, doc) {
            final data = doc.data();
            data['id'] = doc.id;
            data['timestamp'] =
                (data['timestamp'] as Timestamp).toDate().toIso8601String();
            return [...listOfMessages, Message.fromJson(data)];
          },
        ),
      );
}
