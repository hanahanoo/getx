import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/data/models/alquran.dart';

class SurahDetailView extends StatelessWidget {
  final BacaModel surah;

  const SurahDetailView({Key? key, required this.surah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.nama ?? "Detail Surah"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Nomor Surah
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.teal,
              child: Text(
                surah.nomor ?? "?",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Nama Surah
            Text(
              surah.nama ?? "",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            // Asma (Arab)
            Text(
              surah.asma ?? "",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 8),

            // Info tambahan
            Text(
              "${surah.arti ?? ""} • ${surah.ayat ?? 0} ayat • ${surah.type == Type.MEKAH ? "Makkiyah" : "Madaniyah"}",
              style: TextStyle(color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Deskripsi / keterangan
            if (surah.keterangan != null && surah.keterangan!.isNotEmpty)
              Text(
                surah.keterangan!,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),

            const SizedBox(height: 20),

            // Tombol Audio
            if (surah.audio != null && surah.audio!.isNotEmpty)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                label: const Text(
                  "Dengarkan Audio",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // TODO: pake audio player package (misal just_audio)
                  Get.snackbar("Audio", "Fitur play audio belum diaktifkan 😅");
                },
              ),
          ],
        ),
      ),
    );
  }
}