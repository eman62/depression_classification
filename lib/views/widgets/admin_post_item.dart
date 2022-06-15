import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:save/helpers/date_helpers.dart';
import '../../models/post_model.dart';
import '../../view_controllers/03_admin_controllers/admin_controller.dart';

class AdminPostItem extends StatelessWidget {
  final PostModel model;
  final BuildContext context;
  final int postIndex;
  final AdminController controller;

  const AdminPostItem({
    Key? key,
    required this.postIndex,
    required this.context,
    required this.model,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Card(
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

                /// Add Icon Delete
                /////////////////////////////

                // todo: #1
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              title: Text(
                                'Delete Post',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              content: Text(
                                'Are you sure to delete post ?',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    'Cancel',
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    controller.deletePost(id: controller.postsId[postIndex]);
                                  },
                                  child: Text(
                                    'Delete',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(color: Colors.red),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 22,
                      color: Colors.grey,
                    ))
                ,
                /////////////////////////////
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
                                  Icons.thumb_up_alt,

                                  /// change Icon
                                  size: 22,

                                  /// change Size
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),

                                // todo: resolve likes
                                Text(
                                  // '0',
                                  controller.likesCounts.isEmpty
                                      ? '-'
                                      : controller.likesCounts[postIndex].toString(),
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                    color:Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      /// ///////////////////////
                      Container(),
                      Expanded(
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                 Icon(
                                  Icons.mode_comment_rounded,
                                  size: 17,
                                    color:Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  controller.commentsCounts[postIndex].toString(),
                                  style: TextStyle(color:Theme.of(context).colorScheme.primary),
                                ),


                                ///////////////////////////////////
                              ],
                            ),
                          ),
                          onTap: () {
                            showCommentsBottomSheet(controller: controller, postIndex: postIndex);
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
                // Row(
                //   children: [
                //     /// ///////////////////////
                //     // Container(),
                //     // Expanded(
                //     //   child: InkWell(
                //     //     child: Row(
                //     //       children: [
                //     //         CircleAvatar(
                //     //           radius: 18.0,
                //     //           backgroundImage: NetworkImage('${controller.userModel?.image}'),
                //     //         ),
                //     //         const SizedBox(
                //     //           width: 15,
                //     //         ),
                //     //         Text(
                //     //           'write a comment ..',
                //     //           style: Theme.of(context).textTheme.caption!.copyWith(
                //     //             height: 1.3,
                //     //           ),
                //     //         ),
                //     //       ],
                //     //     ),
                //     //     onTap: () {
                //     //       controller.commentController.text = '';
                //     //       showCommentsBottomSheet(controller: controller, postIndex: postIndex);
                //     //     },
                //     //   ),
                //     // ),
                //
                //     /// like text
                //     /// ///////////////////////
                //     // InkWell(
                //     //   child: Row(
                //     //     children: [
                //     //       Icon(
                //     //         controller.likedIndex.contains(postIndex) ? Icons.check : Icons.thumb_up_alt,
                //     //
                //     //         ///change icon
                //     //         size: 17,
                //     //         color: controller.likedIndex.contains(postIndex)
                //     //             ? Theme.of(context).colorScheme.primary
                //     //             : Colors.grey,
                //     //       ),
                //     //       const SizedBox(
                //     //         width: 5,
                //     //       ),
                //     //       Text(
                //     //         controller.likedIndex.contains(postIndex) ? 'Liked' : 'Like',
                //     //         style: Theme.of(context).textTheme.caption!.copyWith(
                //     //           color: controller.likedIndex.contains(postIndex)
                //     //               ? Theme.of(context).colorScheme.primary
                //     //               : Colors.grey,
                //     //         ),
                //     //       ),
                //     //     ],
                //     //   ),
                //     //   onTap: () {
                //     //     controller.likeOrUnlikePost(controller.postsId[postIndex], postIndex);
                //     //   },
                //     // ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );

  }
}
showCommentsBottomSheet({required AdminController controller, required int postIndex}) {
  Get.bottomSheet(
    CommentsBottomSheet(controller: controller, postIndex: postIndex),
    isScrollControlled: true,
    enableDrag: true,
    isDismissible: true,
  );

  controller.changeIsLoadingGetCommentsOnPost(true);
  controller.getCommentsOnPosts(controller.postsId[postIndex], postIndex);
}
class CommentsBottomSheet extends StatefulWidget {
  final AdminController controller;
  final int postIndex;
  const CommentsBottomSheet({Key? key, required this.controller, required this.postIndex}) : super(key: key);

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
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Column(
          children: [
            /// existing comments
            GetBuilder<AdminController>(
              builder: (controller) => SizedBox(
                height: Get.height - 300,
                child: controller.isLoadingGetCommentsOnPost
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : controller.comments[widget.postIndex].isEmpty
                    ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.mode_comment,
                        color: Colors.grey,
                        size: 100,
                      ),
                      Text(
                        'No comments yet',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Be the first.',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
                    : ListView.builder(
                  itemCount: controller.comments[widget.postIndex].length,
                  itemBuilder: (context, commentIndex) {
                    //print('/// post index ${widget.postIndex} comment index $commentIndex');
                    // print(widget.postIndex);
                    return CommentItem(
                      controller: controller,
                      postIndex: widget.postIndex,
                      commentIndex: commentIndex,
                    );
                  },
                ),
              ),
            ),

            /// publishing comments
            CommentField(controller: widget.controller, index: widget.postIndex),
          ],
        ),
      ),
    );
  }
}
class CommentItem extends StatelessWidget {
  final AdminController controller;
  final int postIndex;
  final int commentIndex;
  const CommentItem({Key? key, required this.controller, required this.postIndex, required this.commentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18.0,
            backgroundImage: NetworkImage('${controller.comments[postIndex][commentIndex]['userImageUrl']}'),
            backgroundColor: Colors.grey,
          ),
          Container(
            width: Get.width - 70,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.comments[postIndex][commentIndex]['name'],
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  controller.comments[postIndex][commentIndex]['text'],
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommentField extends StatelessWidget {
  final AdminController controller;
  final int index;
  const CommentField({Key? key, required this.controller, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
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
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.white.withOpacity(0.1),
              child: TextFormField(
                controller: controller.commentController,
                minLines: 1,
                maxLines: 5,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          //button
          InkWell(
            onTap: () => controller.commentOnPost(controller.postsId[index], index),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
              child: const Icon(
                Icons.send_rounded,
                size: 22,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
