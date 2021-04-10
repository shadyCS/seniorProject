import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:final_t_and_t/Widgets/button_widget.dart';
import 'package:final_t_and_t/Widgets/input_widget.dart';
import 'package:final_t_and_t/Widgets/tag_widget.dart';
import 'package:flutter/material.dart';

import '../constatns.dart';

class NewTextbookScreen extends StatefulWidget {
  static const String id = 'NewTextBook';
  @override
  _NewTextbookScreenState createState() => _NewTextbookScreenState();
}

class _NewTextbookScreenState extends State<NewTextbookScreen> {
  bool includePhone = false;
  bool includeEmail = false;
  List<String> selectedTags = [];
  String regionValue = defaultRegions[0].value;
  String subject = defaultSubjects[0].value;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController status = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List textbook'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              InputWidget(
                hintText: 'Title:',
                controller: title,
              ),
              InputWidget(
                hintText: 'Author:',
                controller: description,
              ),
              InputWidget(
                hintText: 'ISBN:',
                controller: price,
              ),
              InputWidget(
                hintText: 'Price SAR:',
                controller: price,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(5),
                  height: 50,
                  child: DropdownButton(
                    isExpanded: true,
                    value: regionValue,
                    underline: Container(),
                    items: defaultRegions,
                    onChanged: (value) {
                      setState(() {
                        regionValue = value;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(5),
                  height: 50,
                  child: DropdownButton(
                    isExpanded: true,
                    value: subject,
                    underline: Container(),
                    items: defaultSubjects,
                    onChanged: (value) {
                      setState(() {
                        subject = value;
                      });
                    },
                  ),
                ),
              ),
              InputWidget(
                hintText: 'Status',
                controller: status,
              ),
              TagWidget(selectedTags: selectedTags),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Checkbox(
                        activeColor: kPrimaryColor,
                        value: includePhone,
                        onChanged: (newValue) {
                          setState(() {
                            includePhone = newValue;
                          });
                        }),
                  ),
                  Text("Include phone number"),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Checkbox(
                        activeColor: kPrimaryColor,
                        value: includeEmail,
                        onChanged: (newValue) {
                          setState(() {
                            includeEmail = newValue;
                          });
                        }),
                  ),
                  Text("Include Email")
                ],
              ),
              ButtonWidget(text: 'Submit', onTap: () {}),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
