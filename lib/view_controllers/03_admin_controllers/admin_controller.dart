import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save/models/post_model.dart';
import '../../helpers/cache_helper.dart';
import '../../helpers/globals.dart';
import '../../models/feedback_model.dart';
import '../../models/user_model.dart';
import '../../views/01_auth/login_screen.dart';
import '../../views/widgets/components.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AdminController extends GetxController {
  List<FeedbackModel> feedback = [];
  List<AppUserModel> users = [];
  AppUserModel? userModel;
  int userCount = 0;
  File? postImage;
  List<PostModel> posts = [];
  List<String> postsId = [];
  List<Map<String, dynamic>> likes = [];
  List<List<Map<String, dynamic>>> comments = [];
  List<int> likesCounts = [];
  List<int> commentsCounts = [];
  List<bool> likedByMe = [];
  var picker = ImagePicker();
  var textController = TextEditingController();
  var commentController = TextEditingController();
  bool isLoadingGettingUsers = false;
  bool isLoadingCreatePost = false;
  bool isLoadingGetCommentsOnPost = false;
  bool showComments = false;
  bool isLoadingGettingPosts = false;

  changeIsLoadingGettingUsers(bool state) {
    isLoadingGettingUsers = state;
    update();
  }
  changeIsLoadingCreatePost(bool state) {
    isLoadingCreatePost = state;
    update();
  }
  changeShowCommentsState(bool state) {
    showComments = state;
    update();
  }
  changeLikedByMeState(bool state, index) {
    likedByMe[index] = state;
    update();
  }
  changeIsLoadingGettingPosts(bool state) {
    isLoadingGettingPosts = state;
    update();
  }

/////////////////////////////////////
  // void getUsers() async {
  //   try {
  //     changeIsLoadingGettingUsers(true);
  //     print('/// GETTING USERS ...');
  //
  //     // todo: use filtration of firebase while getting the data
  //     QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('users').get();
  //     users.addAll(snapshot.docs.map<AppUserModel>((e) => AppUserModel.fromJson(e.data())).toList());
  //     print(users.length);
  //
  //     users.removeWhere((AppUserModel element) => element.admin == true);
  //
  //     print(users);
  //     print(users.length);
  //     changeIsLoadingGettingUsers(false);
  //
  //   } catch (e, stacktrace) {
  //     changeIsLoadingGettingUsers(false);
  //     print(e);
  //     print(stacktrace);
  //   }
  //   update();
  // }

 getUsers() {
    if (users.isEmpty) {
     // print('/// GETTING USERS ..');
      FirebaseFirestore.instance
          .collection('users')
          .snapshots()
          .listen((event) {
       // print('/// NEW USER LISTENER TRIGGERED ..');
       // print('${event.docs}');
        users = [];
        event.docs.forEach((element) {
         // print(element.data()['admin']);
         // print ("هنا");
         // print(element.data()['uId']);

          if(element.data()['admin'] == false) users.add(AppUserModel.fromJson(element.data()));
          return element.data()['uId'];
        });

        userCount = users.length;
        update();

        //print(users.length);
      });
    }

    update();
  }

  // /// todo: check method
  // void getPosts() {
  //   if (posts.isEmpty) {
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
  //       update();
  //     });
  //   }
  //   update();
  // }

  void getFeedbacks() {
    if (feedback.isEmpty) {
      FirebaseFirestore.instance.collection('feedback').snapshots().listen((event) {
        feedback = [];
        event.docs.forEach((element) {
          feedback.add(FeedbackModel.fromJson(element.data()));
        });
        update();
      });
    }
  }

  void signOut(context) async {
    await FirebaseAuth.instance.signOut();
    await CacheHelper.reset();
    token = '';
    uId = '';
    isAdmin = null;
    Get.delete(tag: "homeController",force: true);
    navigateAndFinish(context, LoginScreen());
  }
  /////////////////////////
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var phoneController = TextEditingController();
  bool isLoadingGetUserData = false;
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
///////////////////////////////////////////////


  _uploadPostImage(profileImage) async {
    String path = 'post_pic-${DateTime.now()}';
    if (kDebugMode) print(path);

    final ref = firebase_storage.FirebaseStorage.instance.ref('post_pics').child(path);
    final uploadValue = await ref.putFile(profileImage!);
    String imageUrl = await uploadValue.ref.getDownloadURL();
    if (kDebugMode) print(imageUrl);
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
      if (kDebugMode) print('no image selected');
    }
    update();
  }

  removePostImage() {
    postImage = null;
    update();
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
  /////////////////////////////////////
  commentOnPost(postUid, postIndex) async {
    if (kDebugMode) print('/// COMMENT');
    Map<String, Object?> data = {
      'uId': userModel!.uId,
      'name': userModel!.name,
      'comment': commentController.text,
      'userImageUrl': userModel!.image,
    };
    await FirebaseFirestore.instance.collection('posts').doc(postUid).collection('comments').add(data);
    commentController.text = '';

    // re-render the post comments
    getCommentsOnPosts(postUid, postIndex);
  }


  /// opening the comments bottom sheet of a post
  getCommentsOnPosts(postUid, postIndex) async {
    try {
      print('/// Getting Comments on post index = $postIndex && uid = $postUid');
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postUid)
          .collection('comments')
          .get()
          .then((value) {
        comments[postIndex] = [];
        for (var item in value.docs) {
          comments[postIndex].add(item.data());
        }
      });
      commentsCounts[postIndex] = comments[postIndex].length;
      changeIsLoadingGetCommentsOnPost(false);
      print(commentsCounts[postIndex]);
      print(commentsCounts[postIndex]);
    } catch (e, stacktrace) {
      print(e);
      print(stacktrace);
    }
    update();
  }

  changeIsLoadingGetCommentsOnPost(bool state) {
    isLoadingGetCommentsOnPost = state;
    update();
  }

  ////////////////////////////////////////////////////////////////////

  getPosts() {
    try {
      int i = 0;

      FirebaseFirestore.instance.collection('posts').snapshots().listen((postEvent) async {
        // posts = [];
        // likes = [];
        // likesCounts = [];
        // likedByMe = [];
        // postsId = [];
        // comments = [];
        // commentsCounts = [];
        // /////////////////////
        // myPost = [];
        // favourites = [];
        // favouriteByMe = [];
        // favouriteByMeIndex = [];
        // favcounter = 0;
        // likedindex = [];
        /////////////////////

        List<PostModel> rPosts = [];
        List<Map<String, dynamic>> rLikes = [];
        List<int> rLikesCounts = [];
        List<bool> rLikedByMe = [];
        List<String> rPostsId = [];
        List<List<Map<String, dynamic>>> rComments = [];
        List<int> rCommentsCounts = [];
        /////////////////////
        List<int> rLikedIndex = [];


        print('/// Total number of posts = ${postEvent.docs.length}');
        for (var post in postEvent.docs) {
          print('/// Post $i-1');
          rPosts.add(PostModel.fromJson(post.data()));
          rPostsId.add(post.id);


          ///////////////////////////////////////////////////////////////

          /// Likes
          await post.reference.collection('likes').get().then((likesSnapshots) {
            print('/// Post $i-2');

            //print(likesSnapshots.docs.length);
            rLikesCounts.add(likesSnapshots.docs.length);
            if (likesSnapshots.docs.isNotEmpty) {
              bool isLikedByMe = false;
              for (var doc in likesSnapshots.docs) {
                rLikes.add(doc.data());
                if (doc.data()['uId'] == uId) {
                  isLikedByMe = true;
                }
              }
              if (isLikedByMe) {
                rLikedByMe.add(true);
                rLikedIndex.add(i);
              } else {
                rLikedByMe.add(false);
              }
            } else {
              rLikedByMe.add(false);
            }

            //print(likedindex);
          });
          ///////////////////////////////////////////////////////////////



          //////////////////////////////////////////////////////////////
          // comments
          await post.reference.collection('comments').get().then((commentsSnapshots) {
            print('/// Post $i-4');

            rCommentsCounts.add(commentsSnapshots.docs.length);
            rComments.add(
                []); // we are adding the comments upon opening the comments bottom sheet to save the resources
          });

          if (i == postEvent.docs.length - 1) {
            // reset of we got all posts
            i = 0;
          } else {
            // Increment if there are other posts to catch
            i++;
          }
        }

        posts = rPosts;
        likes = rLikes;
        likesCounts = rLikesCounts;
        likedByMe = rLikedByMe;
        postsId = rPostsId;
        comments = rComments;
        commentsCounts = rCommentsCounts;
        /////////////////////


        changeIsLoadingGettingPosts(false);
        update();
      });
    } catch (e, stacktrace) {
      if (kDebugMode) print(e);
      if (kDebugMode) print(stacktrace);
    }
  }











  /////////////////////////////

  @override
  void onInit() {
    getFeedbacks();
    getPosts();
    // getUsers();
    getUsers();
    getUserData(uId: uId);
    super.onInit();
  }
}
