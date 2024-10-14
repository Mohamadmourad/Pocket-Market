import 'package:flutter/material.dart';
import 'package:frontend/models/cart.dart';
import 'package:frontend/pages/loading.dart';
import 'package:provider/provider.dart';

class PaymentCheckout extends StatefulWidget {
  const PaymentCheckout({super.key});

  @override
  State<PaymentCheckout> createState() => _PaymentCheckoutState();
}

class _PaymentCheckoutState extends State<PaymentCheckout> {
  bool isLoading = false;
  bool isPaymentConfirmed = false;
  @override
  Widget build(BuildContext context) {

    void confirmPayment(){
      setState(() {
         isLoading = true;
        });
      Future.delayed(const Duration(seconds: 2), (){
        setState(() {
         isLoading = false;
         isPaymentConfirmed = true;
         Future.delayed(const Duration(seconds: 2), (){
           Provider.of<Cart>(context, listen: false).clearCart();
           Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Loading(), 
          ),(Route<dynamic> route) => false,
        );
         });
        });
      });
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.orange[700],
        title: const Text(
          'Payment Checkout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Payment Checkout',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
           isPaymentConfirmed ? 
           const Icon(Icons.check_circle, color: Colors.green, size: 50,)
           : 
           isLoading ? 
           const CircularProgressIndicator(
            color: Colors.orange,
           ) 
           : ElevatedButton(
              onPressed: () {
                confirmPayment();
              },
              child: const Text('Confirm Payment'),
            ),
          ],
        ),
      ),
    );
  }
}