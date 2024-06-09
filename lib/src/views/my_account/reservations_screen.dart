import 'package:flutter/material.dart';

class Reservation {
  final String className;
  final String dateTime;
  final String instructor;

  Reservation({
    required this.className,
    required this.dateTime,
    required this.instructor,
  });
}

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  ReservationsScreenState createState() => ReservationsScreenState();
}

class ReservationsScreenState extends State<ReservationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Reservation> activeReservations = [
      Reservation(
          className: 'WOD',
          dateTime: '2024-06-15 10:00',
          instructor: 'Cansel Muti'),
      Reservation(
          className: 'WOD',
          dateTime: '2024-06-16 12:00',
          instructor: 'Erdoğan Aydemir'),
    ];

    final List<Reservation> cancelledReservations = [
      Reservation(
          className: 'WOD',
          dateTime: '2024-06-14 09:00',
          instructor: 'Ayşen Aktaş'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rezervasyonlarım'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Aktifler'),
            Tab(text: 'İptal Edilenler'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildReservationTable(activeReservations),
          _buildReservationTable(cancelledReservations),
        ],
      ),
    );
  }

  Widget _buildReservationTable(List<Reservation> reservations) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildTableHeader(),
          const Divider(thickness: 2),
          Expanded(
            child: ListView.builder(
              itemCount: reservations.length,
              itemBuilder: (context, index) {
                final reservation = reservations[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(reservation.className),
                      Text(reservation.dateTime),
                      Text(reservation.instructor),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Sınıf', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Tarih/Saat', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('Eğitmen', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
