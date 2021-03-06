import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:final_t_and_t/Providers/main_user.dart';
import 'package:final_t_and_t/Providers/post.dart';
import 'package:final_t_and_t/Theme/app_theme.dart';
import 'package:final_t_and_t/Widgets/button_widget.dart';
import 'package:final_t_and_t/Widgets/input_widget.dart';
import 'package:final_t_and_t/Widgets/tag_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constatns.dart';

class NewPostScreen extends StatefulWidget {
  static const String id = 'NewPostScreen';
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  bool includePhone = false;
  bool includeEmail = false;
  List<String> selectedTags = [];
  String regionValue = defaultRegions[0].value;
  String subject = defaultSubjects[0].value;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mainUser = Provider.of<MainUser>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: [],
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
                hintText: 'Description:',
                controller: description,
                height: 350,
                maxLines: 1000,
              ),
              InputWidget(
                hintText: 'Price:',
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
              ButtonWidget(
                text: 'Submit',
                onTap: () {
                  Post post = Post(
                      title: title.text,
                      body: description.text,
                      price: price.text,
                      region: regionValue,
                      subject: subject,
                      hasEmail: includeEmail,
                      hasPhone: includePhone,
                      tags: selectedTags);
                  mainUser.createPost(post).then((value) {
                    if (value != 'Success') {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        title: 'Error',
                        desc: value,
                        btnOkColor: Colors.red,
                        btnOkOnPress: () {},
                      )..show();
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.SUCCES,
                        title: 'Success',
                        desc: value,
                        btnOkColor: Colors.green,
                        btnOkOnPress: () {},
                      )..show();
                    }
                  });
                },
              ),
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
