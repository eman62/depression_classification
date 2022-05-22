import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save/view_controllers/01_auth_controllers/auth_controller.dart';
import '../widgets/components.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.green,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: GetBuilder<AuthController>(
            init: AuthController(),
            autoRemove: true,
            builder: (controller) => Form(
              key: formKey,
              child: Column(
                children: [
                  if (controller.isLoadingRegister) const LinearProgressIndicator(),
                  if ( controller.isLoadingRegister)
                    const SizedBox(
                      height: 10,
                    ),

                  Stack(
                    children: [
                      Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.green.withOpacity(.9),
                            radius: size.width * 0.14,
                            backgroundImage: controller.profileImage == null
                                ? const NetworkImage('https://www.colorbook.io/imagecreator.php?hex=4CAF50&width=1920&height=1080')
                                :  FileImage(controller.profileImage!) as ImageProvider,
                            child: controller.profileImage != null ? const Text('') : Icon(
                              Icons.person,
                              color: Colors.white,
                              size: size.width * 0.1,
                            ) ,
                          )),
                      Positioned(
                        top: size.height * 0.09,
                        left: size.width * .55,
                        child: Container(
                          height: size.width * 0.1,
                          width: size.width * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.7),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                            ),
                            onPressed: (){controller.getProfileImage();},
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defaultFormField(
                            controller: controller.nameController,
                            type: TextInputType.text,
                            validate: (String? value) {
                              if ((value!.isEmpty || ! RegExp  (r'^[a-z A-Z]+$').hasMatch(value)) ) {
                                return 'enter correct name';
                              }
                              return null;
                            },
                            label: 'username',
                            prefix: Icons.person),
                        const SizedBox(
                          height: 10,
                        ),

                        // defaultFormField(
                        //     controller: controller.phoneController,
                        //     type: TextInputType.phone,
                        //     inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),],
                        //     validate: (String? value) {
                        //       if (value!.isEmpty || ! RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(value)) {
                        //         return 'enter correct number';
                        //       }
                        //       return null;
                        //     },
                        //     label: 'phone number',
                        //     prefix: Icons.phone),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        defaultFormField(
                            controller: controller.ageController,
                            type: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),],
                            validate: (String? value) {
                              if (value!.isEmpty || ! RegExp(r'^[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(value)) {
                                return 'enter correct age';
                              }
                              return null;
                            },
                            label: 'age',
                            prefix: Icons.date_range),
                        const SizedBox(
                          height: 10,
                        ),

                        defaultFormField(
                            controller: controller.emailController,
                           // suffix: Text('h' , style: TextStyle(color: Colors.green),) ,
                            type: TextInputType.emailAddress,
                            // || RegExp (r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)
                            validate: (String? value) {
                              if (value!.isEmpty || !RegExp (r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!) ) {
                                return 'email address must not be empty';
                              }
                              return null;
                            },
                            label: 'email address',
                            prefix: Icons.email_outlined,
                        ),
                           
                            
                        const SizedBox(
                          height: 10,
                        ),

                        defaultFormField(
                            controller: controller.passwordController,
                            type: TextInputType.visiblePassword,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'password must not be empty';
                              }
                              return null;
                            },
                            label: 'password',
                            prefix: Icons.lock,
                            suffixIcon: controller.suffixIcon,
                            isPassword: controller.isPassword,
                            suffixPressed: () {
                              controller.changePasswordVisibility();
                            }),

                        const SizedBox(
                          height: 10,
                        ),

                        defaultFormField(
                            controller: controller.twitterController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'twitter account must not be empty';
                              }
                              return null;
                            },
                            label: 'Twitter account',
                            prefix: Icons.email),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: controller.isLoadingRegister,
                          builder: (context) => const Center(child: CircularProgressIndicator()),
                          fallback: (context) => Container(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: defaultButton(
                                width: size.width * .4,
                                background: Colors.green,
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    ///////////////////////
                                    controller.userRegister(
                                        name: controller.nameController.text,
                                        age: controller.ageController.text,
                                        email: controller.emailController.text,
                                        password: controller.passwordController.text,
                                        twitter: controller.twitterController.text);
                                    //////////////////////////////
                                  }
                                },
                                text: 'Sign Up'),
                          ),
                        ),
                        /////////////////////////
                        // IconButton(
                        //     icon: Icon(
                        //       Icons.brightness_medium_outlined,
                        //       color: Colors.green,
                        //     ),
                        //     onPressed: (){
                        //       AppCubit.get(context).changeAppMode();
                        //     }
                        // ),
                        ////////////////////////
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
