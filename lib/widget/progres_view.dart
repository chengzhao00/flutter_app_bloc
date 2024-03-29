


import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 24.0,
        height: 24.0,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
