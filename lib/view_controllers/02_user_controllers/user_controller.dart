import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  List<Map<String, dynamic>> likes = [];
  List<List<Map<String, dynamic>>> comments = [];
  List<int> likesCounts = [];
  List<int> commentsCounts = [];
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
  bool isLoadingGettingPosts = false;
  File? postImage;
  File? profileImage;
  bool isLoadingUpdateUser = false;
  List<bool> likedByMe = [];
  var commentController = TextEditingController();
  bool showComments = false;

  changeShowCommentsState(bool state) {
    showComments = state;
    update();
  }

  void changeBottomNavBar(int index) {
    currentIndex = index;
    update();
  }

  changeIsLoadingGetUserDataState(bool state) {
    isLoadingGetUserData = state;
    update();
  }

  getUserData({String? uId}) {
    try {
      changeIsLoadingGetUserDataState(true);
       FirebaseFirestore.instance.collection('users').doc(uId).snapshots().listen((event) {
        userModel = AppUserModel.fromJson(event.data()! );
        nameController.text = userModel!.name!;
        emailController.text = userModel!.email!;
        ageController.text = userModel!.age!;
        phoneController.text = userModel!.phone!;
        changeIsLoadingGetUserDataState(false);

      });
      update();

      // return userModel;

    } catch (e, stacktrace) {
      if(kDebugMode) print('XXX EXCEPTION');
      if(kDebugMode) print(stacktrace);
      showToast(text: e.toString(), state: ToastStates.error);
      changeIsLoadingGetUserDataState(false);
    }
  }

  changeIsLoadingGettingPosts(bool state) {
    isLoadingGettingPosts = state;
    update();
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
    if(kDebugMode) print(path);

    final ref = firebase_storage.FirebaseStorage.instance.ref('post_pics').child(path);
    final uploadValue = await ref.putFile(profileImage!);
    String imageUrl = await uploadValue.ref.getDownloadURL();
    if(kDebugMode) print(imageUrl);
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

  Future<void> getPostImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
    } else {
      if(kDebugMode) print('no image selected');
    }
    update();
  }

  removePostImage() {
    postImage = null;
    update();
  }

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
    } else {
      if(kDebugMode) print('no image selected');
    }

    update();
  }

  _uploadProfileImage(profileImage) async {
    String path = 'profile_pic-${DateTime.now()}';
    if(kDebugMode) print(path);

    final ref = firebase_storage.FirebaseStorage.instance.ref('profile_pics').child(path);
    final uploadValue = await ref.putFile(profileImage!);
    String imageUrl = await uploadValue.ref.getDownloadURL();
    if(kDebugMode) print(imageUrl);
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

  void signOut(context) async {
    await FirebaseAuth.instance.signOut();
    await CacheHelper.reset();
    token = '';
    uId = '';
    isAdmin = null;
    print (uId);
    Get.delete(tag: "homeController",force: true);
    navigateAndFinish(context, SocialLoginScreen());
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

  getPosts() {
    try {
      FirebaseFirestore.instance.collection('posts').snapshots().listen((postEvent) async {
        print('/// Docs Changes ...');
        print(postEvent.docChanges);
        if(kDebugMode) print('/// GET POSTS ...');
        changeIsLoadingGettingPosts(true);
        /// Get Posts and likes counts
        posts = [];
        likes = [];
        likesCounts = [];
        postsId = [];
        likedByMe = [];
        comments = [];

        int i = 0;
        for (var post in postEvent.docs) {
          print('/// POST NUMBER $i');
          posts.add(PostModel.fromJson(post.data()));
          postsId.add(post.id);

          /// Likes
          await post.reference.collection('likes').get().then((likesSnapshots) {
            likesCounts.add(likesSnapshots.docs.length);
            // if(kDebugMode) print(likesSnapshots.docs.length);
            if (likesSnapshots.docs.isNotEmpty) {
              for (var doc in likesSnapshots.docs) {
                likes.add(doc.data());
              }

              for (var element in likesSnapshots.docs) {
                element.data()['uId'] == userModel!.uId ? likedByMe.add(true) : likedByMe.add(false);
              }
            } else {
              likedByMe.add(false);
            }
          });

          /// comments
          await post.reference.collection('comments').get().then((commentsSnapshots) {
            commentsCounts.add(commentsSnapshots.docs.length);

            List<Map<String, dynamic>> postComments = [];
            for (var doc in commentsSnapshots.docs) {
              postComments.add(doc.data());
              // print('comments|');
            }
            comments.add(postComments);
            print('/// comments length');
            if(kDebugMode) print(commentsSnapshots.docs.length);
            // if (commentsSnapshots.docs.isNotEmpty) {
            //   print('xxxx');
            //   for (var doc in commentsSnapshots.docs) {
            //     comments[i][commentsSnapshots.docs.indexOf(doc)].add(doc.data());
            //   }
            //
            //   // todo: comment by me
            //   // for (var element in commentsSnapshots.docs) {
            //   //   element.data()['uId'] == userModel!.uId ? likedByMe.add(true) : likedByMe.add(false);
            //   // }
            // } else {
            //   print('yyyy');
            //   // comments.add({});
            // }
          });
          print(comments);
          print(comments.length);
          i++;
        }

        changeIsLoadingGettingPosts(false);

        update();
      });
    } catch (e, stacktrace) {
      if(kDebugMode) print(e);
      if(kDebugMode) print(stacktrace);
    }
  }

  likeOrUnlikePost(postUid, index) {
    try {
      FirebaseFirestore.instance.collection('posts').doc(postUid).collection('likes').get().then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          for (var element in snapshot.docs) {
            if(kDebugMode) print(element.data()['uId']);
            if(kDebugMode) print(userModel!.uId);
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
      if(kDebugMode) print(e);
      if(kDebugMode) print(stacktrace);
    }
  }

  _likePost(String postUid, index) async {
    if(kDebugMode) print('/// LIKE');
    Map<String, Object?> data = {'uId': userModel!.uId};
    await FirebaseFirestore.instance.collection('posts').doc(postUid).collection('likes').add(data);
    changeLikedByMeState(true, index);
    getPosts();
  }

  _unlikePost(String postUid, index) async {
    if(kDebugMode) print('/// UN-LIKE');
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

  commentOnPost(postUid, index) async {
    if(kDebugMode) print('/// COMMENT');
    Map<String, Object?> data = {'uId': userModel!.uId, 'name': userModel!.name, 'comment': commentController.text,
    'userImageUrl' : userModel!.image,
    };
    await FirebaseFirestore.instance.collection('posts').doc(postUid).collection('comments').add(data);
    commentController.text = '';
    getPosts();
  }

  @override
  void onInit() {
    isLoadingGettingPosts = true;
    getPosts();
    // getLikes();
    print (uId);
    getUserData(uId: uId);
    super.onInit();
  }
}
