import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:save/view_controllers/02_user_controllers/user_controller.dart';
import 'package:save/views/widgets/components.dart';
import '../../../../helpers/constants.dart';
import '../../edit_profile/edit_profile.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      var userModel = controller.userModel;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10,top: 5),
              child: IconButton(
                onPressed: (){

                  showYesNoDialog(
                    headerString: 'Delete my account',
                    message: 'Are you sure to delete your account?',
                    noFunction: () => Get.back(),
                    yesFunction: () => controller.deleteMyAccount(context),

                  );


                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 10,top: 5),
              child: IconButton(
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>const  EditProfileScreen()),
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),

          ],
          elevation: 0,
        ),
        body: ConditionalBuilder(
          condition: controller.userModel != null,
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: [
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
                      CircleAvatar(
                        radius: 75,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage('${userModel?.image}'),
                        ),
                      ),

                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                    '${userModel?.name}',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.5, fontSize: 25),
                  ),
                   const SizedBox(width: 5,),
                    // IconButton(
                    //   onPressed: (){
                    //     Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) =>const  EditProfileScreen()),
                    //     );
                    //   },
                    //   icon: const Icon(
                    //     Icons.edit,
                    //     color: defaultColor,
                    //   ),
                    // ),
                    // TextButton(
                    //   onPressed: (){
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) =>const  EditProfileScreen()),
                    //     );
                    //   },
                    //   child: Text(
                    //     'edit',
                    //     style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.5, fontSize: 20,color: defaultColor),
                    //   ),
                    // ),
                  ]
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    // clipBehavior: Clip.antiAlias,
                    shadowColor: Colors.grey[200],
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.email,
                                  color: Colors.black54,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'E-mail :' + ' ${userModel?.email}',
                                  //  maxLines: 1,
                                  //  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(height: 1.4, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today,
                                color: Colors.black54,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Age :' + ' ${userModel?.age}',
                                //  maxLines: 1,
                                //   overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(height: 1.4, fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.email_outlined,
                                color: Colors.black54,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Twitter :' + ' ${userModel?.twitter}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(height: 1.4, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 150,
                // ),
                // Spacer(),
                // Row(
                //   //mainAxisAlignment: ,
                //   children: [
                //     Expanded(
                //       child: MaterialButton(
                //         onPressed: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(builder: (context) => EditProfileScreen()),
                //           );
                //         },
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             const Icon(
                //               Icons.edit,
                //               color: Colors.white,
                //             ),
                //             const SizedBox(
                //               width: 20,
                //             ),
                //             Text(
                //               'Edit profile',
                //               style: Theme.of(context)
                //                   .textTheme
                //                   .bodyText1!
                //                   .copyWith(color: Colors.white, fontSize: 20),
                //             ),
                //           ],
                //         ),
                //         color: defaultColor,
                //         height: 60,
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
          fallback: (context) => const Center(child: Scaffold()),
        ),
      );
    });
  }
}
