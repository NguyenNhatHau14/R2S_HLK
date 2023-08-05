import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    // EasyLoading.dismiss();
    EasyLoading.showSuccess('Use in initState');
    EasyLoading.addStatusCallback(statusCallback);
  }

  @override
  void deactivate() {
    EasyLoading.dismiss();
    EasyLoading.removeCallback(statusCallback);
    super.deactivate();
  }

  void statusCallback(EasyLoadingStatus status) {
    print('Test EasyLoading Status $status');
  }

  void loadData() async {
    try {
      await EasyLoading.show();
      HttpClient client = HttpClient();
      HttpClientRequest request =
          await client.getUrl(Uri.parse('https://github.com'));
      HttpClientResponse response = await request.close();
      print(response);
      await EasyLoading.dismiss();
    } catch (e) {
      await EasyLoading.showError(e.toString());
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('loadData'),
          onPressed: () async {
            // loadData();

            EasyLoading.show(status: 'loading...');
            await Future.delayed(const Duration(seconds: 5));

            EasyLoading.dismiss();
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
