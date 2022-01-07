import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';



class SlideshowPage extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {

    bool isLarge = MediaQuery.of( context ).size.height > 500;

    final children = [
        Expanded(child: MiSlideshow()),
        Expanded(child: MiSlideshow()),
      ];

    return Scaffold(      
      body: ( isLarge ) 
        ? Column( children: children )
        : Row( children: children )
    );
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appTheme    = Provider.of<ThemeChanger>( context );
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Center(        
      child: Slideshow(
        bulletPrimario: 12,
        bulletSecundario: 12,          
        colorPrimario: appTheme.darkTheme 
          ? accentColor
          : Color(0xffFF5A7E),
        slides: [
          SvgPicture.asset( 'assets/svgs/slide-1.svg' ),
          SvgPicture.asset( 'assets/svgs/slide-2.svg' ),
          SvgPicture.asset( 'assets/svgs/slide-3.svg' ),
          SvgPicture.asset( 'assets/svgs/slide-4.svg' ),
          SvgPicture.asset( 'assets/svgs/slide-5.svg' ),
        ]
      )
    );
  }
}

