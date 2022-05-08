import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save/style/themes.dart';
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
  List<Map<String, dynamic>> likes = [];
  List<int> likesCounts = [];
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
  List<bool> likedByMe = [];

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

  getPosts() {
    try {
      FirebaseFirestore.instance.collection('posts').snapshots().listen((event) async {
        print('/// GET POSTS ...');

        /// Get Posts and likes counts
        for (int i = 0; i < event.docs.length; i++) {
          postsId.add(event.docs[i].id);
          posts = [];
          posts.add(PostModel.fromJson(event.docs[i].data()));
        }

        /// Get likes
        for (int i = 0; i < event.docs.length; i++) {
          var snapshot = await event.docs[i].reference.collection('likes').get();
          likesCounts = [];

          likesCounts.add(snapshot.docs.length);
          likes = [];

          if (snapshot.docs.isNotEmpty) likes.add(snapshot.docs[i].data());

          await event.docs[i].reference.collection('likes').get().then((snapshot) {
            if (snapshot.docs.isNotEmpty) {
              for (var element in snapshot.docs) {
                element.data()['uId'] == userModel!.uId ? likedByMe.add(true) : likedByMe.add(false);
              }
            } else {
              likedByMe.add(false);
            }
          });
        }
        changeIsLoadingGettingPosts(false);

        update();
      });
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  likeOrUnlikePost(postUid, index) {
    try {
      FirebaseFirestore.instance.collection('posts').doc(postUid).collection('likes').get().then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          for (var element in snapshot.docs) {
            print(element.data()['uId']);
            print(userModel!.uId);
            if (element.data()['uId'] == userModel!.uId) {
              _unlikePost(postUid, index);
            } else {
              _likePost(postUid, index);
            }
          }
        } else {
          _likePost(postUid, index);
        }
      });
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
  }

  _likePost(String postUid, index) {
    print('/// LIKE');
    Map<String, Object?> data = {'uId': userModel!.uId};
    FirebaseFirestore.instance.collection('posts').doc(postUid).collection('likes').add(data);
    changeLikedByMeState(true, index);
    getPosts();
  }

  _unlikePost(String postUid, index) async {
    print('/// UN-LIKE');
    String likeIdToRemove = '';

    await FirebaseFirestore.instance.collection('posts').doc(postUid).collection('likes').get().then((value) {
      likeIdToRemove = value.docs.singleWhere((element) => element.data()['uId'] == userModel!.uId).id;
    });
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postUid)
        .collection('likes')
        .doc(likeIdToRemove)
        .delete();
    changeLikedByMeState(false, index);

    getPosts();
  }

  changeLikedByMeState(bool state, index) {
    likedByMe[index] = state;
    update();
  }

  changeIsLoadingCreatePost(bool state) {
    isLoadingCreatePost = state;
    update();
  }

  _uploadPostImage(profileImage) async {
    String path = 'post_pic-${DateTime.now()}';
    print(path);

    final ref = firebase_storage.FirebaseStorage.instance.ref('post_pics').child(path);
    final uploadValue = await ref.putFile(profileImage!);
    String imageUrl = await uploadValue.ref.getDownloadURL();
    print(imageUrl);
    return imageUrl;
    // updateUser(name: name, email: email, age: age, phone: phone, image: imageUrl);

    // firebase_storage.FirebaseStorage.instance
    //     .ref()
    //     .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
    //     .putFile(profileImage!)
    //     .then((value) {
    //   value.ref.getDownloadURL().then((value) {
    //     print(value);
    //     updateUser(name: name, email: email, age: age, phone: phone, image: value);
    //   }).catchError((error) {});
    // }).catchError((error) {});
    // update();
  }

  void createPost({
    required String dateTime,
    required String text,
  }) async {
    changeIsLoadingCreatePost(true);
    String? imageUrl;

    // add image to firestore
    if (postImage != null) {
      imageUrl = await _uploadPostImage(postImage);
    }

    // use the image link
    PostModel model = PostModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      dateTime: dateTime,
      text: text,
      postImage: imageUrl ?? '',
      likesCount: 0,
    );

    FirebaseFirestore.instance.collection('posts').add(model.toMap()).then((value) {
      textController.text = '';
      postImage = null;
      // FirebaseFirestore.instance.collection('posts').doc(value.id).collection('likes')

      changeIsLoadingCreatePost(false);
    }).catchError((error) {
      changeIsLoadingCreatePost(false);
    });

    FirebaseFirestore.instance.collection('posts').orderBy('dateTime');

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

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
    } else {
      print('no image selected');
    }

    update();
  }

  _uploadProfileImage(profileImage) async {
    String path = 'profile_pic-${DateTime.now()}';
    print(path);

    final ref = firebase_storage.FirebaseStorage.instance.ref('profile_pics').child(path);
    final uploadValue = await ref.putFile(profileImage!);
    String imageUrl = await uploadValue.ref.getDownloadURL();
    print(imageUrl);
    return imageUrl;
    // updateUser(name: name, email: email, age: age, phone: phone, image: imageUrl);

    // firebase_storage.FirebaseStorage.instance
    //     .ref()
    //     .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
    //     .putFile(profileImage!)
    //     .then((value) {
    //   value.ref.getDownloadURL().then((value) {
    //     print(value);
    //     updateUser(name: name, email: email, age: age, phone: phone, image: value);
    //   }).catchError((error) {});
    // }).catchError((error) {});
    // update();
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
  }) async {
    changeIsLoadingUpdateUser(true);
    String? imageUrl;
    if (profileImage != null) {
      imageUrl = await _uploadProfileImage(profileImage);
    }

    // AppUserModel model = AppUserModel(
    //         email: email,
    //         name: name,
    //         phone: phone,
    //         age: age,
    //         uId: userModel!.uId,
    //         isEmailVerified: false,
    //       );

    Map<String, dynamic> model = imageUrl != null
        ? AppUserModel(
            email: email,
            name: name,
            phone: phone,
            age: age,
            image: imageUrl,
            uId: userModel!.uId,
            isEmailVerified: false,
            admin: isAdmin,
          ).toMap() // if we have the image add it =
        : {
            'email': email,
            'phone': phone,
            'age': age,
            'name': name,
            'uId': userModel!.uId,
            'admin': isAdmin,
            'isEmailVerified': false,
          }; // if we don't have image don't make it = null, just leave its value

    FirebaseFirestore.instance.collection('users').doc(userModel!.uId).update(model).then((value) {
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

  // void likePosts(String postId) {
  //   FirebaseFirestore.instance.collection('posts').doc(postId).collection('likes').doc(userModel!.uId).set({
  //     'like': true,
  //   }).then((value) {
  //     // todo: re-fetch the posts from the firebase
  //   }).catchError((error) {
  //     showToast(text: '$error', state: ToastStates.error);
  //   });
  //   update();
  // }

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
    isLoadingGettingPosts = true;
    getPosts();
    // getLikes();
    getUserData(uId: uId);
    super.onInit();
  }
}
