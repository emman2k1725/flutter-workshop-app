import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

enum CustomTextFieldType {
  search,
  createPost,
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final CustomTextFieldType type;
  const CustomTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.type = CustomTextFieldType.search,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Widget widgetType = const SizedBox();

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case CustomTextFieldType.search:
        widgetType = TextFormField(
          controller: widget.controller,
          cursorColor: Colors.grey,
          style: TextStyles.bodyText,
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Search',
            hintStyle: TextStyles.bodyText.copyWith(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
              size: 25,
            ),
            suffixIcon: widget.controller.text.isNotEmpty &&
                    widget.controller.text != ''
                ? InkWell(
                    onTap: () {
                      widget.controller.clear();
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.grey,
                      size: 25,
                    ),
                  )
                : const SizedBox(),
          ),
          onChanged: (value) {
            setState(() {});
            widget.onChanged;
          },
        );
      case CustomTextFieldType.createPost:
        widgetType = TextFormField(
          controller: widget.controller,
          cursorColor: Colors.black,
          style: TextStyles.bodyText,
          maxLines: null,
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Start a thread...',
            hintStyle: TextStyles.bodyText.copyWith(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            filled: false,
          ),
          onChanged: (value) {
            setState(() {});
            widget.onChanged;
          },
        );
    }

    return widgetType;
  }
}
