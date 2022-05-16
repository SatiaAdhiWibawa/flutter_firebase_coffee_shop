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

  // Konstruktor untuk ProductModel dari json

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['name'];
    harga = json['harga'];
    deskripsi = json['deskripsi'];
    katagori = json['katagori'];
    foto = json['foto'];
    galeri = json['galeri']
        .map<GaleriModel>((gallery) => GaleriModel.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  // function untuk mengubah ProductModel ke dalam bentunk json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'deskripsi': deskripsi,
      'katagori': katagori,
      'foto': foto,
      'galeri': galeri.map((gallery) => gallery.toJson()).toList(),
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
