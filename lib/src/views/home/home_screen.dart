import 'package:flutter/material.dart';
import 'package:crossfit_app/src/views/my_account/my_account_screen.dart';
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
      extendBodyBehindAppBar:
          true, // App Bar'ın arka plan resminin üstüne çıkmasını sağlar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Şeffaf arka plan
        elevation: 0, // Gölge yok
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
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/home_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(
                0.6), // Arka plan resminin üstüne daha az opak yarı saydam bir katman ekler
          ),
          Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Merhaba $userName',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
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
                        if (buttonLabel == 'Hesabım') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyAccount()),
                          );
                        }
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
        ],
      ),
    );
  }
}
