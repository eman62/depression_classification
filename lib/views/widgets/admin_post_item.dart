import 'package:flutter/material.dart';
import '../../models/post_model.dart';
import '../../view_controllers/03_admin_controllers/admin_controller.dart';

class AdminPostItem extends StatelessWidget {
  final PostModel model;
  final BuildContext context;
  final int index;
  final AdminController controller;

  const AdminPostItem({
    Key? key,
    required this.index,
    required this.context,
    required this.model,
    required this.controller,
  }) : super(key: key);

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
                          '${model.dateTime}',
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

            Text(
              '${model.text}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
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
}
