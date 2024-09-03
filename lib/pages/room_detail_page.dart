import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/light_provider.dart';
import '../widgets/light_control_widget.dart';

class RoomDetailPage extends StatelessWidget {
  final String roomName;

  RoomDetailPage({required this.roomName});

  @override
  Widget build(BuildContext context) {
    final lightProvider = Provider.of<LightProvider>(context);
    final lights = lightProvider.getLights(roomName);

    return Scaffold(
      appBar: AppBar(
        title: Text('$roomName Details'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: ListView.builder(
          itemCount: lights.length,
          itemBuilder: (context, index) {
            return LightControlWidget(
              light: lights[index],
              roomName: roomName,
            );
          },
        ),
      ),
    );
  }
}
