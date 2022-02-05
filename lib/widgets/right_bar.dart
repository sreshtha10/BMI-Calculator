import 'package:bmi_calculator_flutter/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';

class RightBar extends StatelessWidget {
  final double barWidth;
  const RightBar({Key? key,required this.barWidth}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: barWidth,
          height: 25,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: accentColor
          ),
        )
      ],
    ) ;
  }
}
