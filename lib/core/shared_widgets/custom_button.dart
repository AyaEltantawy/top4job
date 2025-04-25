import 'package:flutter/material.dart';
import 'package:top4job/core/theming/colors.dart';
import 'package:top4job/core/theming/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text});

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 330,
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: ElevatedButton(

        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ColorsManager.brimayColor),
        ),
        child: Text(text,style: TextStyles.font18White600Weight,),
      ),
    );
  }
}
