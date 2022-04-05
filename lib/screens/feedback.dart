import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedBackPage extends StatelessWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FeedBack Form"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('open form'),
          onPressed: () {
            showDialog(
              context: context, builder: (context) => const FeedBackDialog());
          },
        ),
      ),
    );
  }
}

class FeedBackDialog extends StatefulWidget {
  const FeedBackDialog({Key? key}) : super(key: key);

  @override
  State<FeedBackDialog> createState() => _FeedBackDialogState();
}

class _FeedBackDialogState extends State<FeedBackDialog> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void diposee() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
          key: _formKey,
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              hintText: 'Enter your feedback here',
              filled: true,
            ),
            maxLines: 5,
            maxLength: 4096,
            textInputAction: TextInputAction.done,
            validator: (String? text) {
              if (text == null || text.isEmpty) {
                return 'Please enter a value';
              }
              return null;
            },
          )),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
        TextButton(
            onPressed: () async {
              //code to send the necessary data to cloud firestore
            },
            child: const Text('Send')),
      ],
    );
  }
}
