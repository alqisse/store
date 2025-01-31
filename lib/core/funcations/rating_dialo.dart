import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:qaisystore/controller/orders/archive_controller.dart';
import 'package:get/get.dart';

void showRatingDialog(BuildContext context, String orderid) {
// show the dialog
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
            initialRating: 1.0,
            // your app's name?
            title: const Text(
              'Rating Dialog',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // encourage your user to leave a high rating?
            message: const Text(
              'Tap a star to set your rating. Add more description here if you want.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            // your app's logo?
            image: const FlutterLogo(size: 100),
            submitButtonText: 'Submit',
            commentHint: 'Set your custom comment hint',
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              ArchiveController controller = Get.find();
              print(
                  'rating:====================== ${response.rating}, comment:============ ${response.comment}');
              controller.ratingOrders(
                  orderid, response.rating, response.comment);
            },
          ));
}
