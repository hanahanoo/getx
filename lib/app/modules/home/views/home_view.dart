import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
        title: const Text(
          'Selamat Datang!',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            color: Colors.white.withOpacity(0.95),
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home_rounded, color: Colors.pinkAccent, size: 56),
                  const SizedBox(height: 16),
                  Text(
                    'Selamat Datang di Aplikasi!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Silakan pilih menu di bawah ini:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 28),
                  _HomeMenuButton(
                    icon: Icons.calculate_rounded,
                    label: 'Counter',
                    onTap: () => Get.toNamed('/counter'),
                  ),
                  const SizedBox(height: 16),
                  _HomeMenuButton(
                    icon: Icons.assignment_rounded,
                    label: 'Pendaftaran',
                    onTap: () => Get.toNamed('/pendaftaran'),
                  ),
                  const SizedBox(height: 16),
                  _HomeMenuButton(
                    icon: Icons.article_rounded,
                    label: 'Post',
                    onTap: () => Get.toNamed('/post'),
                  ),
                   const SizedBox(height: 16),
                  _HomeMenuButton(
                    icon: Icons.article_rounded,
                    label: 'Alquran',
                    onTap: () => Get.toNamed('/alquran'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeMenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _HomeMenuButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.pinkAccent),
        label: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.pinkAccent,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink[50],
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.pinkAccent, width: 1.2),
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}