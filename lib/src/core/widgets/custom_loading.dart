import 'package:flutter/cupertino.dart';

class CustomLoading extends StatelessWidget {
  final double progresHeight;
  final double strokeWidth;
  final Color? color;
  final double padding;
  const CustomLoading(
      {super.key,
      this.progresHeight = 24,
      this.color,
      this.padding = 10,
      this.strokeWidth = 3});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(padding),
          child: SizedBox(
            height: progresHeight,
            width: progresHeight,
            child: CupertinoActivityIndicator(color: color),
          )

          // CircularProgressIndicator(
          //   valueColor: AlwaysStoppedAnimation(
          //     color,
          //   ),
          //   strokeWidth: strokeWidth,
          // )),
          ),
    );
  }
}
