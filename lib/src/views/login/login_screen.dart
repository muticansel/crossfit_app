import 'package:flutter/material.dart';
import 'package:crossfit_app/src/views/home/home_screen.dart';
import 'package:crossfit_app/src/widgets/checkbox.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Opacity(
          opacity: 0.5,
          child: Image.asset(
            'assets/login_background.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.black.withOpacity(
              0.6), // Arka plan resminin üstüne daha az opak yarı saydam bir katman ekler
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Telefon Numarası',
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Şifre',
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Row(
                    children: <Widget>[
                      SizedBox(width: 4),
                      CustomCheckbox(),
                      SizedBox(width: 8),
                      Text(
                        'Beni Hatırla',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Şifremi Unuttum butonuna basılınca yapılacak işlemler
                    },
                    child: const Text(
                      'Şifremi Unuttum',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(userName: "Muti"),
                    ),
                  );
                },
                child: const Text('Giriş Yap'),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
