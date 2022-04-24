import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/models/user_model.dart';

import '../../../cubit/cubit.dart';
import '../../../cubit/state.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        AppCubit.get(context).getUsers();

        return BlocConsumer<AppCubit, AppStates> (
          listener: (context, state){},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title:Text('Users', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ConditionalBuilder(
                  condition: AppCubit.get(context).users.length > 0 || state is AppRegisterSuccessState  ,
                  builder: (context) => ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildUsersItem(AppCubit.get(context).users[index],context),
                      separatorBuilder: (context, index) =>  SizedBox(height: 20,),
                      itemCount: AppCubit.get(context).users.length),
                  fallback: (context) => Center(child: Scaffold()),
                ),
              ),
            );
          },

        );
      }
    );
  }

    Widget buildUsersItem (AppUserModel model,context) => Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('${model.image}'),
          ),
          SizedBox(width: 15,),
          Text('${model.name}',style:  Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.3,),),
        ],
      ),
    );
  }
