
import 'package:becertus_proyecto/Students/screens/calendar.dart';
import 'package:becertus_proyecto/Students/screens/home.dart';
import 'package:becertus_proyecto/Students/screens/performance_screen.dart';
import 'package:becertus_proyecto/Students/screens/profile.dart';
import 'package:becertus_proyecto/Students/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  List<Widget> fragments =  [HomePage(), MyPerformance(), Calendar(), MyProfile(),];
  
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffafafa),
      ),
      child: Scaffold(
        
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        // appBar: CustomAppBar(),
        bottomNavigationBar: CustomeNavigationBar(onTab),
        body: fragments[currentIndex]
      ),
    );
  }

  onTab(int index) {
    
    setState(() {
      currentIndex = index;
    });
  }
}


