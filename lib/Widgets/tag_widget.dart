import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    @required this.selectedTags,
  });

  final List<String> selectedTags;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFieldTags(
        textFieldStyler: TextFieldStyler(
            textFieldEnabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: kPrimaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            textFieldFilledColor: kPrimaryColor,
            hintText: 'Enter tags',
            helperText: ' ',
            isDense: false,
            textFieldEnabled: true,
            textFieldFilled: false),
        tagsStyler: TagsStyler(
          tagTextStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          tagDecoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          tagCancelIcon: Icon(Icons.cancel, size: 18.0, color: Colors.black),
          tagPadding: const EdgeInsets.all(6.0),
        ),
        onTag: (tag) {
          selectedTags.add(tag);
        },
        onDelete: (tag) {
          selectedTags.remove(tag);
        },
      ),
    );
  }
}
