import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/layout/cubit/cubit.dart';
import 'package:save/layout/cubit/state.dart';
import 'package:save/models/feedback_model.dart';

class GetFeedbackScreen extends StatelessWidget {
  const GetFeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        AppCubit.get(context).getFeedbacks();
        return BlocConsumer<AppCubit, AppStates> (
          listener: (context, state){},
          builder: (context, state) {

            return Scaffold(
              appBar: AppBar(
                title:Text('Feedback', style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ConditionalBuilder(
                  condition: AppCubit.get(context).feedback.length > 0  || state is AppSendFeedbackSuccessState  ,
                  builder: (context) => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => builtPostItem(AppCubit.get(context).feedback[index], context,index),
                    separatorBuilder: (context, index) =>  SizedBox(height: 20,),
                    itemCount: AppCubit.get(context).feedback.length,),
                  fallback: (context) => Center(child: Scaffold()),
                ),
              ),
            );
          },

        );
      }
    );
  }


  Widget builtPostItem(FeedbackModel model, context, index) => Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage('${model.image}'),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${model.name}',
                        style:
                        Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.3,),
                      ),
                    ],
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7,bottom: 15),
            child: Container(
              height: 1,
              color: Colors.grey[300],
              width: double.infinity,
            ),
          ),
          Text('${model.text}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    ),
  );
}
