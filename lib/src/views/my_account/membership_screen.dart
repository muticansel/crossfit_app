import 'package:flutter/material.dart';

class Membership {
  final String remainingDays;
  final String memberGroup;
  final String membershipPackage;
  final String startDate;
  final String endDate;
  final String remainingClasses;
  final String freezeDate;

  Membership({
    required this.remainingDays,
    required this.memberGroup,
    required this.membershipPackage,
    required this.startDate,
    required this.endDate,
    required this.remainingClasses,
    required this.freezeDate,
  });
}

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  MembershipScreenState createState() => MembershipScreenState();
}

class MembershipScreenState extends State<MembershipScreen> {
  Future<Membership> _fetchMembership() async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 2));
    // Dummy data
    return Membership(
      remainingDays: '30',
      memberGroup: 'Gold',
      membershipPackage: 'Aylık',
      startDate: '01/06/2024',
      endDate: '01/07/2024',
      remainingClasses: '10',
      freezeDate: 'N/A',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Üyeliklerim'),
      ),
      body: FutureBuilder<Membership>(
        future: _fetchMembership(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Veriler yüklenemedi.'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Üyelik bilgisi bulunamadı.'));
          } else {
            final membership = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRow('Kalan Gün', membership.remainingDays),
                      _buildRow('Üye Grubu', membership.memberGroup),
                      _buildRow('Üyelik Paketi', membership.membershipPackage),
                      _buildRow('Başlangıç Tarihi', membership.startDate),
                      _buildRow('Bitiş Tarihi', membership.endDate),
                      _buildRow('Kalan Ders', membership.remainingClasses),
                      _buildRow('Dondurma Tarihi', membership.freezeDate),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
