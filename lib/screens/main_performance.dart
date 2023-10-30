import 'package:becertus_proyecto/screens/home.dart';
import 'package:becertus_proyecto/widgets/Graphics/charts.dart';
import 'package:becertus_proyecto/widgets/chip_data.dart';
import 'package:flutter/material.dart';

import '../models/better_performance.dart';
import '../models/courses.dart';
import '../widgets/Graphics/column_chart.dart';

class MainPerformance extends StatefulWidget {
  const MainPerformance({super.key});

  @override
  State<MainPerformance> createState() => _MainPerformanceState();
}

class _MainPerformanceState extends State<MainPerformance> {
  
  String? selectedCourseKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Titles(
          text: 'Arquitectura',
          size: 24,
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.20,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(1, 3),
                  blurRadius: 3.5,
                ),
              ],
              color: Color(0XFFE7E2E2),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: ClipRRect(
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.48,
                  //height: 300,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: RadiusChartGen(),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.46,
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          chipData2(
                            '$ED',
                            0xff069884,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                              child: InfoCourses(
                                  'Cursos enfocados en estrategias de Diseño Arquitectonico')),
                        ],
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          chipData2(
                            '$FP',
                            0xffF79521,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(
                              child: InfoCourses(
                                  'Cursos de Formación Profesional')),
                        ],
                      ),
                      Row(
                        children: [
                          chipData2(
                            '$EG',
                            0xffC9D32B,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Expanded(child: InfoCourses('Estudios Generales')),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.25,
          child: GenColumnChart(selectedCourseKey)),
     
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var cursoKey in cursos.keys)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                       if (selectedCourseKey == cursoKey) {
                      selectedCourseKey = null; // Si ya está seleccionado, restablece el estado
                    } else {
                      selectedCourseKey = cursoKey; // De lo contrario, actualiza el elemento seleccionado
                    }// Actualizar el elemento seleccionado
                     });
                    },
                   
                    child: ChipContainer(
                      titulo: cursos[cursoKey]?['title'],
                      promedio: cursos[cursoKey]?['average'],
                      color: cursos[cursoKey]?['color'],
                      isSelected: selectedCourseKey == cursoKey,
                      
                    ),
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: _betterScore(context ),
        ),
      ],
    );
  }

Row _betterScore(BuildContext context) {
  Map<String, dynamic> bestCourseData = findBestCourse(betterPerformance);
  String bestCourseTitle = bestCourseData['title'];
  String bestCourseAverage = bestCourseData['average'].toStringAsFixed(1);

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Titles(text: 'Mejor Curso', size: 16),
          Container(
            width: MediaQuery.of(context).size.width * 0.46,
            height: MediaQuery.of(context).size.height * 0.11,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(1, 3),
                  blurRadius: 3.5,
                ),
              ],
              color: Color(0XFFE7E2E2),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(bestCourseTitle,
                style: TextStyle(color: Colors.amber),),
                Text(bestCourseAverage, style: TextStyle(color: Colors.amber),)
               // Text('Promedio: $bestCourseAverage'),
              ],
            ),
          ),
          
        ],
      ),
      Column(
        children: [
          Titles(text: 'Mejor Periodo', size: 16),
          Container(
            width: MediaQuery.of(context).size.width * 0.46,
            height: MediaQuery.of(context).size.height * 0.11,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(1, 3),
                  blurRadius: 3.5,
                ),
              ],
              color: Color(0XFFE7E2E2),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(bestCourseTitle,
                style: TextStyle(color: Colors.amber),),
               // Text('Promedio: $bestCourseAverage'),
              ],
            ),
          ),
          
        ],
      ),
    ],
  );
}

  Text InfoCourses(String text2) {
    return Text(
      text2,
      style: TextStyle(
        fontSize: 11,
        height: 1,
        fontWeight: FontWeight.w400,
        fontFamily: 'Mitr',
        color: Color(0xFF323232),
      ),
      textAlign: TextAlign.start,
    );
  }
}
