import 'package:flutter/material.dart';
import 'package:crossfit_app/src/views/my_account/profile_screen.dart';
import 'package:crossfit_app/src/views/my_account/my_account_menu_screen.dart';
import 'package:crossfit_app/src/views/my_account/change_password_screen.dart';
import 'package:crossfit_app/src/views/my_account/my_transactions_screen.dart';
import 'package:crossfit_app/src/views/my_account/membership_screen.dart';
import 'package:crossfit_app/src/views/my_account/reservations_screen.dart';

class NavigationtUtils {
  static void navigateTo(BuildContext context, String buttonLabel) {
    switch (buttonLabel) {
      case "Hesaabım":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyAccountMenu()),
        );
        break;
      case 'Ödemeler':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyTransactions()),
        );
        break;
      case 'Şifremi Değiştir':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
        );
        break;
      case 'Profil Bilgilerim':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
      case 'Üyeliklerim':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MembershipScreen()),
        );
        break;
      case 'Rezervasyonlarım':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReservationsScreen()),
        );
        break;
      default:
        break;
    }
  }
}
