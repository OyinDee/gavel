import 'package:flutter/material.dart';
import 'package:gavel/ui/about.dart';
import 'package:gavel/ui/contacts.dart';
import 'package:gavel/ui/dashboard.dart';
import 'package:gavel/ui/dispost.dart';
import 'package:gavel/ui/onboarding.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.ubuntuTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/about': (context) => const About(),
        '/contact': (context) => const Contact(),
        '/dashboard': (context) => const DashBoard(),
        '/post': (context) => const Posts(),
      },
      debugShowCheckedModeBanner: false,
    ));
  }
}
