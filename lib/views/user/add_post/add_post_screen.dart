import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/layout/cubit/cubit.dart';
import 'package:save/layout/cubit/state.dart';
import 'package:save/shared/components/components.dart';
import 'package:save/shared/components/constants.dart';

class NewPostScreen extends StatelessWidget {
  // const NewPostScreen({Key? key}) : super(key: key);

  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AppCubit, AppStates> (
      listener: (context, state) {
        if (state is AppCreatePostSuccessState )
        {
          textController.text = '';
        }
      },
      builder: (context, state) {

        return  ConditionalBuilder(
          condition: AppCubit.get(context).userModel != null,
          builder: (context) =>Column(
            children: [
              if (state is AppCreatePostLoadingState)
                LinearProgressIndicator(),
              if (state is AppCreatePostLoadingState)
                SizedBox(height: 10,),
              SizedBox(height: 20,),
              Container(
                child: Row(
                  children: [
                    Spacer(),
                    MaterialButton(onPressed: () {
                      //  AppCubit.get(context).currentIndex =0;
                      var now = DateTime.now();
                      if (AppCubit
                          .get(context)
                          .postImage == null) {
                        AppCubit.get(context).createPost(dateTime: now
                            .toString(), text: textController.text);
                      } else {
                        AppCubit.get(context).uploadPostImage(dateTime: now
                            .toString(), text: textController.text);
                      }


                    },
                      child: Text(' Save Post',
                          style: TextStyle(
                              color: defaultColor, fontSize: 20)),),
                  ],
                ),
                //SizedBox(width: 5,)

                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme
                      .of(context)
                      .scaffoldBackgroundColor,

                ),

              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                          '${AppCubit.get(context).userModel!.image}'),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Text(
                          '${AppCubit
                              .get(context)
                              .userModel!
                              .name}',
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(height: 1.3),
                        )),
                  ],
                ),
              ),
              //  SizedBox(height: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: textController,

                    decoration: InputDecoration(
                      // fillColor: Colors.grey,
                      // filled: true,
                      ////////////////// اللون للكلام الي بدخله
                      hintText: 'what is your Story ...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              if(AppCubit
                  .get(context)
                  .postImage != null)
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                          image: FileImage(AppCubit
                              .get(context)
                              .postImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {
                      AppCubit.get(context).removePostImage();
                    },
                        icon: CircleAvatar(
                            radius: 20, child: Icon(Icons.close, size: 16,))),
                  ],
                ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(onPressed: () {
                        AppCubit.get(context).getPostImage();
                      },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image),
                            SizedBox(width: 10,),
                            Text(
                              'Add photo', style: TextStyle(fontSize: 18),),
                          ],),),
                    ),
                  ],
                ),
              ),


            ],
            // ),

          ),
          fallback: (context) => Center(child: Container(),),
        );
      },

    );
  }
}