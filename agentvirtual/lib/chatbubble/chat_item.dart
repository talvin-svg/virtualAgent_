import 'package:agentvirtual/api/model.dart';
import 'package:flutter/material.dart';

enum BubblePosition { left, right }

class ChatItem extends StatelessWidget {
  final BubblePosition position;
  final Message message;
  final String lastSenderId;
  final String chatCode;
  const ChatItem(
      {super.key,
      required this.position,
      required this.message,
      required this.lastSenderId,
      required this.chatCode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          15, lastSenderId == message.senderId ? 0 : 15, 15, 5),
      child: Column(
        crossAxisAlignment: position == BubblePosition.left
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          _renderChatItem(
            context,
            position,
          ),
        ],
      ),
    );
  }

  Widget _renderChatItem(BuildContext context, BubblePosition position) {
    late Widget child;
    if (position == BubblePosition.left) {
      child = _renderLeftChat(context);
    } else {
      child = _renderRightChat(context);
    }

    return child;
  }

  Widget _renderLeftChat(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Text(
            message.content,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '${message.createdAt.toLocal().hour}:${message.createdAt.toLocal().minute}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderRightChat(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Text(
            message.content,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            '${message.createdAt.toLocal().hour}:${message.createdAt.toLocal().minute}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
