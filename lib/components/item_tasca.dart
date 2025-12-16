import 'package:app_tasques_classe_2526/colors_app.dart';
import 'package:app_tasques_classe_2526/components/dialog_nova_tasca.dart';
import 'package:app_tasques_classe_2526/data/repositori_tasca.dart';
import 'package:app_tasques_classe_2526/data/tasca.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTasca extends StatefulWidget {

  final bool valorInicialCheckbox;
  final String valorText;
  final int indexTasca;

  const ItemTasca({
    super.key,
    this.valorInicialCheckbox = false,
    this.valorText = "",
    required this.indexTasca,
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

    return Slidable(

      endActionPane: ActionPane(
        motion: StretchMotion(), 
        children: [

          SlidableAction(
            icon: Icons.edit,
            backgroundColor: ColorsApp.colorRefusar,
            borderRadius: BorderRadius.circular(10),
            onPressed: (context){

            },
          ),

          SlidableAction(
            icon: Icons.delete,
            backgroundColor: ColorsApp.colorRefusar,
            borderRadius: BorderRadius.circular(10),
            onPressed: (context){

              RepositoriTasca repositoriTasca = RepositoriTasca();
              repositoriTasca.esborraTasca(widget.indexTasca);
            },
          ),
        ],
      ),

      child: Container(
      
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

                    RepositoriTasca repositoriTasca = RepositoriTasca();
                    Tasca tascaActualitzada = Tasca(
                      titol: widget.valorText,
                      completada: valorCheckbox,
                    );
                    repositoriTasca.actualitzaTasca(widget.indexTasca, tascaActualitzada);
                  });
                  
                },
              ),
            ),
      
            // Text.
            Text(
              widget.valorText,
      
              style: TextStyle(
                color: ColorsApp.colorBlanc,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void obreDialogEditarTasca(BuildContext context){

    // showDialog és una funció de Flutter que obre un Dialog que haguem creat/definit.
    showDialog(
      context: context, 
      builder: (context) {

        // En aquest cas, volem que quan s'obri el dialog, ja tingui escrit el text actual.
        // (que no estigui buit com si fos una nova tasca).
        return DialogNovaTasca(textTasca: widget.valorText, indexTasca: widget.indexTasca,);
      },
    );
  }
}