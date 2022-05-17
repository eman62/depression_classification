
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text('New Post',style: TextStyle(fontSize: 20),),
              backgroundColor: Colors.green,
              actions: [
                MaterialButton(
                  onPressed: () {
                    //  AppCubit.get(context).currentIndex =0;
                    var now = DateTime.now();
                    controller.createPost(
                        dateTime: now.toString(), text: controller.textController.text);
                  },
                  child: const Text(' Save', style: TextStyle(color: Colors.amber, fontSize: 20)),
                ),
              ],
            ),
            body: Column(
              children: [
                if (controller.isLoadingCreatePost) const LinearProgressIndicator(),
                if (controller.isLoadingCreatePost)
                SizedBox(height: 30,),


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
                    child: SingleChildScrollView(
                      child: TextFormField(
                        minLines: 15,
                        maxLines: 80,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.done,
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
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
          ),
          fallback: (context) => Center(
            child: Container(),
          ),
        );
      },
    );
  }
}
