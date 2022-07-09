import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:swifter_app/app.dart';
import 'package:swifter_app/screens/screens.dart';

import '../widgets/avatar.dart';
import '../widgets/display_error_message.dart';

class AllPeoplePage extends StatelessWidget {
  const AllPeoplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserListCore(
      limit: 20,
      filter: Filter.notEqual('id', context.currentUser!.id),
      emptyBuilder: (context) {
        return const Center(child: Text('There are no users'));
      },
      loadingBuilder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error) {
        return DisplayErrorMessage(error: error);
      },
      listBuilder: (context, items) {
        return Scrollbar(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return items[index].when(
                headerItem: (_) => const SizedBox.shrink(),
                userItem: (user) => _PeopleTile(user: user),
              );
            },
          ),
        );
      },
    );
  }
}

class _PeopleTile extends StatelessWidget {
  const _PeopleTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  Future<void> createChannel(BuildContext context) async {
    final core = StreamChatCore.of(context);
    final channel = core.client.channel('messaging', extraData: {
      'members': [
        core.currentUser!.id,
        user.id,
      ]
    });
    await channel.watch();

    Navigator.of(context).push(
      ChatScreen.routeWithChannel(channel),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        createChannel(context);
      },
      child: ListTile(
        leading: Avatar.small(url: user.image),
        title: Text(user.name),
      ),
    );
  }
}