import 'package:app_tasques_classe_2526/colors_app.dart';
import 'package:app_tasques_classe_2526/components/boto_dialog.dart';
import 'package:app_tasques_classe_2526/components/textfield_personalitzat.dart';
import 'package:flutter/material.dart';

class DialogNovaTasca extends StatelessWidget {
  const DialogNovaTasca({super.key});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(

      backgroundColor: ColorsApp.colorMarro,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
        side: BorderSide(color: ColorsApp.colorBlanc, width: 2),
      ),



      title: Text(
        "Quina nova tasca vols afegir?",
        style: TextStyle(
          color: ColorsApp.colorPrimariClar,
        ),
      ),

      content: Container(

        height: 150,
        width: MediaQuery.of(context).size.width * 0.8,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextfieldPersonalitzat(),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                BotoDialog(
                  textBoto: "Tancar", 
                  colorBoto: ColorsApp.colorRefusar, 
                  iconaBoto: Icon(Icons.close),
                  accioBoto: () { 
                    tancaDialog(context);
                  },
                ),

                BotoDialog(
                  textBoto: "Guardar", 
                  colorBoto: ColorsApp.colorAcceptar, 
                  iconaBoto: Icon(Icons.save),
                  accioBoto: () { 
                    guardaTasca(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void guardaTasca(BuildContext context) {
    Navigator.of(context).pop();
  }

  void tancaDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}