import 'package:flutter/material.dart';
import 'package:flutter_integration_test_example/result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController? _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Integration Test Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Form(
            key: _formKey,
            child: TextFormField(
              key: const Key('input-text-field'),
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Input Text',
              ),
              validator: (value) =>
                  value!.isEmpty ? 'Input at least one character' : null,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            await Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ResultPage(result: _controller!.text);
            }));
            _controller!.clear();
          }
        },
      ),
    );
  }
}
