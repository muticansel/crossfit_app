import 'package:crossfit_app/src/views/my_account/my_transactions_screen.dart';
import 'package:flutter/material.dart';

class MyAccountMenu extends StatelessWidget {
  const MyAccountMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> accountButtonLabels = [
      'Profil Bilgilerim',
      'Üyeliklerim',
      'Ölçümlerim',
      'Ödemeler',
      'E-Cüzdan Bakiye',
      'Rezervasyonlarım',
      'Şifremi Değiştir',
      'Üyeliğimi Sil',
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Hesabım', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // Sol ok simgesi ve rengi
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/home_bg.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: accountButtonLabels.map((buttonLabel) {
                final isDisabled = buttonLabel != 'Ödemeler';

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: ElevatedButton(
                      onPressed: () {
                        if (buttonLabel == 'Ödemeler') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyTransactions()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: isDisabled
                            ? Colors.grey
                            : null, // Devre dışı butonlar için gri arka plan
                        foregroundColor: isDisabled
                            ? Colors.white
                            : null, // Devre dışı butonlar için beyaz metin
                        textStyle: isDisabled
                            ? const TextStyle(color: Colors.white)
                            : null,
                      ),
                      child: Text(buttonLabel),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
