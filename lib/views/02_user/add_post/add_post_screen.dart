import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../../helpers/constants.dart';
import 'package:get/get.dart';
import '../../../view_controllers/02_user_controllers/user_controller.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (controller) {
        return ConditionalBuilder(
          condition: controller.userModel != null,
          builder: (context) => Column(
            children: [
              if (controller.isLoadingCreatePost) const LinearProgressIndicator(),
              if (controller.isLoadingCreatePost)
                const SizedBox(
                  height: 10,
                ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  children: [
                    const Spacer(),
                    MaterialButton(
                      onPressed: () {
                        //  AppCubit.get(context).currentIndex =0;
                        var now = DateTime.now();
                        if (controller.postImage == null) {
                          controller.createPost(
                              dateTime: now.toString(), text: controller.textController.text);
                        } else {
                          controller.uploadPostImage(
                              dateTime: now.toString(), text: controller.textController.text);
                        }
                      },
                      child: const Text(' Save Post', style: TextStyle(color: defaultColor, fontSize: 20)),
                    ),
                  ],
                ),
                //SizedBox(width: 5,)

                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage('${controller.userModel!.image}'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Text(
                      '${controller.userModel!.name}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.3),
                    )),
                  ],
                ),
              ),
              //  SizedBox(height: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: controller.textController,
                    decoration: const InputDecoration(
                      // fillColor: Colors.grey,
                      // filled: true,
                      ////////////////// اللون للكلام الي بدخله
                      hintText: 'what is your Story ...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (controller.postImage != null)
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                          image: FileImage(controller.postImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.removePostImage();
                        },
                        icon: const CircleAvatar(
                            radius: 20,
                            child: Icon(
                              Icons.close,
                              size: 16,
                            ))),
                  ],
                ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          controller.getPostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.image),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Add photo',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            // ),
          ),
          fallback: (context) => Center(
            child: Container(),
          ),
        );
      },
    );
  }
}
