import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:save/models/post_model.dart';
import 'package:save/view_controllers/03_admin_controllers/admin_controller.dart';
import 'package:get/get.dart';

import '../../widgets/post_item.dart';

class AdminPostsScreen extends StatelessWidget {
  const AdminPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Posts',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ConditionalBuilder(
            condition: (controller.posts.isNotEmpty),
            builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => PostItem(
                model: controller.posts[index],
                context: context,
                index: index,
                controller: controller,
                isAdmin: true,
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: controller.posts.length,
            ),
            fallback: (context) => const Center(child: Scaffold()),
          ),
        ),
      );
    });
  }

  Widget builtPostItem(PostModel model, context, index) => Card(
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
                      Row(
                        children: [
                          Text(
                            '${model.name}',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  height: 1.3,
                                ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          // Icon(
                          //   Icons.check_circle,
                          //   color: Colors.blue,
                          //   size: 16,
                          //
                          // ),
                        ],
                      ),
                      Text(
                        '${model.dateTime}',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              height: 1.3,
                            ),
                      ),
                    ],
                  )),
                  SizedBox(
                    width: 15,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_horiz,
                        size: 18,
                        color: Colors.grey,
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
              SizedBox(
                height: 15,
              ),

              ///////////// error

              // if(model.postImage != null)
              //     Container(
              //   height: 120,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5),
              //     image: DecorationImage(
              //       image: NetworkImage('${model.postImage}'),
              //       fit: BoxFit.cover,
              //     ),
              //     ),
              // ),
            ],
          ),
        ),
      );
}
