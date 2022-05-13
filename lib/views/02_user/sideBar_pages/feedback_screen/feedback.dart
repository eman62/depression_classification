import 'package:flutter/material.dart';
import 'package:save/view_controllers/02_user_controllers/user_controller.dart';
import 'package:get/get.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    return GetBuilder<UserController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SizedBox(
            height: 50,
            width: size.width * .7,
            child: ElevatedButton(
              child: Text(
                'SEND YOUR FEEDBACK',
                style: TextStyle(fontSize: size.width * .04),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => feedbackDialog(context),
                );
              },
            ),
          ),
        ),
      );
    });
  }

  Widget feedbackDialog(context) => GetBuilder<UserController>(
        builder: (controller) => AlertDialog(
          //contentTextStyle:Theme.of(context).textTheme.bodyText1,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: controller.feedbackController,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'Enter your feedback here ..',
                filled: true,
              ),
              maxLines: 5,
              maxLength: 4096,
              textInputAction: TextInputAction.done,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.sendFeedback(text: controller.feedbackController.text);
              },
              child: const Text('Send'),
            ),
          ],
        ),
      );
}
