// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as String,
      authorId: json['authorId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      text: json['text'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'timestamp': instance.timestamp.toIso8601String(),
      'text': instance.text,
      'photoUrl': instance.photoUrl,
    };
