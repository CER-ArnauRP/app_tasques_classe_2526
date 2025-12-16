import 'package:app_tasques_classe_2526/colors_app.dart';
import 'package:app_tasques_classe_2526/components/boto_dialog.dart';
import 'package:app_tasques_classe_2526/components/textfield_personalitzat.dart';
import 'package:app_tasques_classe_2526/data/repositori_tasca.dart';
import 'package:app_tasques_classe_2526/data/tasca.dart';
import 'package:flutter/material.dart';

class DialogNovaTasca extends StatelessWidget {

  final String textTasca;
  final int indexTasca;

  const DialogNovaTasca({
    super.key,
    this.textTasca = "",
    this.indexTasca = -1,
  });

  @override
  Widget build(BuildContext context) {

    final TextEditingController controllerTextTasca = TextEditingController();

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
            TextfieldPersonalitzat(controllerTitol: controllerTextTasca,),

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
                    indexTasca == -1 ? 
                      guardaTasca(context, controllerTextTasca.text) : 
                      editaTasca(context, controllerTextTasca.text, indexTasca);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void guardaTasca(BuildContext context, String textDeLaTasca) {

    RepositoriTasca repostiriTasca = RepositoriTasca();
    repostiriTasca.afegirTasca(Tasca(titol: textDeLaTasca));

    Navigator.of(context).pop();
  }

  void editaTasca(BuildContext context, String textDeLaTasca, int indexTasca) {

    RepositoriTasca repostiriTasca = RepositoriTasca();
    repostiriTasca.actualitzaTasca(indexTasca, Tasca(titol: textDeLaTasca));

    Navigator.of(context).pop();
  }

  void tancaDialog(BuildContext context) {
    Navigator.of(context).pop();
  }
}