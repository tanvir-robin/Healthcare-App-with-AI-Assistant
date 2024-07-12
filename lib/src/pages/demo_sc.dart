import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:health_care_ex/src/model/dactor_model.dart';

class Demo extends StatefulWidget {
  Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  late List<DoctorModel> doctorDataList;

  String? responseText;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (responseText != null) Text(responseText!),
              TextField(
                decoration: InputDecoration(
                    suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          print('sss');
                        },
                        icon: Icon(Icons.image)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.attachment),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.send),
                  ],
                )),
                controller: controller,
              ),
              ElevatedButton(
                onPressed: initiateGemini,
                child: Text('Upload Doctors'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initiateGemini() async {
    final apiKey = dotenv.env['gemini_api'];
    if (apiKey == null) {
      print('No \$API_KEY environment variable');
      return;
    }

    // The Gemini 1.5 models are versatile and work with most use cases
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: apiKey);
    final content = [Content.text(controller.text)];
    final response = await model.generateContent(content);

    responseText = response.text;

    setState(() {});
  }
}
