import 'package:disenos_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList()
          )

        ],
      ),
   );
  }
}


class _BotonNewList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double widthPantalla = MediaQuery.of( context ).size.width;
    final appTheme       = Provider.of<ThemeChanger>( context );

    if ( widthPantalla > 500 ) {
      widthPantalla -= 300;
    }

    return ButtonTheme(
      minWidth: widthPantalla * 0.9,
      height: 100,
      child: MaterialButton(
        onPressed: () {},
        color: ( appTheme.darkTheme )
          ? appTheme.currentTheme.colorScheme.secondary 
          : Color(0xffed6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only( topLeft: Radius.circular( 50 ) )
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: ( appTheme.darkTheme )
              ? appTheme.currentTheme.scaffoldBackgroundColor
              : Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
          )
        )
      )
    );
  }

}

class _MainScroll extends StatelessWidget {
  
  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),    
  ];  

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>( context ).currentTheme;
    
    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Colors.red,
        //   title: Text( 'Hola Mundo'),
        //   centerTitle: true,
        // ),

        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheight: 200,
            maxheight: 230,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.scaffoldBackgroundColor,
              child: _Titulo()
            )
          )
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox( height: 100 )
          ])
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minheight,
    required this.maxheight,
    required this.child,

  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand( child: child );
  }

  @override  
  double get maxExtent => maxheight;

  @override  
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
           minheight != oldDelegate.minheight ||
           child != oldDelegate.child;
  }

}

class _Titulo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>( context );

    return Column(
      children: [
        SizedBox( height: 35 ),
        Container(
          margin: EdgeInsets.only( left: 30, right: 30, bottom: 10, top: 20 ),
          child: Text(
            'New', 
            style: TextStyle(
              color: ( appTheme.darkTheme ) 
                ? Colors.grey
                : Color(0xff532128), 
              fontSize: 50 )
            ),          
        ),
        Stack(
          children: [

            SizedBox( width: 100 ),

            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: ( appTheme.darkTheme ) 
                  ? Colors.grey
                  : Color( 0xfff7cdd5)
              ),
            ),

            Container(
              child: Text(
                'List', 
                style: TextStyle(
                  color: Color( 0xffd93a30), 
                  fontSize: 50, 
                  fontWeight: FontWeight.bold
                )
              ),
            ),


          ],
        )
      ],
    );
  }
}

// class _ListaTareas extends StatelessWidget {


//   final items = [
//     _ListItem( 'Orange', Color(0xffF08F66) ),
//     _ListItem( 'Family', Color(0xffF2A38A) ),
//     _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
//     _ListItem( 'Books', Color(0xffFCEBAF) ),
//     _ListItem( 'Orange', Color(0xffF08F66) ),
//     _ListItem( 'Family', Color(0xffF2A38A) ),
//     _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
//     _ListItem( 'Books', Color(0xffFCEBAF) ),
//   ];  

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: ( BuildContext context, int index ) => items[ index ]
//     );
//   }
// }

class _ListItem extends StatelessWidget {

  final String titulo;
  final Color color;

  const _ListItem( this.titulo, this.color );

  @override
  Widget build(BuildContext context) {
    
    final appTheme = Provider.of<ThemeChanger>( context );
    
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all( 30 ),
      child: Text(
        this.titulo, 
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold, 
          fontSize: 20 )
        ),
      height: 130,
      margin: EdgeInsets.all( 10 ),
      decoration: BoxDecoration(
        color: ( appTheme.darkTheme )
          ? Colors.grey
          : this.color,
        borderRadius: BorderRadius.circular( 30 )
      ),
    );
  }
}