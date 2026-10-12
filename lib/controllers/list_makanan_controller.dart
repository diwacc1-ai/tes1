import 'package:get/get.dart';
import 'package:tes1/models/makanan_model.dart';

class ListMakananController extends GetxController {
  // DATA makanan berupa list, masih hardcoded
  List<MakananModel> makananList = [
    MakananModel(
      namaMakanan: "Nasi Goreng",
      harga: "Rp 15.000",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSb67tSgtRhRDOLbCDUQw5tDZFyt8mhVrZNar2SYPrvww&s=10",
      rating: 4.5,
      ulasan: [
        Ulasan(nama: "Budi", rating: 5, komentar: "Bumbunya pas, porsinya banyak!"),
        Ulasan(nama: "Siti", rating: 4, komentar: "Enak, tapi agak kurang pedas."),
        Ulasan(nama: "Andi", rating: 4.5, komentar: "Telur matanya pas, nasinya wangi."),
      ],
    ),
    MakananModel(
      namaMakanan: "Mie Goreng",
      harga: "Rp 12.000",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzrPpmxP9JV-UPdiJAeVdQJUZtRCI_pswJ-qpfrhgMlg&s=10",
      rating: 4.2,
      ulasan: [
        Ulasan(nama: "Rina", rating: 4, komentar: "Mienya kenyal dan gurih."),
        Ulasan(nama: "Dewi", rating: 4.5, komentar: "Harga murah, rasa mantap."),
      ],
    ),
    MakananModel(
      namaMakanan: "Sate Ayam",
      harga: "Rp 20.000",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRicPM06BK6A297Q--5JuXOJx-Nn8DVi-5NT3D2weudcQ&s=10",
      rating: 4.8,
      ulasan: [
        Ulasan(nama: "Joko", rating: 5, komentar: "Dagingnya empuk, bumbu kacangnya juara."),
        Ulasan(nama: "Mega", rating: 5, komentar: "Wajib coba, pasti beli lagi."),
        Ulasan(nama: "Fajar", rating: 4.5, komentar: "Enak, penyajian agak lama."),
      ],
    ),
    MakananModel(
      namaMakanan: "Bakso",
      harga: "Rp 10.000",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0Nwy9f3_BASZPv_VphngKEFDzrb4GYj1I3IMTMrU4fg&s=10",
      rating: 4.0,
      ulasan: [
        Ulasan(nama: "Lisa", rating: 4, komentar: "Kuahnya segar, baksonya besar."),
        Ulasan(nama: "Rudi", rating: 4, komentar: "Lumayan enak untuk harga segini."),
      ],
    ),
    MakananModel(
      namaMakanan: "Ayam Bakar",
      harga: "Rp 25.000",
      gambar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrXzoixd4X-QZ9VM7IgykDWOiGt_uI-h6-DWEimUrJLw&s=10",
      rating: 4.7,
      ulasan: [
        Ulasan(nama: "Tono", rating: 5, komentar: "Bumbunya meresap sampai ke dalam."),
        Ulasan(nama: "Nina", rating: 4.5, komentar: "Sambalnya mantap, ayamnya juicy."),
        Ulasan(nama: "Eko", rating: 4.5, komentar: "Porsi pas, rasa konsisten."),
      ],
    ),
  ];
}