import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes1/controllers/list_makanan_controller.dart';
import 'package:tes1/routes.dart';

class ListMakananPages extends StatelessWidget {
  const ListMakananPages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListMakananController());

    return Scaffold(
      appBar: AppBar(title: const Text("List Makanan")),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: controller.makananList.length,
          itemBuilder: (context, index) {
            final makanan = controller.makananList[index];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  makanan.gambar,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.fastfood),
                  ),
                ),
              ),
              title: Text(makanan.namaMakanan,
                  style: const TextStyle(fontSize: 20)),
              subtitle: Text(makanan.harga,
                  style: const TextStyle(fontSize: 15)),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              // Kirim data lewat arguments
              onTap: () {
                Get.toNamed(
                  Routes.detail_list,
                  arguments: makanan,
                );
              },
            );
          },
        ),
      ),
    );
  }
}