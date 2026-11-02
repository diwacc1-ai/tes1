import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes1/controllers/list_makanan_controller.dart';
import 'package:tes1/models/makanan_model.dart';
import 'package:tes1/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final makananList = Get.put(ListMakananController()).makananList;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 20, bottom: 24),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Dapur Kita',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            _DaftarMakanan(makananList: makananList),
          ],
        ),
      ),
    );
  }
}

class _DaftarMakanan extends StatelessWidget {
  const _DaftarMakanan({required this.makananList});

  final List<MakananModel> makananList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 218,
      margin: const EdgeInsets.only(left: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: makananList.length,
        itemBuilder: (context, index) {
          final makanan = makananList[index];
          return SizedBox(
            width: 164,
            child: Card(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(left: 8, right: 4, bottom: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () =>
                    Get.toNamed(Routes.detail_list, arguments: makanan),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 122,
                      width: double.infinity,
                      child: Image.network(
                        makanan.gambar,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey.shade200,
                          child: const Icon(
                            Icons.fastfood_rounded,
                            color: Colors.grey,
                            size: 42,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 9, 10, 2),
                      child: Text(
                        makanan.namaMakanan,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text('${makanan.rating}'),
                          const Spacer(),
                          Flexible(
                            child: Text(
                              makanan.harga,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFFEC6B3B),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
