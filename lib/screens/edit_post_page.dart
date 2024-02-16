import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/components.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditPostPage extends StatefulWidget {
  final Map<String, dynamic>? threadData;
  const EditPostPage({super.key, required this.threadData});

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  Map<String, dynamic>? user;
  @override
  void initState() {
    super.initState();
    loadPrefs();
  }

  Future<void> loadPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      user = json.decode(prefs.getString('user')!);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController =
        TextEditingController(text: widget.threadData?['message']);
    final thread = FirebaseFirestore.instance.collection('thread');
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Edit thread',
              style: TextStyles.displayTextMedium,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            centerTitle: true,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cancel',
                    style: TextStyles.titleText
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
            leadingWidth: 100,
          ),
          Divider(thickness: 0.5, color: Colors.grey[200]),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CreatePostContainer(
                    controller: textEditingController,
                    nickName: user?['nickName'] ?? ''),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Anyone can reply',
                          style:
                              TextStyles.bodyText.copyWith(color: Colors.grey),
                        ),
                        CustomButton(
                          text: 'Edit',
                          type: CustomButtonType.secondary,
                          onPressed: () async {
                            await thread
                                .doc(widget.threadData?['id'])
                                .update({
                                  'message': textEditingController.text,
                                })
                                .then((_) => Fluttertoast.showToast(
                                    msg: 'Thread has been editted',
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white))
                                .then((value) => Navigator.pop(context))
                                .catchError((error, stackTrace) =>
                                    Fluttertoast.showToast(
                                        msg:
                                            'Error occured. Please try again later',
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.grey,
                                        textColor: Colors.white));
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 10),
        ],
      ),
    );
  }
}
