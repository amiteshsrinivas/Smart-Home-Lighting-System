import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/light_provider.dart';

class RoomSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lightProvider = Provider.of<LightProvider>(context);
    final List<String> rooms = lightProvider.getRooms();

    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Room'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.teal],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: ListView.builder(
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.room, // Updated to a more general icon
                  color: Colors.blue, // Ensure this is a visible color
                  size: 30,
                ),
                title: Text(
                  rooms[index],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/room_detail',
                    arguments: rooms[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}