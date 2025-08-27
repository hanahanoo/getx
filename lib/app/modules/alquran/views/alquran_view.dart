import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/modules/alquran/views/alquran_detail_view.dart';
import '../controllers/alquran_controller.dart';

class BacaquranView extends GetView<BacaquranController> {
  BacaquranView({Key? key}) : super(key: key);
  final BacaquranController controller = Get.put(BacaquranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Surah Al-Quran')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.errorMessage.value),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: controller.fetchBaca,
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          );
        }

        final bacaqurans = controller.bacaqurans;
        if (bacaqurans.isEmpty) {
          return const Center(child: Text('Data kosong'));
        }

        return ListView.separated(
          itemCount: bacaqurans.length,
          separatorBuilder: (_, __) => const Divider(height: 1),
          itemBuilder: (ctx, i) {
            final quran = bacaqurans[i];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Text(
                  quran.nomor ?? "?",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(
                "${quran.nama ?? ''} (${quran.asma ?? ''})",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${quran.arti ?? ''} • ${quran.ayat ?? 0} ayat • ${quran.type == Type ? "Makkiyah" : "Madaniyah"}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                icon: const Icon(Icons.play_circle_fill, color: Colors.teal),
                onPressed: () {
                  // nanti bisa dipake buat play audio dari quran.audio
                },
              ),
              onTap: () => Get.to(() => SurahDetailView(surah: quran)),
            );
          },
        );
      }),
    );
  }
}