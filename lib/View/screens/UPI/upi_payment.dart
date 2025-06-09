import 'package:url_launcher/url_launcher.dart';

void initiateGooglePay() async {
  final upiUri = Uri(
    scheme: 'upi',
    host: 'pay',
    queryParameters: {
      'pa': 'merchant@upi', // UPI ID
      'pn': 'Merchant Name', // Payee Name
      'mc': '1234', // Optional merchant code
      'tid': 'TXN123456789', // Transaction ID
      'tr': 'TXNREF123456', // Transaction ref
      'tn': 'Payment for order #1234', // Transaction note
      'am': '100.00', // Amount
      'cu': 'INR', // Currency
    },
  );

  final uri = upiUri.toString();
  print("Launching UPI: $uri");

  if (await canLaunchUrl(Uri.parse(uri))) {
     await launchUrl(
      Uri.parse(uri),
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'Could not launch $uri';
  }
}
