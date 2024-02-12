import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop_app/components.dart';
import 'package:flutter_workshop_app/styles/textstyles.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    final thread = FirebaseFirestore.instance.collection('thread');
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'New thread',
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
                CreatePostContainer(controller: textEditingController),
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
                          text: 'Post',
                          type: CustomButtonType.secondary,
                          onPressed: () async {
                            await thread
                                .doc()
                                .set({
                                  'fromUser': 'User',
                                  'message': textEditingController.text,
                                  'createdAt': DateTime.now().toString()
                                })
                                .then((_) => Fluttertoast.showToast(
                                    msg: 'Thread has been posted',
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
