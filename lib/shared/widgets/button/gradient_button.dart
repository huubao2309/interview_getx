import 'package:flutter/material.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/common.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    this.text = '',
    this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Widget? child;
  final Gradient? gradient;
  final double width;
  final double height;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 64,
      decoration: BoxDecoration(
        gradient: gradient ??
            LinearGradient(
              colors: <Color>[
                hexToColor('#4CAF50'),
                hexToColor('#087f23'),
              ],
            ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: hexToColor('#F1F1F1'),
            offset: const Offset(0, 1.5),
            blurRadius: 1.5,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed as void Function()?,
          child: Center(
            child: text != ''
                ? Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: CommonConstants.normalText,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : child,
          ),
        ),
      ),
    );
  }
}
