import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/shared/components/components.dart';
import 'package:save/shared/components/constants.dart';

import '../../../../cubit/cubit.dart';
import '../../../../cubit/state.dart';
import '../../edit_profile/edit_profile.dart';

class ProfileScreen extends StatelessWidget  {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
      //  AppCubit.get(context).getUserData();

        return BlocConsumer<AppCubit, AppStates>(

            listener: (context, state) {

            },
            builder: (context, state) {

              var userModel = AppCubit.get(context).userModel;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.green,
                  elevation: 0,
                ),

                body: ConditionalBuilder(
                  condition:  AppCubit.get(context).userModel != null ,
                  builder: (context)=>SingleChildScrollView(
                    child: Column(
                      children: [

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
                        Text(
                          '${userModel?.name}',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.5,fontSize: 25),
                        ),
                        SizedBox(height:50,),
                        Container(
                          width:  double.infinity,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            // clipBehavior: Clip.antiAlias,
                            shadowColor:Colors.grey[200],
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
                                        Icon(Icons.email,color: Colors.black54,),
                                        SizedBox(width: 10,),
                                        Text(
                                          'E-mail :' + ' ${userModel?.email}',
                                          //  maxLines: 1,
                                          //  overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.4,fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height:40,),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today,color: Colors.black54,),
                                      SizedBox(width: 10,),
                                      Text(
                                        'Age :' + ' ${userModel?.age}',
                                        //  maxLines: 1,
                                        //   overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.4,fontSize: 20),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height:40,),
                                  Row(
                                    children: [
                                      Icon(Icons.phone,color: Colors.black54,),
                                      SizedBox(width: 10,),
                                      Text(
                                        'Phone Number :' + ' ${userModel?.phone}',
                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.4,fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height:150,),
                       // Spacer(),
                        Row(
                          //mainAxisAlignment: ,
                          children: [
                            Expanded(child: MaterialButton(
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  editProfileScreen()),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width:20,),
                                  Text ('Edit profile',style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white,fontSize: 20),),
                                ],
                              ),
                              color: defaultColor,
                              height: 60,

                            ),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  fallback: (context) => Center(child: Scaffold()),
                ),

              );
            }
        );
      }
    );
  }
}


