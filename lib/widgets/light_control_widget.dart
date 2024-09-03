import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/light_provider.dart';
import '../models/light_model.dart';

class LightControlWidget extends StatelessWidget {
  final Light light;
  final String roomName;

  LightControlWidget({required this.light, required this.roomName});

  @override
  Widget build(BuildContext context) {
    final lightProvider = Provider.of<LightProvider>(context);

    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(
          Icons.lightbulb,
          color: light.isOn ? Colors.yellow : Colors.grey,
          size: 30,
        ),
        title: Text(
          light.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              value: light.isOn,
              onChanged: (value) {
                lightProvider.toggleLight(roomName, light.name);
              },
            ),
            IconButton(
              icon: Icon(Icons.timer),
              onPressed: () async {
                final selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (selectedTime != null) {
                  final now = DateTime.now();
                  final scheduledTime = DateTime(
                    now.year,
                    now.month,
                    now.day,
                    selectedTime.hour,
                    selectedTime.minute,
                  );
                  lightProvider.setTimer(roomName, light.name, scheduledTime);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
