import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save/layout/cubit/cubit.dart';
import 'package:save/layout/cubit/state.dart';

class FeedbackScreen extends StatelessWidget {

  var feedbackControll = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override

  Widget build(BuildContext context) {
    Size ?size =MediaQuery.of(context).size;
    return BlocConsumer<AppCubit, AppStates> (
        listener: (context, state){
          if(state is AppSendFeedbackSuccessState)
          {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 50,
          width: size.width*.7,
          child: ElevatedButton(
            child: Text('SEND YOUR FEEDBACK',style: TextStyle(fontSize:size.width*.04 ),),
            onPressed: (){
              showDialog( context: context,builder:(context) =>FeedbackDialog(context), );
            },
          ),
        ),
      ),
    );}
    );}



  Widget FeedbackDialog(context) => AlertDialog(
    content: Form(
      key: formKey,
      child: TextFormField(
        controller: feedbackControll,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintText: 'Enter your feedback here ..',
          filled: true,
        ),
        maxLines: 5,
        maxLength: 4096,
        textInputAction: TextInputAction.done,
        validator: (String ?value){
          if (value!.isEmpty){
            return 'Please enter a value';
          }
          return null;
        },
      ),
    ),
    actions: [
      TextButton(onPressed: ()=> Navigator.pop(context), child: Text('Cancel'),),
      TextButton(onPressed: (){
        AppCubit.get(context).sendFeedback(text: feedbackControll.text);


      }, child: Text('Send'),),
    ],
  );
}
