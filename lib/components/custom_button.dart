import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

enum CustomButtonType {
  primary,
  secondary,
}

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final CustomButtonType type;

  const CustomButton({
    super.key,
    this.onPressed,
    this.text,
    this.type = CustomButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    ButtonStyle? buttonStyle;
    Color fontColor = Colors.black;

    switch (type) {
      case CustomButtonType.primary:
        buttonStyle = ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashFactory: NoSplash.splashFactory,
        );
      case CustomButtonType.secondary:
        buttonStyle = ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashFactory: NoSplash.splashFactory,
        );
        fontColor = Colors.white;
    }

    return SizedBox(
      height: 33,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: buttonStyle,
        child: Text(
          text ?? 'Follow',
          style: TextStyles.bodyText
              .copyWith(fontWeight: FontWeight.w500, color: fontColor),
        ),
      ),
    );
  }
}
