class Ulasan {
  String nama;
  double rating;
  String komentar;

  Ulasan({
    required this.nama,
    required this.rating,
    required this.komentar,
  });
}

class MakananModel {
  // data2 makanan
  String namaMakanan;
  String harga;
  String gambar;
  double rating;
  List<Ulasan> ulasan;

  MakananModel({
    required this.namaMakanan,
    required this.harga,
    required this.gambar,
    required this.rating,
    required this.ulasan,
  });
}