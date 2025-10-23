import 'package:flutter/material.dart';

void main() {
  runApp(const ProfilDiriApp());
}

class ProfilDiriApp extends StatelessWidget {
  const ProfilDiriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Profil Diri',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const ProfilPage(),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  void _showMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Halo! Ini adalah profil saya"),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.pink.shade300,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: isDesktop ? 900 : double.infinity,
            ),
            margin: EdgeInsets.all(isDesktop ? 20 : 0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF2A2A2A), Color(0xFF1A1A1A)],
              ),
              borderRadius: BorderRadius.circular(isDesktop ? 24 : 0),
              border: isDesktop
                  ? Border.all(
                      color: Colors.pink.shade200.withOpacity(0.3),
                      width: 2,
                    )
                  : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Gradient Top Border
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.pink.shade200,
                        Colors.purple.shade200,
                        Colors.blue.shade200,
                      ],
                    ),
                    borderRadius: isDesktop
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(22),
                            topRight: Radius.circular(22),
                          )
                        : null,
                  ),
                ),

                // Content
                Padding(
                  padding: EdgeInsets.all(isDesktop ? 40.0 : 24.0),
                  child: isDesktop
                      ? _buildDesktopLayout(context)
                      : _buildMobileLayout(context),
                ),

                // FOOTER
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade800, width: 1),
                    ),
                  ),
                  child: Text(
                    '© 2025 Profil by Ibramansah',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLeftSide(),
        const SizedBox(width: 60),

        Container(width: 1, height: 280, color: Colors.grey.shade800),
        const SizedBox(width: 40),

        Expanded(child: _buildRightSide(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildLeftSide(),
        const SizedBox(height: 32),

        Container(
          height: 1,
          color: Colors.grey.shade800,
          margin: const EdgeInsets.symmetric(vertical: 24),
        ),

        _buildRightSide(context),
      ],
    );
  }

  Widget _buildLeftSide() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.pink.shade200, Colors.purple.shade200],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.pink.shade200.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF2A2A2A),
            ),
            padding: const EdgeInsets.all(4),
            child: const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images.jpg'),
            ),
          ),
        ),

        const SizedBox(height: 24),

        const Text(
          'MUHAMMAD IBRAMANSAH',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 8),

        // SUBTITLE
        Text(
          'Mahasiswa Semester 5',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade400,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildRightSide(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 15,
              height: 1.6,
              color: Colors.grey.shade300,
            ),
            children: [
              const TextSpan(text: 'Halo! Saya adalah mahasiswa Informatika '),
              TextSpan(
                text: 'Universitas Muhammadiyah Sidoarjo',
                style: TextStyle(
                  color: Colors.pink.shade200,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const TextSpan(
                text: '. Ini adalah tugas saya menggunakan Flutter...',
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        Row(
          children: [
            Icon(Icons.email_rounded, size: 18, color: Colors.grey.shade400),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'mibram61@gmail.com',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade300),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Icon(Icons.phone_rounded, size: 18, color: Colors.grey.shade400),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                '+62 881026761581',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade300),
              ),
            ),
          ],
        ),

        const SizedBox(height: 32),

        Row(
          children: [
            Expanded(
              child: _buildButton(
                text: 'Hubungi',
                onPressed: () => _showMessage(context),
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),

        const SizedBox(height: 20),

        // FOOTER TEXT
        Text(
          'Profil ini menampilkan informasi singkat tentang saya.\nSilakan hubungi untuk informasi lebih lanjut!',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade500,
            fontStyle: FontStyle.italic,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildButton({required String text, required VoidCallback onPressed}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.pink.shade200,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.shade200.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
