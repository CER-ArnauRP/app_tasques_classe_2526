
import 'package:app_tasques_classe_2526/pagines/pagina_principal/pagina_principal_gran.dart';
import 'package:app_tasques_classe_2526/pagines/pagina_principal/pagina_principal_mitjana.dart';
import 'package:app_tasques_classe_2526/pagines/pagina_principal/pagina_principal_petita.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

/*

  El que volem: volem carregar tres pantalles diferents,
  segons la mida de la pantalla del dispositiu.
  - Pantalla petita: mòbil (amplada < 600)
  - Pantalla mitjana: tablet (600 <= amplada < 1200)
  - Pantalla gran: escriptori (amplada >= 1200)

  MediaQuery.of(context).size.width ens dona l'amplada.

  If ternari: condició ? valor_si_cert : valor_si_fals


  Saber mides de pantalla:
  ========================
  MediaQuery.of(context).size.width ens dona l'amplada.

  Saber orientació dispositiu:
  ============================
  MediaQuery.of(context).orientation
    - Ens diu Orientation.portrait (mòbil vertical) o Orientation.landscape (mòbil horitzontal).
  
  Saber tipus de dispositiu:
  ==========================
  kIsWeb: true si és web, false si és mòbil o escriptori.
  Platform.isAndroid, Platform.isWindows, Platform.isLinux


*/

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    //final bool dispositiuWeb = kIsWeb;// Amb la bombeta demana un import del package foundation.
    //print(  'El dispositiu és web? $dispositiuWeb');
    
    Size midaPantalla = MediaQuery.of(context).size;

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: midaPantalla.width < 600 ? 
        appMobil() : 
        midaPantalla.width >= 600 && midaPantalla.width < 1200 ? 
          appTablet() : 
          appDesktop(),
    );
  }
}

Widget appMobil() {
  return PaginaPrincipalPetita();
}

Widget appTablet() {
  return PaginaPrincipalMitjana();
}

Widget appDesktop() {
  return PaginaPrincipalGran();
}