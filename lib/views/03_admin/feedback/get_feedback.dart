import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:save/models/feedback_model.dart';
import 'package:get/get.dart';
import '../../../view_controllers/03_admin_controllers/admin_controller.dart';

class GetFeedbackScreen extends StatelessWidget {
  const GetFeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Feedback',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ConditionalBuilder(
              condition: controller.feedback.isNotEmpty,
              builder: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    builtPostItem(controller.feedback[index], context, index),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: controller.feedback.length,
              ),
              fallback: (context) => const Center(child: Scaffold()),
            ),
          ),
        );
      },
    );
  }

  Widget builtPostItem(FeedbackModel model, context, index) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage('${model.image}'),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${model.name}',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              height: 1.3,
                            ),
                      ),
                    ],
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 7, bottom: 15),
                child: Container(
                  height: 1,
                  color: Colors.grey[300],
                  width: double.infinity,
                ),
              ),
              Text(
                '${model.text}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      );
}
