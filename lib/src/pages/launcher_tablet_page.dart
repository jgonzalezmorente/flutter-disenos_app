import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenos_app/src/models/layout_model.dart';
import 'package:disenos_app/src/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenos_app/src/routes/routes.dart';


class LauncherTabletPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final appTheme    = Provider.of<ThemeChanger>( context );
    final layoutModel = Provider.of<LayoutModel>( context );
    
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Diseños en Flutter - Tableta' ),
        backgroundColor: appTheme.currentTheme.colorScheme.secondary,
      ),
      drawer: _MenuPrincipal(),
      //body: _ListaOpciones(),
      body: Row(
        children: [
          Container(
            width: 300,
            height: double.infinity,
            child: _ListaOpciones(),
          ),

          Container(
            width: 1,
            height: double.infinity,
            color: ( appTheme.darkTheme ) ? Colors.grey : appTheme.currentTheme.colorScheme.secondary
          ),

          Expanded(
            child: layoutModel.currentPage
          )
        ],
      )
   );
  }
}

class _ListaOpciones extends StatelessWidget {
  
  const _ListaOpciones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>( context ).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: ( context, i ) => Divider(
        color: currentTheme.primaryColorLight,
      ), 
      itemCount: pageRoutes.length,
      itemBuilder: ( context, i ) => ListTile(
        leading: FaIcon( pageRoutes[i].icon, color: currentTheme.colorScheme.secondary ),
        title: Text( pageRoutes[i].titulo ),
        trailing: Icon( Icons.chevron_right, color: currentTheme.colorScheme.secondary ),
        onTap: () {

          final layoutModel = Provider.of<LayoutModel>( context, listen: false );
          layoutModel.currentPage = pageRoutes[ i ].page;
         
        }
      ), 
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  
  const _MenuPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appTheme    = Provider.of<ThemeChanger>( context );
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.only( top: 10 ),
                width: double.infinity,
                height: 200,                
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text( 'JA', style: TextStyle( fontSize: 50 ), ),
                )
              ),
            ),

            Expanded(
              child: _ListaOpciones()
            ),

            ListTile(
              leading: Icon( Icons.lightbulb_outline, color: accentColor ),
              title: Text( 'Dark Mode' ),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
                onChanged: ( value ) => appTheme.darkTheme = value
              ),                
            ),

           SafeArea(
             bottom: true,
             top: false,
             left: false,
             right: false,
             child: ListTile(
                leading: Icon( Icons.lightbulb_outline, color: accentColor ),
                title: Text( 'Custom Theme' ),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: accentColor,
                  onChanged: ( value ) => appTheme.customTheme = value
                ),
              ),
           ),

          ],
        ),
      ),
    );
  }
}