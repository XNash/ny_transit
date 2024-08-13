class VehiculeModel {
  int? id;
  String? marque;
  String? modele;
  int? annee;
  String? couleur;

  VehiculeModel(
      {required this.id,
      required this.marque,
      required this.modele,
      required this.annee,
      required this.couleur});

  VehiculeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marque = json['marque'];
    modele = json['modele'];
    annee = json['annee'];
    couleur = json['couleur'];
  }

  @override
  String toString() {
    return "$id, $marque, $modele, $annee, $couleur";
  }
}
