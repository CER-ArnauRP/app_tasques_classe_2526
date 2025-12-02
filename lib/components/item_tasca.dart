import 'package:app_tasques_classe_2526/colors_app.dart';
import 'package:flutter/material.dart';

class ItemTasca extends StatefulWidget {

  final bool valorInicialCheckbox;
  final String valorText;

  const ItemTasca({
    super.key,
    this.valorInicialCheckbox = false,
    this.valorText = "",
  });

  @override
  State<ItemTasca> createState() => _ItemTascaState();
}

class _ItemTascaState extends State<ItemTasca> {

  late bool valorCheckbox; 
  // late: per quan volem declarar una variable, però encara no sabem el valor.

  @override
  void initState() {
    
    super.initState();

    valorCheckbox = widget.valorInicialCheckbox;
    // "widget." ho posem per accedir a les variables de la primera classe del StatefulWidget.
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: const EdgeInsets.all(10),

      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: ColorsApp.colorMarro,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [

          // Checkbox.
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              side: BorderSide(
                color: ColorsApp.colorBlanc,
                width: 2,
              ),
              shape: CircleBorder(),
              value: valorCheckbox, 
              checkColor: ColorsApp.colorPrimariAccent3,
              activeColor: ColorsApp.colorBlanc,
              hoverColor: ColorsApp.colorPrimariAccent,
              onChanged: (valor){
                setState(() {
                  valorCheckbox = valor ?? false;
                  // ??: si val null, posa-li el valor false.
                });
              },
            ),
          ),

          // Text.
          Text(
            widget.valorText + " - Tasca a fer.",

            style: TextStyle(
              color: ColorsApp.colorBlanc,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}