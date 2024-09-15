import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _amountController = TextEditingController();
  final List<ProductDetails> _products = [];
  final InAppPurchase _iap = InAppPurchase.instance;

  @override
  void initState() {
    super.initState();
    _initializeInAppPurchase();
  }

  Future<void> _initializeInAppPurchase() async {
    final bool available = await _iap.isAvailable();
    if (available) {
      const Set<String> _kIds = <String>{
        'your_product_id'
      }; // Replace with your product ID
      final ProductDetailsResponse response =
          await _iap.queryProductDetails(_kIds);
      if (response.notFoundIDs.isNotEmpty) {
        // Handle the error
        print('Product not found');
      }
      setState(() {
        _products.addAll(response.productDetails);
      });
    } else {
      // Handle the error
      print('In-app purchase not available');
    }
  }

  Future<void> _makePayment(ProductDetails product) async {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    final PurchaseDetails purchaseDetails = (await _iap.buyConsumable(
        purchaseParam: purchaseParam)) as PurchaseDetails;

    if (purchaseDetails.status == PurchaseStatus.purchased) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Payment Successful')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment Failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('In-App Purchase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Amount',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ..._products.map((product) {
              return ElevatedButton(
                onPressed: () => _makePayment(product),
                child: Text('Pay ${product.price}'),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
