import 'package:app_tasques_classe_2526/colors_app.dart';
import 'package:flutter/material.dart';

class TextfieldPersonalitzat extends StatelessWidget {
  const TextfieldPersonalitzat({super.key});

  @override
  Widget build(BuildContext context) {

    return TextField(

      cursorColor: ColorsApp.colorPrimariAccent2,
      cursorWidth: 3,

      style: TextStyle(
        color: ColorsApp.colorPrimari,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),

      decoration: InputDecoration(
        hint: Row(
          children: [
            Icon(Icons.edit, color: ColorsApp.colorPrimariAccent2,),
            SizedBox(width: 10),
            Text(
              "Introdueix la teva tasca...",
              style: TextStyle(
                color: ColorsApp.colorPrimariAccent2,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        filled: true,
        fillColor: ColorsApp.colorMarroClar,

        // Aspecte de la bora quan el TextField esta habilitat.
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorsApp.colorPrimari, width: 2),
        ),

        // Aspecte de la bora quan el TextField està en focus (cursor a dins).
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.colorPrimariAccent2, width: 3),
        ),

      ),
    );
  }
}