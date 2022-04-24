import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../cubit/cubit.dart';
import '../../../cubit/state.dart';
import '../../widgets/components.dart';
import '../../../helpers/constants.dart';

class editProfileScreen extends StatelessWidget {
    // const editProfileScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();

     var emailController = TextEditingController();

     var ageController = TextEditingController();
  var phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size ?size =MediaQuery.of(context).size;
  //  FileImage ImageProvider =  FileImage(profileImage);

    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var userModel=AppCubit.get(context).userModel;
          var profileImage =  AppCubit.get(context).profileImage ;
          nameController.text = userModel!.name!;
          emailController.text = userModel.email!;
          ageController.text = userModel.age!;
          phoneController.text = userModel.phone!;


          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              elevation: 0,
              title: Text('Edit Profile', style: Theme
                  .of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white, fontSize: 20)),
              actions: [
                MaterialButton(onPressed: () {
                  AppCubit.get(context).updateUser(name: nameController.text, email: emailController.text, age: ageController.text, phone: phoneController.text);

                },
                  child: Text('Update',
                      style: TextStyle(color: Colors.amber, fontSize: 18)),),
                SizedBox(width: 5,)

              ],
            ),

            body:  SingleChildScrollView(
              child: Column(
                children: [
                  if (state is updateUserLoadingState)
                    LinearProgressIndicator(),
                  if (state is updateUserLoadingState)
                    SizedBox(height: 10,),
                  Container(
                    height: 170,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(

                          child: Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
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
                              backgroundImage: profileImage == null ? NetworkImage('${userModel.image}') : FileImage(profileImage) as ImageProvider,
                              ),
                            ),
                            IconButton(onPressed: (){
                              AppCubit.get(context).getProfileImage();
                            //  AppCubit.get(context).uploadProfileImage(name: nameController.text, email: emailController.text, age: ageController.text, phone: phoneController.text);
                            }, icon: CircleAvatar(radius:20,child: Icon(Icons.camera_alt_rounded,size: 16,))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  if(AppCubit.get(context).profileImage == null)
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width*0.5,
                        decoration: BoxDecoration(
                          color: defaultColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: MaterialButton(onPressed: (){

                          AppCubit.get(context).updateUser(name: nameController.text, email: emailController.text, age: ageController.text, phone: phoneController.text);
                        },
                         child: Text('upload profile',style: TextStyle(
                           color: Colors.white,
                           fontSize: 20,
                         ),),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField2(controller: nameController, type: TextInputType.name,   validate: (String ?value){
                      if (value!.isEmpty){
                        return 'name must not be empty';
                      }
                      return null;
                    }, prefix: Icons.person, hint: 'Name',),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField2(controller: emailController, type: TextInputType.emailAddress,   validate: (String ?value){
                      if (value!.isEmpty){
                        return 'email must not be empty';
                      }
                      return null;
                    }, hint: 'Email', prefix: Icons.email,),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField2(controller: ageController, type: TextInputType.number,   validate: (String ?value){
                      if (value!.isEmpty){
                        return 'age must not be empty';
                      }
                      return null;
                    }, hint: 'Age', prefix: Icons.calendar_today,),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: defaultFormField2(controller: phoneController, type: TextInputType.number,   validate: (String ?value){
                      if (value!.isEmpty){
                        return 'phone must not be empty';
                      }
                      return null;
                    }, hint: 'Phone', prefix: Icons.phone,),
                  ),
                ],
              ),
            ),
          );
        }
    );


  }
}
