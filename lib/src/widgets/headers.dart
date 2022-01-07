import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class HeaderCuadrado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Container(

      height: 300,
      color: Color( 0xff615AAB )
      
    );
  }

}


class HeaderBordesRedondeados extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color( 0xff615AAB ),
        borderRadius: BorderRadius.only( 
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70)
        )
      ),
      
    );
  }

}         


class HeaderDiagonal extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,      
      height: double.infinity,      
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      )
    );
  }

}


class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color( 0xff615AAB );
    lapiz.style = PaintingStyle.fill; 
    lapiz.strokeWidth = 2;

    final path = Path();

    // Dibujar ocn el path y el lapiz
    path.moveTo( 0, size.height * 0.35 );
    path.lineTo( size.width, size.height * 0.30 );
    path.lineTo( size.width, 0 );
    path.lineTo( 0, 0 );    

    canvas.drawPath( path, lapiz );

    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {    
    return true;
  }

}

class HeaderTriangular extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,      
      height: double.infinity,      
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      )
    );
  }

}


class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color( 0xff615AAB );
    lapiz.style = PaintingStyle.fill; 
    lapiz.strokeWidth = 2;

    final path = Path();

    // Dibujar ocn el path y el lapiz
    path.lineTo( size.width, size.height );
    path.lineTo( size.width, 0 );

    canvas.drawPath( path, lapiz );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {    
    return true;
  }

}

class HeaderPico extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,      
      height: double.infinity,      
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      )
    );
  }

}


class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color( 0xff615AAB );
    lapiz.style = PaintingStyle.fill; 
    lapiz.strokeWidth = 2;

    final path = Path();

    // Dibujar ocn el path y el lapiz
    path.lineTo( 0, size.height * 0.25 );
    path.lineTo( size.width * 0.5, size.height * 0.3 );
    path.lineTo( size.width, size.height * 0.25 );
    path.lineTo( size.width, 0 );

    canvas.drawPath( path, lapiz );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {    
    return true;
  }  

}

class HeaderCurvo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,      
      height: double.infinity,      
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      )
    );
  }

}


class _HeaderCurvoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color( 0xff615AAB );
    lapiz.style = PaintingStyle.fill; 
    lapiz.strokeWidth = 2;

    final path = Path();

    // Dibujar ocn el path y el lapiz
    path.lineTo( 0, size.height * 0.25 );
    path.quadraticBezierTo( size.width * 0.5, size.height * 0.4, size.width, size.height * 0.25 );
    path.lineTo( size.width, 0 );
    //path.lineTo( size.width, size.height * 0.25 );

    canvas.drawPath( path, lapiz );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {    
    return true;
  }  

}

class HeaderWave extends StatelessWidget {

  final Color color;

  const HeaderWave({ required this.color } );

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,      
      height: double.infinity,      
      child: CustomPaint(
        painter: _HeaderWavePainter( this.color ),
      )
    );
  }

}


class _HeaderWavePainter extends CustomPainter {

  final Color color;

  _HeaderWavePainter( this.color );

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = this.color;
    lapiz.style = PaintingStyle.fill; 
    lapiz.strokeWidth = 2;

    final path = Path();

    // Dibujar ocn el path y el lapiz
    path.lineTo( 0, size.height * 0.25 );
    path.quadraticBezierTo( size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25 );
    path.quadraticBezierTo( size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25 );
    path.lineTo( size.width, 0 );

    canvas.drawPath( path, lapiz );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {    
    return true;
  }  

}


class HeaderWaveBottom extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,      
      height: double.infinity,      
      child: CustomPaint(
        painter: _HeaderWaveBottomPainter(),
      )
    );
  }

}


class _HeaderWaveBottomPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color( 0xff615AAB );
    lapiz.style = PaintingStyle.fill; 
    lapiz.strokeWidth = 2;

    final path = Path();

    // Dibujar ocn el path y el lapiz
    path.moveTo( 0, size.height );
    path.lineTo( 0, size.height * 0.75 );    
    path.quadraticBezierTo( size.width * 0.25, size.height * 0.70, size.width * 0.5, size.height * 0.75 );
    path.quadraticBezierTo( size.width * 0.75, size.height * 0.80, size.width, size.height * 0.75 );
    path.lineTo( size.width, size.height );

    canvas.drawPath( path, lapiz );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {    
    return true;
  }  

}


class HeaderWaveGradient extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,      
      height: double.infinity,      
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      )
    );
  }

}


class _HeaderWaveGradientPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = new Rect.fromCircle(
      center: Offset( 0.0, 55.0 ), 
      radius: 180.0
    );

    final Gradient gradiente = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff6d05e8),
        Color(0xffc012ff),
        Color(0xff6d05fa),
      ],
      stops: [
        0.2,
        0.5,
        1
      ]
    );

    final lapiz = Paint()..shader = gradiente.createShader(rect);

    // Propiedades    
    lapiz.style = PaintingStyle.fill; 
    lapiz.strokeWidth = 2;

    final path = Path();

    // Dibujar ocn el path y el lapiz
    path.lineTo( 0, size.height * 0.25 );
    path.quadraticBezierTo( size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25 );
    path.quadraticBezierTo( size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25 );
    path.lineTo( size.width, 0 );

    canvas.drawPath( path, lapiz );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {    
    return true;
  }  

}

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    required this.icon, 
    required this.titulo, 
    required this.subtitulo, 
    this.color1 = const Color(0xff526bf6),
    this.color2 = const Color(0xff67acf2),
    
    }
  );


  @override
  Widget build(BuildContext context) {
    
    final Color colorBlanco = Colors.white.withOpacity( 0.7 );  
    
    return Stack(
      children: [
        _IconHeaderBackground( this.color1, this.color2 ),

        Positioned(
          top: -50,
          left: -70,
          child: FaIcon( this.icon, size: 250, color: Colors.white.withOpacity( 0.2 ) )
        ),

        Column(
          children: [
            SizedBox( height: 80, width:  double.infinity ),
            Text( this.subtitulo, style: TextStyle( fontSize: 20, color: colorBlanco ) ),
            SizedBox( height: 20 ),
            Text( this.titulo, style: TextStyle( fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold ) ),
            FaIcon( this.icon, size: 80, color: Colors.white )
          ],
        )

      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;

  const _IconHeaderBackground( this.color1, this.color2 );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(        
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular( 80 ) ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            this.color1,
            this.color2
          ]
        )
      ),
      
    );
  }
}

