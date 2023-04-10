import 'package:flutter/material.dart';
import '../../service/service_registry.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/baldy-dash-home.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    ServiceRegistry.I.raceService,
                    playerId: ServiceRegistry.I.settings.uuid,
                  ),
                ),
              );
            },
            child: const Text('LET\'S PLAY!'),
          ),
        ],
      ));
}
