// payment_page.dart

import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Payment details and options go here.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add logic to handle payment processing
                print('Payment processed successfully');
                // You can navigate back to the previous page or any other navigation logic
                Navigator.pop(context);
              },
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
