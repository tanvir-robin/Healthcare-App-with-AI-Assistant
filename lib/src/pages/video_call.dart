import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class VideoCall extends StatefulWidget {
  const VideoCall({super.key});

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: dotenv.env['agora_app_id'].toString(),
      channelName: "primary-health",
      tempToken:
          '007eJxTYDCxFWz0TIyuLnyunLCHfXk0O/vO22Yvjc7llO7nFzngckGBwdQiLdnSONXAMDXRwMQw1TTRPNHQ0sQ41STVzNzcyCB5y4+LaQ2BjAznte4wMjJAIIjPx1BQlJmbWFSpm5GamFOSwcAAAPYaImA=',
    ),
    enabledPermission: [
      Permission.camera,
      Permission.microphone,
    ],
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(client: client),
              AgoraVideoButtons(client: client),
            ],
          ),
        ),
      ),
    );
  }
}
