import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PinterestButton {
  
  final IconData icon;
  final void Function() onPressed;

  PinterestButton({ 
    required this.icon,
    required this.onPressed, 
  });
}


class PinterestMenu extends StatelessWidget {

  final bool mostrar;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  // final List<PinterestButton> items = [
  //   PinterestButton( icon: Icons.pie_chart, onPressed: () { print( 'Icon pie_chart'); } ),
  //   PinterestButton( icon: Icons.search, onPressed: () { print( 'Icon search'); } ),
  //   PinterestButton( icon: Icons.notifications, onPressed: () { print( 'Icon notifications'); } ),
  //   PinterestButton( icon: Icons.supervised_user_circle, onPressed: () { print( 'Icon supervised_user_circle'); } ),
  // ];

  PinterestMenu({
    this.mostrar         = true,
    this.backgroundColor = Colors.white,
    this.activeColor     = Colors.black,
    this.inactiveColor   = Colors.blueGrey,
    required this.items
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( _ ) => new _MenuModel(),
      builder: ( BuildContext context, Widget? widget ) {

        final menuModel = Provider.of<_MenuModel>( context, listen: false );
        
        menuModel.backgroundColor = this.backgroundColor;
        menuModel.activeColor     = this.activeColor;
        menuModel.inactiveColor   = this.inactiveColor;
                
        return AnimatedOpacity(
          duration: Duration( milliseconds: 200 ),
          opacity: ( mostrar ) ? 1 : 0,
          child: _PinterestMenuBackground(
            child: _MenuItems( items ),
          ),
        );
      },
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {

  final Widget child;
  
  const _PinterestMenuBackground({
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    
    final backgroundColor = Provider.of<_MenuModel>( context, listen: false ).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all( Radius.circular( 100 ) ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
          )
        ] 
      ),
    );
  }
}


class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;
  const _MenuItems( this.menuItems );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate( menuItems.length, ( i ) => _PinterestMenuItem( i, menuItems[i] ) ),
    );
  }
}

class _PinterestMenuItem extends StatelessWidget {
  
  final int index;
  final PinterestButton item;

  const _PinterestMenuItem( this.index, this.item );

  @override
  Widget build(BuildContext context) {

    final _MenuModel menuModel = Provider.of<_MenuModel>( context );

    return GestureDetector(
      onTap: () {
        menuModel.itemSeleccionado = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(    
        child: Icon( 
          item.icon,
          size: ( menuModel.itemSeleccionado == index ) ? 35 : 25,
          color: ( menuModel.itemSeleccionado == index ) ? menuModel.activeColor : menuModel.inactiveColor
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {

  int _itemSeleccionado = 0;
  Color backgroundColor = Colors.white;
  Color activeColor     = Colors.black;
  Color inactiveColor   = Colors.blueGrey;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado( int index ) {
    this._itemSeleccionado = index;
    notifyListeners();
  }
  
}
