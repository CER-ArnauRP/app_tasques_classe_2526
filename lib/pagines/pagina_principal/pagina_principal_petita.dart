import 'package:app_tasques_classe_2526/colors_app.dart';
import 'package:flutter/material.dart';

class PaginaPrincipalPetita extends StatelessWidget {
  const PaginaPrincipalPetita({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.colorPrimari,
      appBar: AppBar(
        backgroundColor: ColorsApp.colorSecundari,
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

      body: Center(child: Text("Pantalla Petita")),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorsApp.colorSecundari,
            shape: CircleBorder(side: BorderSide(color: ColorsApp.colorBlanc, width: 2)),
            child: Icon(Icons.favorite, color: ColorsApp.colorBlanc,),
          ),

          SizedBox(height: 10,),

          FloatingActionButton(
            onPressed: () {},
            backgroundColor: ColorsApp.colorSecundari,
            shape: CircleBorder(side: BorderSide(color: ColorsApp.colorBlanc, width: 2)),
            child: Icon(Icons.add, color: ColorsApp.colorBlanc,),
          ),
        ],
      ),
    );
  }
}
