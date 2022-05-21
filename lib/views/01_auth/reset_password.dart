
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:save/view_controllers/01_auth_controllers/auth_controller.dart';
import 'package:save/views/01_auth/login_screen.dart';
import '../widgets/components.dart';
import 'package:get/get.dart';

class ResetScreen extends StatelessWidget {
  ResetScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Text(
                    //   'Welcome Back',
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 18,
                    //   ),
                    // ),
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
                                  builder: (controller) => Column(
                                    children: [
                                      const SizedBox(
                                        height: 7,
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
                                        height: 40,
                                      ),

                                              Row(
                                                children: [
                                                  defaultButton(
                                                    width: size.width*.4,
                                                    background: Colors.green,
                                                    function: () async{
                                                     if (formKey.currentState!.validate()) {
                                                  //   if (AppCubit.get(context).)
                                                      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text);
                                                      }
                                                     },
                                                    text: 'Reset',
                                          ),
                                               const Spacer(),
                                                  defaultButton(
                                                    width: size.width*.4,
                                                    background: Colors.green,
                                                    function: () {

                                                        //   if (AppCubit.get(context).)
                                                        navigateAndFinish(context, LoginScreen());

                                                    },
                                                    text: 'cancel',
                                                  ),
                                  ]
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
