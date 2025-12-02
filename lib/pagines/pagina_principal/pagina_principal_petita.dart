import 'package:app_tasques_classe_2526/colors_app.dart';
import 'package:app_tasques_classe_2526/components/dialog_nova_tasca.dart';
import 'package:app_tasques_classe_2526/components/item_tasca.dart';
import 'package:flutter/material.dart';

class PaginaPrincipalPetita extends StatelessWidget {
  const PaginaPrincipalPetita({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return ItemTasca(valorText: index.toString(),);
              },
            ),
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
