import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/layout/cubit/state.dart';
import 'package:save/layout/home_layout/HOME_PAGE.dart';
import 'package:save/layout/home_layout/admin_home_layout.dart';
import 'package:save/layout/home_layout/home_screen.dart';

import 'package:save/shared/network/local/cache_helper.dart';

import '../../layout/cubit/cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../register_screen/register_screen.dart';



class SocialLoginScreen extends StatelessWidget {
  SocialLoginScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AppCubit,AppStates>(
        listener: (context,state) async{
          if (state is AppLoginErrorStates){
            showToast(text:state.error, state: ToastStates.ERROR);
          }
          // if (state is AppLoginSuccessStates){
          //   await  CacheHelper.saveData(key: 'admin', value:AppCubit.get(context).userModel?.admin );
          //   await   CacheHelper.saveData(key: 'uId', value: state.uId )
          //       .then((value){
          //     if (AppCubit.get(context).userModel!.admin! ) {
          //       navigateAndFinish(context, AdminHome());
          //     }
          //     else{
          //       navigateAndFinish(context, HomeScreen());
          //     }
          //
          //     // navigateAndFinish(context, HomeScreen(),);
          //     // AppCubit.get(context).userModel.admin
          //     // navigateAndFinish(context, HomePage(),);
          //     print ('login screen');
          //     print (AppCubit.get(context).userModel!.admin!);
          //     // print (state.uId);
          //
          //   });

         // }
        },
        builder: (context,state){
          return Scaffold(
            // appBar: AppBar(backgroundColor: Colors.green,),
            body: Container (
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical:50 ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.lightGreen,
                    ]
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  //  Padding(
                  //   padding: EdgeInsets.all(20,),
                  // child: Column ( children: [],
                  //  ),
                  Padding(
                    padding:  const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,

                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('Welcome Back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,

                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: SingleChildScrollView(
                              child: Form(
                                key: formkey,
                                child: Column (
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: double.infinity,
                                        child: Column (
                                          children: [
                                            const SizedBox(height: 7,),
                                            defaultFormField(controller: emailController,
                                                type: TextInputType.emailAddress,
                                                validate: (String ?value){
                                                  if (value!.isEmpty){
                                                    return 'email address must not be empty';
                                                  }
                                                  return null;
                                                },
                                                label: 'email address',
                                                prefix: Icons.email_outlined),
                                            const SizedBox (
                                              height: 20,
                                            ),
                                            defaultFormField(controller: passwordController,
                                                type: TextInputType.visiblePassword,
                                                validate: (String? value){
                                                  if (value!.isEmpty){
                                                    return 'password must not be empty';
                                                  }
                                                  return null;
                                                },
                                                label: 'password',
                                                prefix: Icons.lock,
                                                suffix:AppCubit.get(context).suffix ,
                                                ispassword:AppCubit.get(context).IsPassword ,
                                                suffixpressed: (){
                                                  AppCubit.get(context).ChangePasswordVisibality();
                                                  //  setState(() {
                                                  //    ispassword =! ispassword;
                                                  //  });
                                                }

                                            ),
                                            const SizedBox (
                                              height: 20,
                                            ),
                                            ConditionalBuilder(
                                              condition:state is!AppLoginLoadingStates ,
                                              builder: (context)=>defaultButton(
                                                  width: double.infinity,
                                                  background: Colors.green,
                                                  function: (){

                                                    if (formkey.currentState!.validate()){
                                                    //   if (AppCubit.get(context).)
                                                      AppCubit.get(context).userLogin(context, email: emailController.text, password: passwordController.text);

                                                     // AppCubit.get(context).getUserData();
                                                     // print (AppCubit.get(context).userModel!.email);
                                                   //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> AdminHome()));

                                                    }

                                                    //  AppLoginCubit.get(context).userlogin
                                                  },
                                                  text: 'Login'),
                                              fallback:(context)=> const CircularProgressIndicator(),
                                            ),
                                            const SizedBox (
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Text('Don\'t have an account ? '),
                                                TextButton(onPressed: (){
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) =>  registerScreen()),
                                                  );
                                                  //
                                                },
                                                    child: const Text('Register now',style: TextStyle(color: Colors.green,fontSize: 15),)
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                  ),

                ],
              ),
            ),

          );
        },
    );
  }
}
