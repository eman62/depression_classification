import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save/view_controllers/02_user_controllers/user_controller.dart';
import '../../widgets/components.dart';
import '../../../helpers/constants.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    //  FileImage ImageProvider =  FileImage(profileImage);

    return GetBuilder<UserController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          title: Text('Edit Profile',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white, fontSize: 20)),
          actions: [
            MaterialButton(
              onPressed: () {
                controller.updateUser(
                    name: controller.nameController.text,
                    email: controller.emailController.text,
                    age: controller.ageController.text,
                    phone: controller.phoneController.text);
              },
              child: const Text('Update', style: TextStyle(color: Colors.amber, fontSize: 18)),
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (controller.isLoadingUpdateUser) const LinearProgressIndicator(),
              if (controller.isLoadingUpdateUser)
                const SizedBox(
                  height: 10,
                ),
              SizedBox(
                height: 170,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        ),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          radius: 75,
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: controller.profileImage == null
                                ? NetworkImage('${controller.userModel?.image}')
                                : FileImage(controller.profileImage!) as ImageProvider,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              controller.getProfileImage();
                              //  AppCubit.get(context).uploadProfileImage(name: nameController.text, email: emailController.text, age: ageController.text, phone: phoneController.text);
                            },
                            icon: const CircleAvatar(
                                radius: 20,
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  size: 16,
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (controller.profileImage == null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                        color: defaultColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          controller.updateUser(
                              name: controller.nameController.text,
                              email: controller.emailController.text,
                              age: controller.ageController.text,
                              phone: controller.phoneController.text);
                        },
                        child: const Text(
                          'upload profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: defaultFormField2(
                  controller: controller.nameController,
                  type: TextInputType.name,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'name must not be empty';
                    }
                    return null;
                  },
                  prefix: Icons.person,
                  hint: 'Name',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: defaultFormField2(
                  controller: controller.emailController,
                  type: TextInputType.emailAddress,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'email must not be empty';
                    }
                    return null;
                  },
                  hint: 'Email',
                  prefix: Icons.email,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: defaultFormField2(
                  controller: controller.ageController,
                  type: TextInputType.number,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'age must not be empty';
                    }
                    return null;
                  },
                  hint: 'Age',
                  prefix: Icons.calendar_today,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: defaultFormField2(
                  controller: controller.phoneController,
                  type: TextInputType.number,
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return 'phone must not be empty';
                    }
                    return null;
                  },
                  hint: 'Phone',
                  prefix: Icons.phone,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
