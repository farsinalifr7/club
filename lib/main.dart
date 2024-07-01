import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:club/pages/intro_page.dart';
import 'package:club/provider/club_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: "basic_channel",
        channelName: "Notification",
        channelDescription: "this is description",
        // importance: NotificationImportance.High,
        // soundSource: "resource://raw/notifi",
        playSound: true,
      )
    ],
    debug: true,
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ClubProvider(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: IntroPage(),
        ));
  }
}
