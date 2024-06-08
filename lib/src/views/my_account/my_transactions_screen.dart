import 'package:flutter/material.dart';

class MyTransactions extends StatelessWidget {
  const MyTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ödemelerim'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: TransactionsTable(),
      ),
    );
  }
}

class TransactionsTable extends StatelessWidget {
  const TransactionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> transactions = [
      {
        'date': '01/01/2024',
        'description': 'Ödeme',
        'debit': '100',
        'credit': ''
      },
      {
        'date': '02/01/2024',
        'description': 'Tahsilat',
        'debit': '',
        'credit': '200'
      },
      {
        'date': '03/01/2024',
        'description': 'Satın Alma',
        'debit': '50',
        'credit': ''
      },
      {
        'date': '04/01/2024',
        'description': 'Satış',
        'debit': '',
        'credit': '300'
      },
    ];

    double totalDebit = transactions
        .map((transaction) => double.tryParse(transaction['debit']!) ?? 0)
        .reduce((a, b) => a + b);

    double totalCredit = transactions
        .map((transaction) => double.tryParse(transaction['credit']!) ?? 0)
        .reduce((a, b) => a + b);

    double balance = totalCredit - totalDebit;

    return Stack(children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(
              label:
                  Text('Tarih', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            DataColumn(
                label: Text('Açıklama',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Borç',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Alacak',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: transactions.map((transaction) {
            return DataRow(cells: [
              DataCell(Text(transaction['date']!)),
              DataCell(Text(transaction['description']!)),
              DataCell(Text(transaction['debit']!)),
              DataCell(Text(transaction['credit']!)),
            ]);
          }).toList(),
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Toplam Borç: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '$totalDebit'),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Toplam Alacak: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '$totalCredit'),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Kalan: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '$balance'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
