class Light {
  final String name;
  bool isOn;
  DateTime? scheduledTime;

  Light({
    required this.name,
    this.isOn = false,
    this.scheduledTime,
  });
}
