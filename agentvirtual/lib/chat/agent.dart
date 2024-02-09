import 'package:agentvirtual/api/message_models.dart';
import 'package:agentvirtual/api/response.models.dart';
import 'package:agentvirtual/chatbubble/chat_item.dart';
import 'package:agentvirtual/data/virtual.dart';
import 'package:flutter/material.dart';

class MyVirtualAgent extends StatefulWidget {
  const MyVirtualAgent({super.key});

  @override
  State<MyVirtualAgent> createState() => _MyVirtualAgentState();
}

class _MyVirtualAgentState extends State<MyVirtualAgent> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, BubblePosition>> _messages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Agent'),
      ),
      body: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChatItem(
                            position: _messages[index].values.first,
                            message:
                                Message(content: _messages[index].keys.first));
                      },
                    ),
                  ],
                ),
              ),
              _textField(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Type a message',
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              _messages.add({'You: ${_controller.text}': BubblePosition.right});
              setState(() {
                _controller.clear();
              });
              VirtualAgentResponse response =
                  await VirtualAgentAPI.getResponseFromAgent(_controller.text);
              _messages
                  .add({'Agent: ${response.choices?[0]}': BubblePosition.left});

              setState(() {});
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
