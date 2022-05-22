import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../view_controllers/02_user_controllers/user_controller.dart';
import '../../widgets/components.dart';

class AddFriendScreen extends StatelessWidget {
  AddFriendScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    return GetBuilder<UserController>(
      builder: (controller) {
        return ConditionalBuilder(
          condition: controller.userModel != null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: const  Text('Add Friend', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    if (controller.isLoadingAddFriend) const LinearProgressIndicator(),
                    if (controller.isLoadingAddFriend)
                      const SizedBox(height: 30,),

                    SizedBox(
                      height: size.width * 0.1,
                    ),
                    //  SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          defaultFormField(
                              controller: controller.nameFriendController,
                              type: TextInputType.text,
                              validate: (String? value) {
                                if ((value!.isEmpty || ! RegExp  (r'^[a-z A-Z]+$').hasMatch(value)) ) {
                                  return 'Please, Enter correct name.';
                                }
                                return null;
                              },
                              label: 'Name',
                              prefix: Icons.person),
                          SizedBox(
                            height:size.width * 0.1,
                          ),

                          defaultFormField(
                            controller: controller.phoneFriendController,
                            type: TextInputType.phone,
                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),],
                            validate: (String? value) {
                              if (value!.isEmpty || ! RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$').hasMatch(value)) {
                                return 'Please, Enter correct number.';
                              }
                              return null;
                            },
                            label: 'Phone Number',
                            prefix: Icons.phone,
                          ),
                          SizedBox(
                            height: size.width * 0.2,
                          ),

                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  controller.addFriend(
                                    name: controller.nameFriendController.text,
                                    phone: controller.phoneFriendController.text,
                                  );
                                }
                                controller.nameFriendController.text = '';
                                controller.phoneFriendController.text ='';
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.people),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Add Friend',
                                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
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
            ),
          ),
          fallback: (context) => Center(child: Container(),
          ),
        );
      },
    );
  }
}

