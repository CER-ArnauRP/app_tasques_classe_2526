
import 'package:app_tasques_classe_2526/data/tasca.dart';
import 'package:hive/hive.dart';

class RepositoriTasca {

  static const String clauLlistaTasques = "LlistaTasques";
  static const String nomBoxTasques = "BoxTasques_app_tasques";

  // Aquí aniran els mètodes per gestionar les tasques.

  // Mètode Get.
  Box<List<dynamic>> _getBox() {
    // Retorna la box on hi ha la llista amb totes les tasques.
    return Hive.box<List<dynamic>>(nomBoxTasques);
  }

  // Mètode Set.
  Future<void> setBox(List<dynamic> llistaTasques) async {

    // Per operacions que tenen un temps d'espera, 
    // poden trigar (com accedir a arxius), es fa servir async i await.
    // En aquests casos, el tipus de dades de retorn, ha de ser Future<TipusDada>.
    await _getBox().put(clauLlistaTasques, llistaTasques);
  }


  List<dynamic> getLlistaTasques() {
    // Retorna la llista de tasques.
    // La box de tasques, ens és retornada amb el mètode _getBox().
    // Amb aquesta box que ens retorna, fem servir el mètode get() de les box,
    // per obtenir la llista de tasques.
    return _getBox().get(
      clauLlistaTasques, 
      defaultValue: <Tasca>[Tasca(titol: "Tasca d'exemple")]// Si no hi ha res, retorna una tasca d'exemple.
    )!; 
  }

  Future<void> afegirTasca(Tasca tascaPerAfegir) async {

    final List<dynamic> llistaTasques = getLlistaTasques();
    llistaTasques.add(tascaPerAfegir);

    await setBox(llistaTasques);
  }

  Future<void> esborraTasca(int index) async{

    final List<dynamic> llistaTasques = getLlistaTasques();

    llistaTasques.removeAt(index);

    await setBox(llistaTasques);
  }

  Future<void> actualitzaTasca(int index, Tasca tascaActualitzada) async {

    print("Actualitzant tasca a l'index $index, valor completada: ${tascaActualitzada.completada}");

    final List<dynamic> llistaTasques = getLlistaTasques();

    llistaTasques[index] = tascaActualitzada;

    await setBox(llistaTasques);
  }


}