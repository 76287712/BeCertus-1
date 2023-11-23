import 'package:becertus_proyecto/widgets/dashboard/global/range_jobs.dart';
import 'package:becertus_proyecto/widgets/dashboard/jobs/jobs_screen.dart/analisis_datos.dart';
import 'package:flutter/material.dart';

class AverageFutureJob extends StatefulWidget {
  const AverageFutureJob({
    Key? key,
    required this.textFutureJob,
    required this.progressValue,
    required this.pathImages,
    required this.pageJob
  }) : super(key: key);

  final String textFutureJob;
  final double progressValue;
  final String pathImages;
  final dynamic pageJob;
  @override
  State<AverageFutureJob> createState() => _AverageFutureJobState();
}

class _AverageFutureJobState extends State<AverageFutureJob> {
  bool showAlternateContent = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.pageJob));
      },
       style: ElevatedButton.styleFrom(
       primary: Colors.transparent,
       elevation: 0 ,
      padding: EdgeInsets.all(4)
  ),
      child: Container(
          
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(1, 1),
                  blurRadius: 3.5,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(widget.pathImages),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: buildDefaultContent()),
    );
  }

  Widget buildDefaultContent() {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.20,
        decoration: const BoxDecoration(
            //image: DecorationImage(image: AssetImage('assets/images/jobs/analista-datos.png'))
            ),
        child: Center(
          child: ProgressBarDeterminateStyle(
            progressValue: widget.progressValue,
          ),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.10,
        width: MediaQuery.of(context).size.width * 0.45,
        padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.textFutureJob,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Mitr',
                fontWeight: FontWeight.w500,
                color: Color(0xff323232),
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              child: Text(
                'Ver Más',
                style: TextStyle(color: Color(0xff0BB49D), fontSize: 12),
                textAlign: TextAlign.end,
              ),
            )
          ],
        ),
      ),
    ]);
  }

  Widget buildAlternateContent(String alternateText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showAlternateContent = false;
        });
      },
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.50,
            child: Text(
              alternateText,
              style: TextStyle(fontSize: 18, color: Color(0xff323232)),
            ),
          ),
          Icon(Icons
              .arrow_back_ios_rounded), // Cambiar a la flecha hacia la izquierda
        ],
      ),
    );
  }
}