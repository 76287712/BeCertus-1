

import 'package:becertus_proyecto/firebase.dart';
import 'package:becertus_proyecto/screens/Started/loading.dart';
import 'package:becertus_proyecto/screens/home_screen.dart';
import 'package:becertus_proyecto/screens/login_screen.dart';

import 'package:becertus_proyecto/screens/performance_screen.dart';
import 'package:becertus_proyecto/screens/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'widgets/Graphics/column_chart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "BEUCAL",
    options: firebaseOptions,
  ); 
  //agregarNotas('kDkChIpT6jK1gIemu3kX');
  await initializeDateFormatting('es', null);
  runApp( MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter demo',
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: const Color.fromARGB(255, 230, 230, 230),
                displayColor: Colors.white,
              )),
      home: HomeScreen(),
      routes: {
        '/myperformance': (context) => MyPerformance()
      },
    );
  }
}
