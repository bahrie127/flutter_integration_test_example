import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.result,
  }) : super(key: key);
  final String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result Page')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            result,
            style: const TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }
}
