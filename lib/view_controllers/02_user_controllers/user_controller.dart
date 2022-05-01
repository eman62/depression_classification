import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../helpers/cache_helper.dart';
import '../../helpers/globals.dart';
import '../../models/feedback_model.dart';
import '../../models/post_model.dart';
import '../../models/user_model.dart';
import '../../views/01_auth/login_screen.dart';
import '../../views/widgets/components.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';

class UserController extends GetxController {
  int currentIndex = 0;
  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];
  AppUserModel? userModel;
  bool isLoadingGetUserData = false;
  bool isLoadingCreatePost = false;
  var textController = TextEditingController();
  var picker = ImagePicker();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var phoneController = TextEditingController();
  var feedbackController = TextEditingController();
  File? postImage;
  File? profileImage;
  bool isLoadingUpdateUser = false;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    update();
  }

  changeIsLoadingGetUserDataState(bool state) {
    isLoadingGetUserData = state;
    update();
  }

  getUserData({String? uId}) async {
    try {
      changeIsLoadingGetUserDataState(true);
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('users').doc(uId).get();
      userModel = AppUserModel.fromJson(snapshot.data()! as Map<String, dynamic>);
      nameController.text = userModel!.name!;
      emailController.text = userModel!.email!;
      ageController.text = userModel!.age!;
      phoneController.text = userModel!.phone!;
      changeIsLoadingGetUserDataState(false);
      return userModel;
    } catch (e, stacktrace) {
      print('XXX EXCEPTION');
      print(stacktrace);
      showToast(text: e.toString(), state: ToastStates.error);
      changeIsLoadingGetUserDataState(false);
    }
    update();
  }

  bool isLoadingGettingPosts = false;
  changeIsLoadingGettingPosts(bool state) {
    isLoadingGettingPosts = state;
    update();

  }


  /// todo: check method
  void getPosts() async {
    try {
      changeIsLoadingGettingPosts(true);
      print('/// GETTING POSTS ...');
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('posts').get();
      posts.addAll(snapshot.docs.map<PostModel>((e) => PostModel.fromJson(e.data())).toList());
      print(posts);
      print(posts.length);
      changeIsLoadingGettingPosts(false);

    } catch (e, stacktrace) {
      changeIsLoadingGettingPosts(false);
      print(e);
      print(stacktrace);
    }

    listenToNewPosts();

    update();
  }

  listenToNewPosts() {
    if (posts.isEmpty) {
      FirebaseFirestore.instance.collection('posts').snapshots().listen((event) {
        posts = [];
        //postsId =[];
        event.docs.forEach((element) {
          //  posts =[];
          element.reference.collection('likes').snapshots().listen((event) {
            //   postsId =[];
            //  likes = [];
            likes.add(event.docs.length);
            postsId.add(element.id);
            posts.add(PostModel.fromJson(element.data()));
          });
          // posts =[];
        });
      });
    }
  }

  /// todo: check method
  void getLikes() async {
    // try {
    //   changeIsLoadingGettingPosts(true);
    //   print('/// GETTING LIKES ...');
    //   QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('likes').get();
    //   likes.addAll(snapshot.docs.map<int>((e) => )).toList());
    //   print(posts);
    //   print(posts.length);
    //   changeIsLoadingGettingPosts(false);
    //
    // } catch (e, stacktrace) {
    //   changeIsLoadingGettingPosts(false);
    //   print(e);
    //   print(stacktrace);
    // }
    //
    // listenToNewLikes();
    // update();
    //

  }

  listenToNewLikes() {
    // if (posts.isEmpty) {
    //   FirebaseFirestore.instance.collection('posts').snapshots().listen((event) {
    //     posts = [];
    //     //postsId =[];
    //     event.docs.forEach((element) {
    //       //  posts =[];
    //       element.reference.collection('likes').snapshots().listen((event) {
    //         //   postsId =[];
    //         //  likes = [];
    //         likes.add(event.docs.length);
    //         postsId.add(element.id);
    //         posts.add(PostModel.fromJson(element.data()));
    //       });
    //       // posts =[];
    //     });
    //   });
    // }
  }

  changeIsLoadingCreatePost(bool state) {
    isLoadingCreatePost = state;
    update();
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    changeIsLoadingCreatePost(true);
    PostModel model = PostModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );
    FirebaseFirestore.instance.collection('posts').add(model.toMap()).then((value) {
      textController.text = '';

      changeIsLoadingCreatePost(false);
    }).catchError((error) {
      changeIsLoadingCreatePost(false);
    });
    update();
  }

  Future<void> getPostImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
    } else {
      print('no image selected');
    }
    update();
  }

  void removePostImage() {
    postImage = null;
    update();
  }

/////////////////////////////////// error
  void uploadPostImage({
    required String dateTime,
    required String text,
  }) {
    changeIsLoadingCreatePost(true);
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPost(dateTime: dateTime, text: text, postImage: value);
      }).catchError((error) {
        changeIsLoadingCreatePost(false);
      });
    }).catchError((error) {
      changeIsLoadingCreatePost(false);
    });
  }

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
    } else {
      print('no image selected');
    }
    update();
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
        print(value);
        updateUser(name: name, email: email, age: age, phone: phone, image: value);
      }).catchError((error) {});
    }).catchError((error) {});
    update();
  }

  changeIsLoadingUpdateUser(bool state) {
    isLoadingUpdateUser = state;
    update();
  }

  void updateUser({
    required String name,
    required String email,
    required String age,
    required String phone,
    String? image,
  }) {
    changeIsLoadingUpdateUser(true);
    // if (profileImage != null) {
    //   uploadProfileImage();
    // } else {
    AppUserModel model = AppUserModel(
      email: email,
      name: name,
      phone: phone,
      age: age,
      image: image ?? userModel!.image,
      uId: userModel!.uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance.collection('users').doc(userModel!.uId).update(model.toMap()).then((value) {
      getUserData(uId: userModel?.uId);
      changeIsLoadingUpdateUser(false);
    }).catchError((error) {
      changeIsLoadingUpdateUser(false);
    });
    //}
  }

  void sendFeedback({
    required String text,
  }) {
    changeIsLoadingCreatePost(true);
    FeedbackModel model = FeedbackModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      text: text,
    );
    FirebaseFirestore.instance.collection('feedback').add(model.toMap()).then((value) {
      changeIsLoadingCreatePost(false);
      Get.back();
    }).catchError((error) {
      changeIsLoadingCreatePost(false);
    });
  }

  void likePosts(String postId) {
    FirebaseFirestore.instance.collection('posts').doc(postId).collection('likes').doc(userModel!.uId).set({
      'like': true,
    }).then((value) {
      // todo: re-fetch the posts from the firebase
    }).catchError((error) {
      showToast(text: '$error', state: ToastStates.error);
    });
    update();
  }

  void signOut(context) async {
    await FirebaseAuth.instance.signOut();
    await CacheHelper.reset();
    token = '';
    uId = '';
    isAdmin = null;
    navigateAndFinish(context, SocialLoginScreen());
  }

  @override
  void onInit() {
    getPosts();
    getLikes();
    getUserData(uId: uId);
    super.onInit();
  }
}
