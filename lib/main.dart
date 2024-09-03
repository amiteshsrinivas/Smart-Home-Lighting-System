import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/login_page.dart';
import 'pages/welcome_page.dart';
import 'pages/room_selection_page.dart';
import 'pages/room_detail_page.dart';
import 'providers/light_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LightProvider()),
      ],
      child: MaterialApp(
        title: 'Smart Lighting App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Montserrat',
        ),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/welcome': (context) => WelcomePage(),
          '/rooms': (context) => RoomSelectionPage(),
          '/room_detail': (context) => RoomDetailPage(
            roomName: ModalRoute.of(context)!.settings.arguments as String,
          ),
        },
      ),
    );
  }
}
