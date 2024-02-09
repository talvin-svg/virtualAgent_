import 'package:flutter/material.dart';

class MyVirtualAgent extends StatefulWidget {
  const MyVirtualAgent({super.key});

  @override
  State<MyVirtualAgent> createState() => _MyVirtualAgentState();
}

class _MyVirtualAgentState extends State<MyVirtualAgent> {
  TextEditingController _controller = TextEditingController();

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
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Virtual Agent',
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
            onPressed: () {},
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
