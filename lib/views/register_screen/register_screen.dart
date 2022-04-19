import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/layout/cubit/cubit.dart';
import 'package:save/layout/cubit/state.dart';
import 'package:save/layout/home_layout/home_screen.dart';

import '../../shared/components/components.dart';
import 'cubit/cubit.dart';

class registerScreen extends StatelessWidget {
  //const registerScreen({Key? key}) : super(key: key);
  var NameController = TextEditingController();
  var phoneController = TextEditingController();
  var ageController = TextEditingController();
  var EmailController = TextEditingController();
  var PasswordController =TextEditingController();
  var twetterController =TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size ?size =MediaQuery.of(context).size;
    return BlocConsumer <AppCubit,AppStates>(
        listener: (context,state){
          if (state is AppCreateUserSuccessState){
            navigateAndFinish(context, HomeScreen());
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.arrow_back_outlined),onPressed: (){Navigator.pop(context);},color: Colors.green,),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            backgroundColor: Colors.white,
            body:SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                //  SizedBox(height:size.width *0.01 ,),
                    Stack(
                      children:[ Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.green.withOpacity(.7),
                            radius: size.width*0.14,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: size.width*0.1,
                            ),
                          )
                      ),
                        Positioned(
                          top: size.height*0.09,
                          left: size.width*.55,
                          child: Container(
                            height: size.width*0.1,
                            width: size.width*0.1,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.7),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white,width: 2),
                            ),
                            child: const Icon(Icons.camera_alt_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height:size.width *0.1 ,),
                    ////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /////////////////////////
                          defaultFormField(controller: NameController,
                              type: TextInputType.text,
                              validate: (String ?value){
                                if (value!.isEmpty){
                                  return 'username must not be empty';
                                }
                                return null;
                              },
                              label: 'username',
                              prefix: Icons.person),
                          ///////////////////////////////////
                          const SizedBox(height: 10,),
                          ////////////////////////////// phone

                          /////////////////////////////
                          defaultFormField(controller: phoneController,
                              type: TextInputType.number,
                              validate: (String ?value){
                                if (value!.isEmpty){
                                  return 'number must not be empty';
                                }
                                return null;
                              },
                              label: 'phone number',
                              prefix: Icons.phone),
                          /////////////////////////////////
                          const SizedBox(height: 10,),
                          ///////////////////////////
                          defaultFormField(controller: ageController,
                              type: TextInputType.number,
                              validate: (String ?value){
                                if (value!.isEmpty){
                                  return 'age must not be empty';
                                }
                                return null;
                              },
                              label: 'age',
                              prefix: Icons.date_range),
                          //////////////////////////
                          const SizedBox(height: 10,),

                          /////////////////////////////
                          defaultFormField(controller: EmailController,
                              type: TextInputType.emailAddress,
                              validate: (String ?value){
                                if (value!.isEmpty){
                                  return 'email address must not be empty';
                                }
                                return null;
                              },
                              label: 'email address',
                              prefix: Icons.email_outlined),
                          ///////////////////////////
                          const SizedBox(height: 10,),

                          ///////////////////////

                          defaultFormField(controller: PasswordController,
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
                          ////////////////////
                          const SizedBox(height: 10,),

                          defaultFormField(controller:twetterController,
                              type: TextInputType.emailAddress,
                              validate: (String ?value){
                                if (value!.isEmpty){
                                  return 'twitter account must not be empty';
                                }
                                return null;
                              },
                              label: 'Twitter account',
                              prefix: Icons.email),
                          SizedBox(height: 30,),
                          //////////////////////////////////
                          ConditionalBuilder(
                            condition: state is!AppRegisterLoadingState,
                            builder: (context)=> Container(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: defaultButton(
                                  width: size.width*.4,
                                  background: Colors.green,
                                  function: (){
                                    if (formkey.currentState!.validate()){
                                      ///////////////////////
                                      AppCubit.get(context).UserRegister(
                                          name: NameController.text,
                                          phone: phoneController.text,
                                          age: ageController.text,
                                          email: EmailController.text,
                                          password: PasswordController.text,
                                          twitter: twetterController.text);
                                      //////////////////////////////
                                    }
                                 },
                                  text: 'Sign Up'),
                            ),
                            fallback: (context)=>Center(child: CircularProgressIndicator()),
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

          );
        },
    );
  }
}
