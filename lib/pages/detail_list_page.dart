import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes1/controllers/detail_makanan_conroller.dart';

class DetailListPage extends StatelessWidget {
  const DetailListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailMakananController());
    final makanan = controller.makanan;

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Makanan")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar
          Image.network(
            makanan.gambar,
            width: double.infinity,
            height: 220,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              width: double.infinity,
              height: 220,
              color: Colors.grey.shade300,
              child: const Icon(Icons.fastfood, size: 60),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama
                Text(
                  makanan.namaMakanan,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                // Harga
                Text(
                  makanan.harga,
                  style: const TextStyle(fontSize: 22, color: Colors.green),
                ),
                const SizedBox(height: 12),
                // Rating
                Row(
                  children: [
                    controller.buildStars(makanan.rating, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      "${makanan.rating} (${makanan.ulasan.length} ulasan)",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Ulasan
                const Text(
                  "Ulasan",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...makanan.ulasan.map(
                  (u) => Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                u.nama,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              controller.buildStars(u.rating, size: 16),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(u.komentar),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text("Kembali"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
