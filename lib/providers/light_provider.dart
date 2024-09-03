import 'package:flutter/material.dart';
import '../models/light_model.dart';
import 'dart:async';

class LightProvider with ChangeNotifier {
  final Map<String, List<Light>> _rooms = {
    'Living Room': [
      Light(name: 'Ceiling Light'),
      Light(name: 'Table Lamp'),
      Light(name: 'Floor Lamp'),
    ],
    'Bedroom': [
      Light(name: 'Bedside Lamp'),
      Light(name: 'Wardrobe Light'),
    ],
    'Kitchen': [
      Light(name: 'Ceiling Light'),
      Light(name: 'Cabinet Light'),
    ],
  };

  List<String> getRooms() => _rooms.keys.toList();

  List<Light> getLights(String roomName) {
    return _rooms[roomName] ?? [];
  }

  void toggleLight(String roomName, String lightName) {
    final lights = _rooms[roomName];
    if (lights != null) {
      final light = lights.firstWhere((light) => light.name == lightName);
      light.isOn = !light.isOn;
      notifyListeners();
    }
  }

  void setTimer(String roomName, String lightName, DateTime time) {
    final lights = _rooms[roomName];
    if (lights != null) {
      final light = lights.firstWhere((light) => light.name == lightName);
      light.scheduledTime = time;
      Timer(time.difference(DateTime.now()), () {
        light.isOn = true;
        notifyListeners();
      });
    }
  }
}
