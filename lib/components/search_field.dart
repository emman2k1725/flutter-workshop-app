import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  const SearchField({super.key, required this.controller, this.onChanged});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        suffixIcon:
            widget.controller.text.isNotEmpty && widget.controller.text != ''
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
  }
}
