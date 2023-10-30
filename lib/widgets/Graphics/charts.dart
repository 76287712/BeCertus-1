
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

///////////GENERAL//////////////////////////////////////////
// PROMEDIOS GENERALES  DE CADA CURSO
final double proII = (nd1ProII+nd2ProII+nd3ProII)/ 3;
final double creaII = (nd1CreaII+nd2CreaII+nd3CreaII)/3;
final double ctI = (nd1CtI+nd2CtI +nd3CtI)/3;
final double thcaI = (nd1ThcaI+nd2ThcaI+nd3ThcaI)/3;
final double fisica = (nd1Fisica+nd2Fisica+nd3Fisica)/3;
final double englishI = (nd1EnglishI+nd2EnglishI+nd3EnglishI)/3;
//GENERAL POR CATEGORIA
final double VED = (proII + creaII) / 2;
double ED = double.parse(VED.toStringAsFixed(1));

final dynamic VFP = (ctI + thcaI + fisica) / 3;
double FP = double.parse(VFP.toStringAsFixed(1)); 

final dynamic VEG = englishI;
double EG = double.parse(VEG.toStringAsFixed(1)); 

//////////////ND1//////////////////////////////////////////
// PROMEDIOS DE ND1
final double nd1ProII = 20;
final double nd1CreaII = 20;
final double nd1CtI = 18;
final double nd1ThcaI = 13;
final double nd1Fisica = 20;
final double nd1EnglishI = 17;
// Promedio general de "ND1"
final double nd1VED = (nd1ProII + nd1CreaII) / 2;
double nd1ED = double.parse(nd1VED.toStringAsFixed(1));

final double nd1VFP = (nd1CtI + nd1ThcaI + nd1Fisica) / 3;
double nd1FP = double.parse(nd1VFP.toStringAsFixed(1)); 

final double nd1VEG = nd1EnglishI;
double nd1EG = double.parse(nd1VEG.toStringAsFixed(1)); 
//////////////ND2//////////////////////////////////////////
// PROMEDIOS DE ND2
final double nd2ProII = 15;
final double nd2CreaII = 15;
final double nd2CtI = 18;
final double nd2ThcaI = 17;
final double nd2Fisica = 20;
final double nd2EnglishI = 14;

// Promedio general de "ND2"
final double nd2VED = (nd2ProII + nd2CreaII) / 2;
double nd2ED = double.parse(nd2VED.toStringAsFixed(1));

final double nd2VFP = (nd2CtI + nd2ThcaI + nd2Fisica) / 3;
double nd2FP = double.parse(nd2VFP.toStringAsFixed(1)); 

final double nd2VEG = nd2EnglishI;
double nd2EG = double.parse(nd2VEG.toStringAsFixed(1));

//////////////ND3//////////////////////////////////////////
// PROMEDIOS DE ND3
final double nd3ProII = 18;
final double nd3CreaII = 18;
final double nd3CtI = 18;
final double nd3ThcaI = 15;
final double nd3Fisica = 20;
final double nd3EnglishI = 14;

// Promedio general de "ND3"
final double nd3VED = (nd3ProII + nd3CreaII) / 2;
double nd3ED = double.parse(nd3VED.toStringAsFixed(1));

final double nd3VFP = (nd3CtI + nd3ThcaI + nd3Fisica) / 3;
double nd3FP = double.parse(nd3VFP.toStringAsFixed(1));

final double nd3VEG = nd3EnglishI;
double nd3EG = double.parse(nd3VEG.toStringAsFixed(1));
/////////////////////////////////////////////////////////////


class RadiusChartGen extends StatefulWidget {
  const RadiusChartGen({super.key});

  @override
  State<RadiusChartGen> createState() => _RadiusChartGenState();
}

class _RadiusChartGenState extends State<RadiusChartGen> {
  late List<GDPData> _chartData;
  String promedioTexto = ''; // Declarar la variable aquí

//Funcion parea sumar el promedio general
  @override
  void initState() {
    _chartData = getChartData();
    final List<GDPData> averageData = [
      GDPData(ED, Color(0xff0BB49D)),
      GDPData(FP, Color(0xff11D1B7)),
      GDPData(EG, Color(0xff61DDCC)),
    ];
    double calcularPromedio(List<GDPData> chartData) {
      if (chartData.isEmpty) {
        return 0.0; }

      double suma = 0.0;
      for (var data in chartData) {
        suma += data.course;
      }

      return suma / chartData.length;
    }

    double promedio = calcularPromedio(averageData);
    promedioTexto = promedio.toStringAsFixed(2); // Asignar el valor aquí

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,//double.infinity, // Ocupa todo el ancho disponible
      height:500, //double.infinity, // Ocupa todo el alto disponible
      child: SfCircularChart(
  
        series: <CircularSeries>[
          RadialBarSeries<GDPData, dynamic>(
            dataSource: _chartData,
            useSeriesColor: true,
            trackOpacity: 0.3,
            innerRadius: '50%',
            xValueMapper: (GDPData data, _) => data.course,
            yValueMapper: (GDPData data, _) => data.course,
            pointColorMapper: (GDPData data, _) => data.color,
            maximumValue: 20,
            trackBorderWidth: 5,
            cornerStyle: CornerStyle.bothCurve,
            dataLabelMapper: (GDPData data, _) => data.course.toString(),
          ),
        ],
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Center(
              child: Text(
                promedioTexto, // Coloca el número que desees
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Mitr',
                    color: Color.fromARGB(255, 52, 52, 52),
                    letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
      
    );
    
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
     GDPData(ED, Color(0xff069884)),
      GDPData(FP, Color(0xffF79521)),
      GDPData(EG, Color(0xffC9D32B)),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.course, this.color);
  final dynamic course;
  // final double gdp;
  final Color color;
}



//CONVERSION A STRINGS 
String proIIString = proII.toStringAsFixed(1);
String creaIIString = creaII.toStringAsFixed(1);
String ctIString = ctI.toStringAsFixed(1);
String thcaIString = thcaI.toStringAsFixed(1);
String fisicaString = fisica.toStringAsFixed(1);
String englishIString = englishI.toStringAsFixed(1);

// PROMEDIOS DE ND1
String string_nd1ProII = nd1ProII.toStringAsFixed(1);
String string_nd1CreaII = nd1CreaII.toStringAsFixed(1);
String string_nd1CtI = nd1CtI.toStringAsFixed(1);
String string_nd1ThcaI = nd1ThcaI.toStringAsFixed(1);
String string_nd1Fisica = nd1Fisica.toStringAsFixed(1);
String string_nd1EnglishI = nd1EnglishI.toStringAsFixed(1);

// PROMEDIOS DE ND2
String string_nd2ProII = nd2ProII.toStringAsFixed(1);
String string_nd2CreaII = nd2CreaII.toStringAsFixed(1);
String string_nd2CtI = nd2CtI.toStringAsFixed(1);
String string_nd2ThcaI = nd2ThcaI.toStringAsFixed(1);
String string_nd2Fisica = nd2Fisica.toStringAsFixed(1);
String string_nd2EnglishI = nd2EnglishI.toStringAsFixed(1);

// PROMEDIOS DE ND3
String string_nd3ProII = nd3ProII.toStringAsFixed(1);
String string_nd3CreaII = nd3CreaII.toStringAsFixed(1);
String string_nd3CtI = nd3CtI.toStringAsFixed(1);
String string_nd3ThcaI = nd3ThcaI.toStringAsFixed(1);
String string_nd3Fisica = nd3Fisica.toStringAsFixed(1);
String string_nd3EnglishI = nd3EnglishI.toStringAsFixed(1);

// Crear un mapa con los nombres de los cursos como claves y los puntajes promedio como valores
