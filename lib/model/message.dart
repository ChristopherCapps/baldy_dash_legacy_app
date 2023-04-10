import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'message.g.dart';

@JsonSerializable()
@immutable
class Message extends Equatable {
  final String id;
  final String authorId;
  final DateTime timestamp;
  final String text;
  final String? photoUrl;

  const Message(
      {required this.id,
      required this.authorId,
      required this.timestamp,
      required this.text,
      this.photoUrl});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, Object?> toJson() => _$MessageToJson(this);

  @override
  List<Object> get props => ['authorId', 'timestamp', 'text', 'photoUrl'];

  @override
  bool get stringify => true;
}
