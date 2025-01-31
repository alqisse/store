import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';

class PayPalPage extends StatefulWidget {
  const PayPalPage({super.key});

  @override
  State<PayPalPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<PayPalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaypalCheckout(
        sandboxMode: true,
        clientId:
            "AQhKVo8xeOY9KvrfTQh5W6qfH6Woy-V66l5yRz7s6LAe2dANUrrw1ODw59YP25NkDEjGCEtmPSOWIT-p",
        secretKey:
            "EKaZc1_3b5_nJE0qLAuIBTTHvy7J6CpzKMjFKWDfvWrDHnOPoHJe_kcqHkF1fzwm2g2QbAo0O5AFTNpu",
        returnURL: "success.snippetcoder.com",
        cancelURL: "cancel.snippetcoder.com",
        transactions: const [
          {
            "amount": {
              "total": '70',
              "currency": "USD",
              "details": {
                "subtotal": '70',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                {
                  "name": "Apple",
                  "quantity": 4,
                  "price": '5',
                  "currency": "USD"
                },
                {
                  "name": "Pineapple",
                  "quantity": 5,
                  "price": '10',
                  "currency": "USD"
                }
              ],

              // shipping address is not required though
              //   "shipping_address": {
              //     "recipient_name": "Raman Singh",
              //     "line1": "Delhi",
              //     "line2": "",
              //     "city": "Delhi",
              //     "country_code": "IN",
              //     "postal_code": "11001",
              //     "phone": "+00000000",
              //     "state": "Texas"
              //  },
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          print("onSuccess: $params");
        },
        onError: (error) {
          print("onError: $error");
          Get.back();
        },
        onCancel: () {
          print('cancelled:');
          Get.back();
        },
      ),
    );
  }
}
