class GaleriModel {
  int id;
  String url;

  // Konstruktor        digunakan untuk membuat objek yang memiliki nilai awal.
  GaleriModel({
    this.id,
    this.url,
  });

// Konstruktor untuk GalleryModel dari json
  GaleriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  // function untuk mengubah GalleryModel ke dalam bentunk json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
    };
  }
}
