import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/response_entity_model.dart';
import '../networking/network_config.dart';
import '../networking/rest_client.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<String> _valueHelloWorld = ValueNotifier<String>('');

  String? domainValue;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _callDemoAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(
            Icons.settings,
            size: 20.0,
            color: Colors.white,
          ),
          onPressed: () => _showSettingsDialog(),
        ),
      ),
      body: Center(
        child: ValueListenableBuilder<String>(
          valueListenable: _valueHelloWorld,
          builder: (context, value, child) {
            return Text(value);
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future _callDemoAPI() async {
    final baseURL = NetworkConfig.instance.baseURL;
    final dio = Dio();
    final client = baseURL.isNotEmpty
        ? RestClient(dio, baseUrl: baseURL)
        : RestClient(dio);
    final ResponseEntity response = await client.getMessages();
    String result = '';
    if (response.meta?.code == 200) {
      debugPrint(response.data.toString());
      result = response.data.toString();
    } else {
      result = 'Oops..';
    }
    _valueHelloWorld.value = result;
    _valueHelloWorld.notifyListeners();
  }

  Future _showSettingsDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Domain URL'),
            content: TextField(
              controller: _controller..text = NetworkConfig.instance.baseURL,
              onChanged: (value) {
                domainValue = value;
              },
              decoration: const InputDecoration(hintText: "Domain URL"),
            ),
            actions: [
              MaterialButton(
                child: const Text('Save'),
                onPressed: () {
                  setState(() {
                    NetworkConfig.instance.baseUrl = _controller.text;
                    Navigator.pop(context);
                  });
                },
              )
            ],
          );
        });
  }
}
