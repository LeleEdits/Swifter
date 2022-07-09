import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:swifter_app/app.dart';
import 'package:swifter_app/screens/screens.dart';
import 'package:swifter_app/screens/select_user_screen.dart';
import 'package:swifter_app/theme.dart';

void main() {
  final client = StreamChatClient(streamKey);

  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.client,
  }) : super(key: key);

  final StreamChatClient client;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: ThemeMode.dark,
        title: 'Swifter',
        builder: (context, child) {
          return StreamChatCore(
              client: client,
              child: ChannelsBloc(
                  child: UsersBloc(child: child!)
              ),
          );
        },
        home: const SelectUserScreen());
  }
}
