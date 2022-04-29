import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:save/view_controllers/01_auth_controllers/auth_controller.dart';
import '../widgets/components.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final twitterController = TextEditingController();
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
            builder: (controller) => Form(
              key: formKey,
              child: Column(
                children: [
                  //  SizedBox(height:size.width *0.01 ,),
                  Stack(
                    children: [
                      Center(
                          child: CircleAvatar(
                        backgroundColor: Colors.green.withOpacity(.7),
                        radius: size.width * 0.14,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: size.width * 0.1,
                        ),
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
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
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
                            controller: nameController,
                            type: TextInputType.text,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'username must not be empty';
                              }
                              return null;
                            },
                            label: 'username',
                            prefix: Icons.person),
                        const SizedBox(
                          height: 10,
                        ),

                        defaultFormField(
                            controller: phoneController,
                            type: TextInputType.number,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'number must not be empty';
                              }
                              return null;
                            },
                            label: 'phone number',
                            prefix: Icons.phone),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultFormField(
                            controller: ageController,
                            type: TextInputType.number,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'age must not be empty';
                              }
                              return null;
                            },
                            label: 'age',
                            prefix: Icons.date_range),
                        const SizedBox(
                          height: 10,
                        ),

                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'email address must not be empty';
                              }
                              return null;
                            },
                            label: 'email address',
                            prefix: Icons.email_outlined),
                        const SizedBox(
                          height: 10,
                        ),

                        defaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'password must not be empty';
                              }
                              return null;
                            },
                            label: 'password',
                            prefix: Icons.lock,
                            suffix: controller.suffix,
                            ispassword: controller.isPassword,
                            suffixpressed: () {
                              controller.changePasswordVisibility();
                            }),

                        const SizedBox(
                          height: 10,
                        ),

                        defaultFormField(
                            controller: twitterController,
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
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        age: ageController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        twitter: twitterController.text);
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
