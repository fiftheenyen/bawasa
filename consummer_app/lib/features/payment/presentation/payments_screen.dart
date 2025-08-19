import 'package:flutter/material.dart';
import 'package:consummer_app/core/utils/sizing_config.dart';
import 'package:consummer_app/core/widgets/custom_app_bar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizingConfig.init(constraints);

        return Scaffold(
          appBar: CustomAppBar(
            title: 'Payment',
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                iconSize: 2.4 * SizingConfig.heightMultiplier,
                onPressed: () {
                  debugPrint('Bell icon tapped');
                },
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(4 * SizingConfig.widthMultiplier),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _accountSummaryCard(),
                SizedBox(height: 2 * SizingConfig.heightMultiplier),
                _actionButtons(),
                SizedBox(height: 3 * SizingConfig.heightMultiplier),
                Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 1.8 * SizingConfig.textMultiplier,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 1.5 * SizingConfig.heightMultiplier),
                Expanded(child: _transactionsList()),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _accountSummaryCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4 * SizingConfig.widthMultiplier),
      decoration: BoxDecoration(
        color: const Color(0xFF1D4ED8),
        borderRadius: BorderRadius.circular(
          1.2 * SizingConfig.heightMultiplier,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow('Account No.', '012345', 'Active', Colors.green),
          SizedBox(height: 2 * SizingConfig.heightMultiplier),
          _infoRow('Amount to Pay', '₱1450', 'Unpaid', Colors.red),
          SizedBox(height: 1 * SizingConfig.heightMultiplier),
          Text(
            'Due Date: June 02, 2025',
            style: TextStyle(
              fontSize: 1.4 * SizingConfig.textMultiplier,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value, String status, Color dotColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label: $value',
          style: TextStyle(
            fontSize: 1.6 * SizingConfig.textMultiplier,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.circle,
              color: dotColor,
              size: 1.2 * SizingConfig.heightMultiplier,
            ),
            SizedBox(width: 1 * SizingConfig.widthMultiplier),
            Text(
              status,
              style: TextStyle(
                fontSize: 1.4 * SizingConfig.textMultiplier,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _actionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {}, // TODO: Implement Pay Now
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1D4ED8),
            ),
            child: const Text(
              'Pay Now',
              style: TextStyle(color: Color(0xFFF7F7F7)),
            ),
          ),
        ),
        SizedBox(width: 4 * SizingConfig.widthMultiplier),
        Expanded(
          child: OutlinedButton(
            onPressed: () {}, // TODO: Implement Pay in Advance
            child: const Text('Pay in Advance'),
          ),
        ),
      ],
    );
  }

  Widget _transactionsList() {
    final transactions = [
      {'date': 'Aug 10, 2025', 'amount': '₱1400', 'status': 'Paid'},
      {'date': 'Jul 10, 2025', 'amount': '₱1375', 'status': 'Paid'},
    ];

    return ListView.separated(
      itemCount: transactions.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final tx = transactions[index];
        return ListTile(
          title: Text(tx['date']!),
          subtitle: Text(tx['status']!),
          trailing: Text(
            tx['amount']!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // TODO: Show receipt
          },
        );
      },
    );
  }
}
