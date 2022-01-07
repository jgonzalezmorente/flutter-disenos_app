import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';



class CircularProgress extends StatefulWidget {

  @override
  _CircularProgressState createState() => _CircularProgressState();

}

class _CircularProgressState extends State<CircularProgress> with SingleTickerProviderStateMixin {

  AnimationController? controller;

  double porcentaje      = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {

    controller = new AnimationController( vsync: this, duration: Duration( milliseconds: 800 ) );
    controller?.addListener(() {      

      setState(() {

        porcentaje = lerpDouble( porcentaje, nuevoPorcentaje, controller!.value ) ?? porcentaje;        
        
      });


    });
    super.initState();

  }


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.refresh ),
        backgroundColor: Colors.pink,
        onPressed: () {
          
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if ( nuevoPorcentaje > 100 ) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }
          controller?.forward( from: 0.0 );
          setState(() {});
        }
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all( 5 ),
          width: 300,
          height: 300,
          //color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress( porcentaje ),
          )
        ),
      )
    );
  }

}


class _MiRadialProgress extends CustomPainter {

  final double porcentaje;

  _MiRadialProgress( this.porcentaje ); 

  @override
  void paint( Canvas canvas, Size size ) {

    // Círculo    
    final paint = new Paint()
      ..strokeWidth = 4
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

    final Offset center = new Offset( size.width * 0.5, size.height * 0.5 );
    final double radius  = min( size.width * 0.5, size.height * 0.5 );

    canvas.drawCircle( center, radius, paint );

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color       = Colors.pink
      ..style       = PaintingStyle.stroke;

    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * ( porcentaje / 100 );

    canvas.drawArc(
      Rect.fromCircle( center: center, radius: radius ), 
      -pi / 2 , 
      arcAngle, 
      false, 
      paintArco
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}