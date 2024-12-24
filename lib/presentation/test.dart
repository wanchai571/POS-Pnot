import 'package:flutter/material.dart';
import 'package:pos/button_listener.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    CustomButtonListener.onButtonPressed = (event) {
      setState(() {
        if (event != null) {
          _controller.text = event;
          _focusNode.requestFocus();
        }
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: SizedBox(
          width: 250,
          child: TextFormField(
            focusNode: _focusNode,
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
