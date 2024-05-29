import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: <Widget>[
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
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                    ),
                    const Text(
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
                // Giriş yap butonuna basılınca yapılacak işlemler
              },
              child: const Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    ]);
  }
}
