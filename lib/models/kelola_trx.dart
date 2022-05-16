import 'package:soendacoffee/models/galeri_model.dart';

class KelolaTrx {
  String id, nama, harga, deskripsi, katagori, foto, stok;
  // double harga;
  DateTime createdAt, updatedAt;
  List<GaleriModel> galeri;

  KelolaTrx({
    this.id,
    this.nama,
    this.harga,
    this.deskripsi,
    this.katagori,
    this.foto,
    this.stok,
    this.createdAt,
    this.updatedAt,
    this.galeri,
  });

  // Konstruktor untuk KelolaTrx dari json

  KelolaTrx.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['name'];
    harga = json['harga'];
    deskripsi = json['deskripsi'];
    katagori = json['katagori'];
    foto = json['foto'];
    galeri = json['galleries']
        .map<GaleriModel>((gallery) => GaleriModel.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  // function untuk mengubah KelolaTrx ke dalam bentunk json
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
