import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.2,
        // ),
        Container(
          child: Lottie.asset('assets/lottie/loading.json'),
        ),
        Text(
          'Loading data, please wait...',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
