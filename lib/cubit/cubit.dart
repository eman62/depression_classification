import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save/views/03_admin/admin_home.dart';
import 'package:save/models/feedback_model.dart';
import 'package:save/models/post_model.dart';
import 'package:save/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../helpers/cache_helper.dart';
import '../../views/02_user/add_post/add_post_screen.dart';
import '../../views/02_user/depressionState_screen/depression_screen.dart';
import '../../views/02_user/friends_screen/friends_screen.dart';
import '../../views/02_user/notification_screen/notification_screen.dart';
import '../../views/02_user/posts_screen/user_posts_screen.dart';
import '../cubit/state.dart';
import '../views/01_auth/login_screen.dart';
import '../views/widgets/components.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  AppUserModel? userModel;

  // void getUserData ()  {
  //   emit(AppGetUserLoadingState());
  //   FirebaseFirestore.instance.collection('users')
  //       .doc(uId)
  //       .snapshots()
  //       .listen((event) {
  //
  //         userModel = AppUserModel.fromJson(event.data()!);
  //         print (userModel!.email);
  //        emit(AppGetUserSuccessState());
  //       });
  //   }
////////////////////////
  Future<AppUserModel?> getUserData({String? uId}) async {
    emit(AppGetUserLoadingState());
    await FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(' here');
      print(value.data()!);
      //  print(value.data().runtimeType);

      userModel = AppUserModel.fromJson(value.data()!);

      //print (userModel!.uId);
      // print (userModel!.03_admin);
      emit(AppGetUserSuccessState());
      return userModel;
    }).catchError((error) {
      emit(AppGetUserErrorState(error.toString()));
    });
  }

/////////////////////////////


  // List <BottomNavigationBarItem> bottomItems =[
  //   BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
  //   BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notifications'),
  //   BottomNavigationBarItem(icon: Icon(Icons.people_alt_rounded),label: 'Friends'),
  //   BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Status'),
  // ];





  // void changeBottomNavBar(int index) {
  //   // currentIndex =index;
  //   if (index == 2) {
  //     // currentIndex =0;
  //     currentIndex = index;
  //     emit(AppNewPostState());
  //   } else {
  //     //currentIndex = 2;
  //     currentIndex = index;
  //     emit(AppBottomNavState());
  //   }
  // }

  ////////////////////////////////
  var picker = ImagePicker();

  File? profileImage;

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(AppProfileImagePickedSuccessState());
    } else {
      print('no image selected');
      emit(AppProfileImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String email,
    required String age,
    required String phone,
  }) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(updateProfileImageSuccessState());
        print(value);
        updateUser(name: name, email: email, age: age, image: value);
      }).catchError((error) {
        emit(updateProfileImageErrorState());
      });
    }).catchError((error) {
      emit(updateProfileImageErrorState());
    });
  }

  void updateUser({
    required String name,
    required String email,
    required String age,
    String? image,
  }) {
    emit(updateUserLoadingState());
    // if (profileImage != null) {
    //   uploadProfileImage();
    // } else {
    AppUserModel model = AppUserModel(
      email: email,
      name: name,
      age: age,
      image: image ?? userModel!.image,
      uId: userModel!.uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance.collection('users').doc(userModel!.uId).update(model.toMap()).then((value) {
      getUserData(uId: userModel?.uId);
    }).catchError((error) {
      emit(updateUserErrorState());
    });
    //}
  }

  /////////////////////////////////

  File? postImage;

  Future<void> getPostImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(AppPostImagePickedSuccessState());
    } else {
      print('no image selected');
      emit(AppPostImagePickedErrorState());
    }
  }

  void removePostImage() {
    postImage = null;
    emit(AppRemovePostImageState());
  }

/////////////////////////////////// error
  void uploadPostImage({
    required String dateTime,
    required String text,
  }) {
    emit(AppCreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPost(dateTime: dateTime, text: text, postImage: value);
      }).catchError((error) {
        emit(AppCreatePostErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(AppCreatePostErrorState(error.toString()));
    });
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    emit(AppCreatePostLoadingState());
    PostModel model = PostModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );
    FirebaseFirestore.instance.collection('posts').add(model.toMap()).then((value) {
      emit(AppCreatePostSuccessState());
    }).catchError((error) {
      emit(AppCreatePostErrorState(error.toString()));
    });
  }

  ////////////////

  // List<PostModel> posts = [];
  // List<String> postsId = [];
  // List<int> likes = [];
  // void getPosts() {
  //   if (posts.length == 0)
  //     FirebaseFirestore.instance.collection('posts').snapshots().listen((event) {
  //       posts = [];
  //       //postsId =[];
  //       event.docs.forEach((element) {
  //         //  posts =[];
  //         element.reference.collection('likes').snapshots().listen((event) {
  //           //   postsId =[];
  //           //  likes = [];
  //           likes.add(event.docs.length);
  //           postsId.add(element.id);
  //           posts.add(PostModel.fromJson(element.data()));
  //         });
  //         // posts =[];
  //       });
  //       emit(AppGetPostsSuccessState());
  //     });
  // }

  ///////////////////////////////

  void likePosts(String postId) {
    FirebaseFirestore.instance.collection('posts').doc(postId).collection('likes').doc(userModel!.uId).set({
      'like': true,
    }).then((value) {
      emit(AppLikePostsSuccessState());
    }).catchError((error) {
      emit(AppLikePostsErrorState(error.toString()));
    });
  }

  /////////////////////////////////

  List<AppUserModel> users = [];

  void getUsers() {
    if (users.length == 0)
      FirebaseFirestore.instance
          .collection('users')
          //   .get()
          .snapshots()
          .listen((event) {
        users = [];
        event.docs.forEach((element) {
          if (element.data()['uId'] != userModel?.uId) users.add(AppUserModel.fromJson(element.data()));
        });
        emit(AppGetAllUserSuccessState());
      });
  }

  /////////////////////////////////

  void sendFeedback({
    required String text,
  }) {
    emit(AppCreatePostLoadingState());
    FeedbackModel model = FeedbackModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      text: text,
    );
    FirebaseFirestore.instance.collection('feedback').add(model.toMap()).then((value) {
      emit(AppSendFeedbackSuccessState());
    }).catchError((error) {
      emit(AppSendFeedbackErrorState(error.toString()));
    });
  }

  // List<FeedbackModel> feedback = [];
  //
  // void getFeedbacks() {
  //   if (feedback.length == 0)
  //     FirebaseFirestore.instance.collection('feedback').snapshots().listen((event) {
  //       feedback = [];
  //       event.docs.forEach((element) {
  //         feedback.add(FeedbackModel.fromJson(element.data()));
  //       });
  //       emit(AppGetFeedbackSuccessState());
  //     });
  // }

  /////////////////////////////////
  // bool isDark = false;
  // ThemeMode appMode =ThemeMode.dark;

  // void changeAppMode({bool? fromShared}) {
  //   if (fromShared != null) {
  //     isDark = fromShared;
  //     emit(AppChangeModeState());
  //   } else {
  //     isDark = !isDark;
  //     CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
  //       emit(AppChangeModeState());
  //     });
  //   }
  // }

  ////////////////////////////////////
  // IconData suffix = Icons.visibility;
  // bool IsPassword = true;
  //
  // void ChangePasswordVisibality() {
  //   IsPassword = !IsPassword;
  //   suffix = IsPassword ? Icons.visibility : Icons.visibility_off;
  //   emit(AppChangePasswordVisibilityState());
  // }

  // Future<void> userLogin(
  //   context, {
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     emit(AppLoginLoadingStates());
  //     var value = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  //     AppUserModel? 02_user = await getUserData(uId: value.02_user!.uid);
  //     print('hello');
  //     print(02_user);
  //     await CacheHelper.saveData(key: '03_admin', value: 02_user!.03_admin);
  //     await CacheHelper.saveData(key: 'uId', value: value.02_user!.uid);
  //     emit(AppLoginSuccessStates(value.02_user!.uid));
  //   } on Exception catch (e, stacktrace) {
  //     print(e.toString());
  //     print(stacktrace);
  //     // TODO
  //   }
  //   // .then((value){
  //   // if (02_user.03_admin == true) {
  //   //   navigateAndFinish(context, AdminHome());
  //   // }
  //   // else{
  //   //   navigateAndFinish(context, HomeScreen());
  //   // }
  //
  //   //     .then((value)async{
  //   //    //   print (value.02_user!.email);
  //   //
  //   // // print (02_user.03_admin);
  //   //
  //   //      // print ('login screen');
  //   //      // print (AppCubit.get(context).userModel!.03_admin!);
  //   //
  //   //      // print (state.uId);
  //   //
  //   //    // });
  //   //   ////////////////////////////
  //   //   //FirebaseFirestore.instance.collection('users').where('email',isEqualTo:value.02_user!.email).get();
  //   //
  //   // //  getUserData();
  //   //  // CacheHelper.saveData(key: 'uId', value: value.02_user?.uid);
  //   //  // print (userModel?.email);
  //   //  // print (value.02_user!.uid);
  //   //  // return value.02_user!.uid;
  //   //    emit(AppLoginSuccessStates(value.02_user!.uid));
  //   // })
  //   //     .catchError((error){
  //   //   emit(AppLoginErrorStates(error.toString()));
  //   // });
  // }
////////////////////////////////////////////

  // IconData suffix = Icons.visibility;
  // bool IsPassword = true;
  //
  // void ChangePasswordVisibality(){
  //   IsPassword =!IsPassword;
  //   suffix =IsPassword? Icons.visibility:Icons.visibility_off;
  //   emit(AppChangePasswordVisibilityState2());
  //
  // }
////////////////////////////////////////
//   void UserRegister({
//     required String name,
//     required String phone,
//     required String age,
//     required String email,
//     required String password,
//     required String twitter,
//   }) {
//     emit(AppRegisterLoadingState());
//     FirebaseAuth.instance
//         .createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     )
//         .then((value) {
//       userCreate(name: name, phone: phone, age: age, email: email, twitter: twitter, uId: value.02_user!.uid);
//       // CacheHelper.saveData(key: 'uId', value: value.02_user!.uid);
//     }).catchError((error) {
//       print(error.toString());
//       emit(AppRegisterErrorState(error.toString()));
//     });
//   }
//
// ////////////////////////////////
//   void userCreate({
//     required String name,
//     required String phone,
//     required String age,
//     required String email,
//     required String twitter,
//     required String uId,
//   }) {
//     AppUserModel model = AppUserModel(
//       email: email,
//       name: name,
//       phone: phone,
//       age: age,
//       twitter: twitter,
//       uId: uId,
//       image: 'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4692e9108512257.5fbf40ee3888a.jpg',
//       isEmailVerified: false,
//       03_admin: false,
//     );
//
//     FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {
//       emit(AppCreateUserSuccessState());
//     }).catchError((error) {
//       emit(AppCreateUserErrorState(error.toString()));
//     });
//   }
//
// ///////////////////////////////////////
  void signOut(context) async {
    await FirebaseAuth.instance.signOut();
    await CacheHelper.reset();
    navigateAndFinish(context, LoginScreen());
  }

////////////////////
}
