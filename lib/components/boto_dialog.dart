import 'package:app_tasques_classe_2526/colors_app.dart';
import 'package:flutter/material.dart';

class BotoDialog extends StatelessWidget {

  final String textBoto;
  final Color colorBoto;
  final Icon iconaBoto;
  final Function() accioBoto;

  const BotoDialog({
    super.key,
    required this.textBoto,
    required this.colorBoto,
    required this.iconaBoto,
    required this.accioBoto,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: accioBoto,
      child: Container(
      
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      
        decoration: BoxDecoration(
          color: colorBoto,
          borderRadius: BorderRadius.circular(20),
        ),
      
        child: Row(
      
          children: [
      
            Icon(iconaBoto.icon, color: ColorsApp.colorMarroClar,),
      
            SizedBox(width: 8),
      
            Text(textBoto),
          ],
        ),
      ),
    );
  }
}