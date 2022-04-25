import 'package:flutter/material.dart';
import 'package:soendacoffee/models/galeri_model.dart';

class Product {
  String id, nama, harga, deskripsi, katagori, foto, stok;
  DateTime createdAt, updatedAt;
  List<GaleriModel> galeri;

  Product({
    this.id,
    this.nama,
    this.harga,
    this.deskripsi,
    this.katagori,
    this.foto,
    this.stok,
    @required this.createdAt,
    this.updatedAt,
    this.galeri,
  });
}


  // Product.fromJson(Map<String, dynamic> json) {
  //   galeri = json['galeri']
  //       .map<GaleriModel>((gallery) => GaleriModel.fromJson(gallery))
  //       .toList();
  // }

  // // function untuk mengubah ProductModel ke dalam bentunk json
  // // Map<String, dynamic> toJson() {
  // //   return {
  // //     'galeri': GaleriModel.map((gallery) => gallery.toJson()).toList(),
  // //   };
  // // }

