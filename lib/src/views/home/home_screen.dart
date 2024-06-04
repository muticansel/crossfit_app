import 'package:flutter/material.dart';
import 'package:crossfit_app/src/views/login/login_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key, this.userName = "Muti"});

  final String userName;

  @override
  Widget build(BuildContext context) {
    final List<String> homeButtonLabels = [
      'Salon Giriş',
      'Ders Rezervasyon',
      'Etkinlik Rezervasyon',
      'Drop-in Rezervasyon',
      'Antrenman Programı',
      'Hesabım',
      'Kişisel Antrenman Programı',
      'Mesajlar',
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false,
              );
            },
            child: const Text(
              'Çıkış Yap',
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Merhaba $userName',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ...homeButtonLabels.map((buttonLabel) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width *
                    0.95, // Ekran genişliğinin %95'i
                child: ElevatedButton(
                  onPressed: () {
                    // Butona basıldığında yapılacak işlemler
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Yuvarlak köşeler
                    ),
                  ),
                  child: Text(buttonLabel),
                ),
              ),
            );
          }),
        ]),
      ),
    );
  }
}
