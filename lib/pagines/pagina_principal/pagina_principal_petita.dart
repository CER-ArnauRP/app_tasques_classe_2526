import 'package:app_tasques_classe_2526/colors_app.dart';
import 'package:app_tasques_classe_2526/components/dialog_nova_tasca.dart';
import 'package:app_tasques_classe_2526/components/item_tasca.dart';
import 'package:app_tasques_classe_2526/data/repositori_tasca.dart';
import 'package:app_tasques_classe_2526/data/tasca.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class PaginaPrincipalPetita extends StatefulWidget {
  const PaginaPrincipalPetita({super.key});

  @override
  State<PaginaPrincipalPetita> createState() => _PaginaPrincipalPetitaState();
}

class _PaginaPrincipalPetitaState extends State<PaginaPrincipalPetita> {
  @override
  Widget build(BuildContext context) {

    RepositoriTasca repositoriTasca = RepositoriTasca();

    return Scaffold(
      backgroundColor: ColorsApp.colorPrimari,
      appBar: AppBar(
        backgroundColor: ColorsApp.colorPrimariAccent,
        title: Text(
          "App Tasques", 
          style: TextStyle(
            color: ColorsApp.colorBlanc,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(
              Icons.person, 
              color: ColorsApp.colorBlanc,
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 2,
            decoration: BoxDecoration(
              color: ColorsApp.colorBlanc,
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                ),
              ],
            ),
          ),
          
          Expanded(
            // Com tot listener, s'executa sol quan "sent" ("listen") que passa algu. 
            //    En aquest cas, el "algu" és algun canvi en la box.
            //    El que s'executa automàticament, és el builder.
            child: ValueListenableBuilder(

              valueListenable: Hive.box<List<dynamic>>(RepositoriTasca.nomBoxTasques).listenable(), 

              // Amb el tooltip podem veure el valor que espera rebre.
              //    En aquest cas, espera rebre una funció que rep 3 parametres, 
              //    i retorna un Widget.
              //    El tercer paràmetre, és un Widget que podem passar.
              //    Si no es fa servir algun paràmetre, però l'hem de rebre, se li acostuma a 
              //    posar de nom "_". En el nostre cas, no el farem servir.
              //    Si el féssim servir, seria un widget, que el podríem utilitzar dins del builder.
              //    L'avantatge de passar aquest widget, és que no es tornar a construir quan es
              //    crida el builder (que es crida cada vegada que hi ha canvis a la llista).
              //    És una optimització.
              builder: (context, Box<List<dynamic>> boxTasques, _) {

                final llistaTasques = repositoriTasca.getLlistaTasques();

                return ListView.builder(

                  itemCount: llistaTasques.length,
                  
                  itemBuilder: (context, index) {
                    return ItemTasca(
                      valorText: llistaTasques[index].titol, 
                      indexTasca: index, 
                      valorInicialCheckbox: llistaTasques[index].completada,);
                  },

                );
              }
              
              
            ),
            
            /*ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return ItemTasca(valorText: index.toString(),);
              },
            ),*/
          ),
        ],
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorsApp.colorPrimariAccent,
            shape: CircleBorder(side: BorderSide(color: ColorsApp.colorBlanc, width: 2)),
            child: Icon(Icons.favorite, color: ColorsApp.colorBlanc,),
          ),

          SizedBox(height: 10,),

          FloatingActionButton(
            onPressed: () {
              obreDialogNovaTasca(context);
            },
            backgroundColor: ColorsApp.colorPrimariAccent,
            shape: CircleBorder(side: BorderSide(color: ColorsApp.colorBlanc, width: 2)),
            child: Icon(Icons.add, color: ColorsApp.colorBlanc,),
          ),
        ],
      ),
    );
  }

  void obreDialogNovaTasca(BuildContext context){

    // showDialog és una funció de Flutter que obre un Dialog que haguem creat/definit.
    showDialog(
      context: context, 
      builder: (context) {

        return DialogNovaTasca();
      },
    );
  }
}
