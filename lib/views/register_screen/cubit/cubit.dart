// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:save/models/user_model.dart';
// import 'package:save/views/register_screen/cubit/state.dart';
//
// class AppRegisterCubit extends Cubit <AppRegisterStates>{
//
//   AppRegisterCubit ():super (AppRegisterInitialState());
//
//   static AppRegisterCubit get(context)=>BlocProvider.of(context);
//
//   IconData suffix = Icons.visibility;
//   bool IsPassword = true;
//
//   void ChangePasswordVisibality(){
//     IsPassword =!IsPassword;
//     suffix =IsPassword? Icons.visibility:Icons.visibility_off;
//     emit(AppChangePasswordVisibilityState2());
//
//   }
// ////////////////////////////////////////
//   void UserRegister({
//     required String name,
//     required String phone,
//     required String age,
//     required String email,
//     required String password,
//     required String twitter,
//
//   })
//   {
//     emit(AppRegisterLoadingState());
//     FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     ).then((value) {
//       userCreate(name: name, phone: phone, age: age, email: email, twitter: twitter, uId:value.user!.uid);
//     }).catchError((error)
//     {
//       print (error.toString());
//       emit(AppRegisterErrorState(error.toString()));
//     });
//   }
//
// ////////////////////////////////
// void userCreate ({
//   required String name,
//   required String phone,
//   required String age,
//   required String email,
//   required String twitter,
//   required String uId,
// }){
//     AppUserModel model = AppUserModel(
//       email: email,
//       name: name,
//       phone: phone,
//       age: age,
//       twitter: twitter,
//       uId: uId,
//       image: 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
//       isEmailVerified: false,
//       admin: false,
//     );
//
//    FirebaseFirestore.instance
//        .collection('users')
//        .doc(uId)
//        .set(model.toMap())
//        .then((value) {
//          emit(AppCreateUserSuccessState());
//    })
//     .catchError((error){
//       emit(AppCreateUserErrorState(error.toString()));
//    });
// }
//
//
//
//
// }