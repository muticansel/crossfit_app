import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emergencyContactController =
      TextEditingController();
  final TextEditingController _emergencyPhoneController =
      TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  void _updateProfile() {
    // Profil güncelleme işlemleri burada yapılacak
    final name = _nameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;
    final emergencyContact = _emergencyContactController.text;
    final emergencyPhone = _emergencyPhoneController.text;
    final gender = _genderController.text;

    // Güncellenmiş bilgileri kullanarak işlem yapabilirsiniz
    print(
        'Değişenler sırasıyla: $name $email $phone $emergencyContact $emergencyPhone $gender');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Bilgilerim'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar_default.png'),
              backgroundColor: Colors.transparent,
            ),
            TextButton(
              onPressed: () {
                // Profil resmi ekleme işlemi burada yapılacak
              },
              child: const Text('Profil Resmi Ekle'),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Adı',
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Soyadı',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Telefon Numarası',
              ),
            ),
            TextField(
              controller: _emergencyContactController,
              decoration: const InputDecoration(
                labelText: 'Acil Durumda Aranacak Kişi',
              ),
            ),
            TextField(
              controller: _emergencyPhoneController,
              decoration: const InputDecoration(
                labelText: 'Acil Durum Telefon No',
              ),
            ),
            TextField(
              controller: _genderController,
              decoration: const InputDecoration(
                labelText: 'Cinsiyet',
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity, // Ekran genişliğinin tamamını kaplar
              child: ElevatedButton(
                onPressed: _updateProfile,
                child: const Text('Güncelle'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
