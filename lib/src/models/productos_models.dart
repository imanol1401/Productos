// To parse this JSON data, do
//

import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    String id;
    String titulo="";
    double valor=0.0;
    bool disponible= true;
    String fotoUrl;

    ProductoModel({
        required this.id,
        required this.titulo,
        required this.valor,
        required this.disponible,
        required this.fotoUrl,
    });

    factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        id: json["id"],
        titulo: json["titulo"],
        valor: json["valor"],
        disponible: json["disponible"],
        fotoUrl: json["fotoUr1"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "valor": valor,
        "disponible": disponible,
        "fotoUr1": fotoUrl,
    };
}
