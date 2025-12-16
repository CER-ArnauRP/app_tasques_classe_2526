
import 'package:app_tasques_classe_2526/data/repositori_tasca.dart';
import 'package:app_tasques_classe_2526/data/tasca.dart';
import 'package:app_tasques_classe_2526/pagines/pagina_principal/pagina_principal_gran.dart';
import 'package:app_tasques_classe_2526/pagines/pagina_principal/pagina_principal_mitjana.dart';
import 'package:app_tasques_classe_2526/pagines/pagina_principal/pagina_principal_petita.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {

  // flutter pub add <nom_dependència>

  // Per provar Hive en web, cal obrir-ho sempre amb el mateix port 
  //    (és igual quin, però el mateix). Les dades de Hive, es guarden
  //    en una carpeta temporal del navegador, i si es canvia de port,
  //    es considera un altre lloc, i no es troben les dades.
  //
  // Per orbrir (executar) l'aplicació en web amb un port concret,
  //    s'utilitza la següent comanda a la terminal:
  // flutter run -d chrome --web-port 58062
  // ****** Hem hagut de fer un find i replace de tots els List<Tasca> a List<dynamic> ******
  //   Per un problema de tipus de dades en Hive en web.

  // Inicialitzar Hive.
  WidgetsFlutterBinding.ensureInitialized();

  // El metode per inicialitzar Hive, es crida amb await.
  //    Això fa que el mètode main, hagi de ser async.
  //    I el tipus de retorn, Future<void>.
  //    aL fer servir mètodes amb await, abans, fer el 
  //    WidgetsFlutterBinding.ensureInitialized().
  await Hive.initFlutter();

  // Fem que faci servir l'adaptador de la classe Tasca (arxiu tasca.g.dart).
  //    Dins de tasca.g.dart, hi ha la classe TascaAdapter.
  Hive.registerAdapter(TascaAdapter());
  // Si tinguéssim més classes, hauríem de registrar els seus adapters també.

  // Obrim una box on hi haurà la llista de tasques.
  await Hive.openBox<List<dynamic>>(RepositoriTasca.nomBoxTasques);
  // Si tenim més boxs, hauríem de fer el mateix per a cadascuna.

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


  Dependències:
  =============
  S'afegeixen a l'arxiu pubspec.yaml, dins de "dependencies:".
  En una terminal fem: flutter pub add <nom_dependència>
  Instalem: flutter_slidable, hive, hive_flutter
    Si, per exemple, en el hive_flutter, ens dona error i diu 
      que necessitem habilitar scripts en l'ordinador, o ens diu
      que hem d'habilitar el mode desarrollador (developer), l'habilitem.
    
    Es poden consultar dependències disponibles a: https://pub.dev/

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