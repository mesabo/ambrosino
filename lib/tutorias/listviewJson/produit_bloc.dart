class Produit{
  String id;
  String article;
  String prixu;
  String desc;
  Produit({this.id,this.article,this.prixu,this.desc});

  factory Produit.fromJson(Map<String,dynamic> json){
    return Produit(
        id: json['id'] as String,
        article: json['designation'] as String,
        prixu: json['prix_unitaire'] as String,
        desc: json['descript'] as String
    );
  }
}