import 'package:bmi_calculator_flutter/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;
  const LeftBar({Key? key,required this.barWidth}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: barWidth,
          height: 25,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: accentColor
          ),
        )
      ],
    ) ;
  }
}
