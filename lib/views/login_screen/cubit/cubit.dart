// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:save/layout/home_layout/admin_home_layout.dart';
// import 'package:save/models/user_model.dart';
// import 'package:save/views/login_screen/cubit/state.dart';
// import 'package:save/shared/components/constants.dart';
//
//
// class AppLoginCubit extends Cubit <AppLoginStates>{
//
//   AppLoginCubit ():super (AppLoginInitialStates());
//
//   static AppLoginCubit get(context)=>BlocProvider.of(context);
//
//   IconData suffix = Icons.visibility;
//   bool IsPassword = true;
//
//   void ChangePasswordVisibality(){
//     IsPassword =!IsPassword;
//     suffix =IsPassword? Icons.visibility:Icons.visibility_off;
//     emit(AppChangePasswordVisibilityState());
//
//   }
//
//   void userLogin({
//     required String email,
//     required String password,
// }){
//     emit(AppLoginLoadingStates());
//     FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
//         .then((value){
//
//           print(value.user!.email);
//           print(value.user!.uid);
//
//     emit(AppLoginSuccessStates(value.user!.uid));
//     })
//         .catchError((error){
//       emit(AppLoginErrorStates(error.toString()));
//     });
//   }
//
//
// }