import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat;

import '../../model/message.dart' as model;
import '../../service/race_service.dart';
import '../../service/service_registry.dart';

class ChatPage extends StatefulWidget {
  final chat.User _user;
  final RaceService _raceService;

  ChatPage(this._raceService, {super.key, required String playerId})
      : _user = chat.User(
          id: playerId,
          firstName: 'YOU',
          role: chat.Role.user,
        );

  @override
  State<ChatPage> createState() => _ChatPageState(_raceService, _user);
}

@override
class _ChatPageState extends State<ChatPage> {
  final RaceService _raceService;
  final chat.User _user;

  _ChatPageState(this._raceService, this._user);

  List<chat.Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _raceService
        .getMessages(maxMessages: 50)
        .listen((updatedMessages) => _updateMessages(updatedMessages));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Baldy Dash 2023'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Chat(
            messages: _messages,
            showUserNames: true,
            user: _user,
            onSendPressed: (partialText) =>
                _raceService.sendMessage(partialText.text),
          ),
        ),
      );

  void _updateMessages(final List<model.Message> updatedMessages) {
    setState(() => _messages = updatedMessages
        .map((modelMessage) => chat.TextMessage(
              id: modelMessage.id,
              author: _user,
              createdAt: modelMessage.timestamp.millisecondsSinceEpoch,
              text: modelMessage.text,
            ))
        .toList());
  }
}
