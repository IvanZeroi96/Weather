import 'package:fever/model/colors.dart';
import 'package:flutter/material.dart';

class FCircularProgress extends StatelessWidget {
  final double width;
  final double height;
  final double stokeWidth;

  const FCircularProgress(
      {super.key,
      this.width = 40.0,
      this.height = 40.0,
      this.stokeWidth = 2.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          backgroundColor: FColors.blue2,
          strokeWidth: stokeWidth,
        ));
    //return Image.asset('assets/images/loading.gif', width: width, height: height,);
  }
}
