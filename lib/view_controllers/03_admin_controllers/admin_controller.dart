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
  Future<AppUserModel> getAnyUserData({String? uId}) async {
    AppUserModel? _userModel;

    var user = await FirebaseFirestore.instance.collection('users').doc(uId).get();
    print('/// uuuu');
    print(user.data());
    Map<String, dynamic>? userData = user.data();
    if (userData != null) {
      _userModel = AppUserModel.fromJson(user.data()!);
    } else {
      _userModel = AppUserModel();
    }
    print('/// returning');
    return _userModel;
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
      uId: userModel!.uId,
      dateTime: dateTime,
      text: text,
      postImage: imageUrl ?? '',
      likesCount: 0,
    );

    FirebaseFirestore.instance.collection('posts').add(model.toMap()).then((value) {
      textController.text = '';
      postImage = null;

      changeIsLoadingCreatePost(false);
    }).catchError((error) {
      changeIsLoadingCreatePost(false);
    });

    FirebaseFirestore.instance.collection('posts').orderBy('dateTime');

    update();
  }

  List<Map<String, dynamic>> favourites = [];
  List<bool> favouriteByMe = [];
  List<int> favouriteByMeIndex = [];
  int favCounter = 0;
  List<int> likedIndex = [];
  likeOrUnlikePost(postUid, index) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postUid)
          .collection('likes')
          .get()
          .then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          int x = 0;
          for (var element in snapshot.docs) {
            if (element.data()['uId']! == uId) {
              x = 1;
              _unlikePost(postUid, index);
              likedIndex.remove(index);
            }
          }
          if (x == 0) {
            _likePost(postUid, index);
            likedIndex.add(index);
            likedIndex.sort();
          }
        } else {
          _likePost(postUid, index);
          likedIndex.add(index);
          likedIndex.sort();
        }
      });
    } catch (e, stacktrace) {
      if (kDebugMode) print(e);
      if (kDebugMode) print(stacktrace);
    }
  }

  _likePost(String postUid, index) async {
    //print('/// LIKE');

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postUid)
        .collection('likes')
        .doc(uId)
        .set({'uId': uId});
    likesCounts[index]++;
    changeLikedByMeState(true, index);

    update();
    // getPosts();
  }

  _unlikePost(String postUid, index) async {
    await FirebaseFirestore.instance.collection('posts').doc(postUid).collection('likes').doc(uId).delete();

    likesCounts[index]--;
    changeLikedByMeState(false, index);

    update();
  }

  commentOnPost(postUid, postIndex) async {
    if (kDebugMode) print('/// COMMENT');
    Map<String, Object?> data = {
      'uId': userModel!.uId,
      'text': commentController.text,
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
          .then((value) async {
        comments[postIndex] = [];
        for (var item in value.docs) {
          print('////////////////1');
          AppUserModel? user;
          user = await getAnyUserData(uId: item['uId']);
          // user = AppUserModel();
          print('////////////////2');
          print(user);
          Map<String, dynamic>? commentItem = {
            'name': user.name ?? 'Deleted User',
            'text': item['text'],
            'uId': item['uId'] ?? '',
            'userImageUrl': user.image ??
                'https://www.seekpng.com/png/detail/72-729756_how-to-add-a-new-user-to-your.png',
          };

          print('/// comment item');
          print(commentItem);

          comments[postIndex].add(commentItem);
        }
      });
      commentsCounts[postIndex] = comments[postIndex].length;
      changeIsLoadingGetCommentsOnPost(false);
      // print(commentsCounts[postIndex]);
      // print(commentsCounts[postIndex]);
    } catch (e, stacktrace) {
      //  print(e);
      //  print(stacktrace);
    }
    update();
  }

  changeIsLoadingGetCommentsOnPost(bool state) {
    isLoadingGetCommentsOnPost = state;
    update();
  }

  checkAndDeletePost({required String id}) async {
    await FirebaseFirestore.instance.collection('posts').doc(id).get().then((value) {
      if (value.data()!['uId'] == uId) {
        deletePost(id: id);

        Get.snackbar(' Post Deleted', 'Successfully', colorText: Colors.white);
      }
      update();
    }).catchError((error) {
      showToast(text: '$error', state: ToastStates.error);
    });
  }

  deletePost({required String id}) async {
    await FirebaseFirestore.instance.collection('posts').doc(id).delete();
  }

  getPosts() {
    try {
      int i = 0;

      FirebaseFirestore.instance.collection('posts').snapshots().listen((postEvent) async {
        List<PostModel> rPosts = [];
        List<Map<String, dynamic>> rLikes = [];
        List<int> rLikesCounts = [];
        List<bool> rLikedByMe = [];
        List<String> rPostsId = [];
        List<List<Map<String, dynamic>>> rComments = [];
        List<int> rCommentsCounts = [];
        /////////////////////
        List<bool> rMyPost = [];

        List<int> rLikedIndex = [];

        for (var post in postEvent.docs) {
          rPostsId.add(post.id);
          if (post.data()['uId'] == uId) {
            rMyPost.add(true);
          } else {
            rMyPost.add(false);
          }

          AppUserModel user = await getAnyUserData(uId: post.data()['uId']);

          PostModel postItem = PostModel(
            uId: post.data()['uId'],
            dateTime: post.data()['dateTime'],
            image: user.image,
            likesCount: post.data()['likesCount'],
            name: user.name,
            postImage: post.data()['postImage'],
            text: post.data()['text'],
          );

          rPosts.add(postItem);

          ///////////////////////////////////////////////////////////////

          /// Likes
          await post.reference.collection('likes').get().then((likesSnapshots) {
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
          // comments
          await post.reference.collection('comments').get().then((commentsSnapshots) {
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
  /////////////////////////////////////









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
