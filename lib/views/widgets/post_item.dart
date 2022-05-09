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
                            onTap: () {
                              showCommentsBottomSheet(controller: controller, index: index);
                            },
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
                          onTap: () {
                            controller.commentController.text = '';
                            showCommentsBottomSheet(controller: controller, index: index);
                          },
                        ),
                      ),

                      /// like text
                      /// ///////////////////////
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

showCommentsBottomSheet({required controller, required index}) {
  Get.bottomSheet(
    CommentsBottomSheet(controller: controller, index: index),
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: true,
  );
}

class CommentsBottomSheet extends StatefulWidget {
  final controller;
  final index;
  const CommentsBottomSheet({Key? key, required this.controller, required this.index}) : super(key: key);

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 8),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
        ),
        child: Column(
          children: [
            /// existing comments
            SizedBox(
              height: Get.height - 300,
              child: ListView(
                // physics: BouncingScrollPhysics(),
                children: [
                  CommentItem(controller: widget.controller),
                  CommentItem(controller: widget.controller),
                  CommentItem(controller: widget.controller),
                  CommentItem(controller: widget.controller),
                  CommentItem(controller: widget.controller),
                  CommentItem(controller: widget.controller),
                ],
              ),
              // child: ListView.builder(itemBuilder: itemBuilder),
            ),

            /// publishing comments
            Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(7),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CommentField(controller: widget.controller),
            ),
          ],
        ),
      ),
    );
  }
}

/// /////////////////////////////////////////////////////////////////////////////////
class CommentItem extends StatelessWidget {
  final controller;
  const CommentItem({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// image // todo: set to commented user image
          CircleAvatar(
            radius: 18.0,
            backgroundImage: NetworkImage('${controller.userModel?.image}'),
          ),

          Container(
            width: Get.width - 70,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Text(
              'Comment goes here .. Comment goe .. Comment goese .. Comment goes here .. '
              'Comment gere .. Comment  here .. Cot goes here .. Comment goes here .. '
              'Comment goes e .. Comment goes here .. Comment g .. Comment gre .. ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommentField extends StatelessWidget {
  final controller;
  const CommentField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// image
        CircleAvatar(
          radius: 18.0,
          backgroundImage: NetworkImage('${controller.userModel?.image}'),
        ),

        /// text field
        SizedBox(
          width: Get.width - 140,
          child: TextFormField(
            controller: controller.commentController,
            maxLines: 2,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),

        /// button
        InkWell(
          // todo: do comment
          onTap: () => null,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            child: const Icon(
              Icons.send_rounded,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}
