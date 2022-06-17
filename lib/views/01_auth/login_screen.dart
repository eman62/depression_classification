import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:save/view_controllers/01_auth_controllers/auth_controller.dart';
import 'package:save/views/01_auth/reset_password.dart';
import '../widgets/components.dart';
import 'register_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        // appBar: AppBar(backgroundColor: Colors.green,),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 50),
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.green,
              Colors.lightGreen,
            ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              //  Padding(
              //   padding: EdgeInsets.all(20,),
              // child: Column ( children: [],
              //  ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: GetBuilder<AuthController>(
                                  init: AuthController(),
                                  builder: (controller) => Column(
                                    children: [
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      defaultFormField(
                                          controller: emailController,
                                          type: TextInputType.emailAddress,
                                          validate: (String? value) {
                                            bool emailValid = RegExp(
                                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(value!);

                                            if (value.isEmpty) {
                                              return 'Email address can\'t be empty';
                                            } else if (!emailValid) {
                                              return 'Enter a valid email';
                                            }
                                            return null;
                                          },
                                          label: 'Email address',
                                          prefix: Icons.email_outlined),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      defaultFormField(
                                          controller: passwordController,
                                          type: TextInputType.visiblePassword,
                                          validate: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'Password can\'t be empty';
                                            }
                                            return null;
                                          },
                                          label: 'password',
                                          prefix: Icons.lock,
                                          suffixIcon: controller.suffixIcon,
                                          isPassword: controller.isPassword,
                                          suffixPressed: () {
                                            controller.changePasswordVisibility();
                                            //  setState(() {
                                            //    ispassword =! ispassword;
                                            //  });
                                          }),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      GetBuilder<AuthController>(
                                        builder: (controller) => ConditionalBuilder(
                                          condition: controller.isLoadingLogin,
                                          builder: (context) => const CircularProgressIndicator(),
                                          fallback: (context) => defaultButton(
                                            width: double.infinity,
                                            background: Colors.green,
                                            function: () {
                                              if (formKey.currentState!.validate()) {
                                                //   if (AppCubit.get(context).)
                                                controller.userLogin(context,
                                                    email: emailController.text,
                                                    password: passwordController.text);
                                              }
                                            },
                                            text: 'Login',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text('Forget password ? '),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => ResetScreen()),
                                                );
                                                //
                                              },
                                              child: const Text(
                                                'Reset password',
                                                style: TextStyle(color: Colors.green, fontSize: 15),
                                              )),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text('Don\'t have an account ? '),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                                                );
                                                //
                                              },
                                              child: const Text(
                                                'Register now',
                                                style: TextStyle(color: Colors.green, fontSize: 15),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
