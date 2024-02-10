import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;

  const CustomButton({
    super.key,
    this.onPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
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
        ),
        child: Text(
          text ?? 'Follow',
          style: TextStyles.bodyText.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
