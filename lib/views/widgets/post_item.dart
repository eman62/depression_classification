import 'package:flutter/material.dart';
import 'package:save/helpers/date_helpers.dart';
import '../../models/post_model.dart';
import '../../view_controllers/02_user_controllers/user_controller.dart';
import 'package:get/get.dart';

class PostItem extends StatelessWidget {
  final PostModel model;
  final int index;
  final BuildContext context;
  final dynamic controller;
  final bool isAdmin;

  const PostItem(
      {Key? key,
      required this.context,
      required this.index,
      required this.model,
      required this.controller,
      this.isAdmin = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ///////////////////////
            // Container(),
            Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage('${model.image}'),
                ),
                const SizedBox(
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
                        const SizedBox(
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
                      DateHelpers.parseDateTimeReturnDescriptionString(model.dateTime!),
                      // model.dateTime!,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            height: 1.3,
                          ),
                    ),
                  ],
                )),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
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

            /// ///////////////////////
            // Container(),
            Text(
              '${model.text}',
              style: Theme.of(context).textTheme.bodyText1,
            ),

            const SizedBox(
              height: 15,
            ),

            // /////////// error
            //
            if (model.postImage != null && model.postImage != '')
              Container(
                height: 120,
                margin: const EdgeInsets.symmetric(vertical: 16),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage('${model.postImage}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            if (isAdmin == false)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: [
                        /// ///////////////////////
                        // Container(),
                        Expanded(
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    size: 17,
                                    color: controller.likedByMe[index]
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),

                                  // todo: resolve likes
                                  Text(
                                    // '0',
                                    '${controller.likesCounts[index]}',
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                          color: controller.likedByMe[index]
                                              ? Theme.of(context).colorScheme.primary
                                              : Colors.grey,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              controller.likeOrUnlikePost(controller.postsId[index], index);
                            },
                          ),
                        ),

                        /// ///////////////////////
                        // Container(),
                        Expanded(
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.mode_comment_rounded,
                                    size: 17,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '120 comment',
                                    style: Theme.of(context).textTheme.caption!,
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      height: 1,
                      color: Colors.grey[300],
                      width: double.infinity,
                    ),
                  ),
                  Row(
                    children: [
                      /// ///////////////////////
                      // Container(),
                      Expanded(
                        child: InkWell(
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 18.0,
                                backgroundImage: NetworkImage('${controller.userModel?.image}'),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'write a comment ..',
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                      height: 1.3,
                                    ),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),

                      /// ///////////////////////
                      // Container(),
                      InkWell(
                        child: Row(
                          children: [
                            Icon(
                              controller.likedByMe[index] ? Icons.check : Icons.favorite,
                              size: 17,
                              color: controller.likedByMe[index]
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              controller.likedByMe[index] ? 'Liked' : 'Like',
                              style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: controller.likedByMe[index]
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                        onTap: () {
                          controller.likeOrUnlikePost(controller.postsId[index], index);
                        },
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
