import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save/models/friend_model.dart';
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
  bool isLoadingSetNotification =false;
  bool isLoadingSendFeedback =false;
  bool isLoadingGetCommentsOnPost =false;
  var textController = TextEditingController();
  var picker = ImagePicker();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  var phoneController = TextEditingController();
  var feedbackController = TextEditingController();
  var twitterController = TextEditingController();
  bool isLoadingGettingPosts = false;
  File? postImage;
  File? profileImage;
  bool isLoadingUpdateUser = false;
  List<bool> likedByMe = [];
  List<bool> myPost = [];
  var commentController = TextEditingController();
  bool showComments = false;

  bool isDark = true;
  IconData suffix = Icons.brightness_7_outlined;
  changeDarkModeIcon() {
    isDark = !isDark;
    suffix = isDark ? Icons.brightness_7_outlined : Icons.dark_mode;
    update();
  }


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
/////////////////////
  changeIsLoadingSetNotification(bool state) {
    isLoadingSetNotification = state;
    update();
  }
  changeIsLoadingSendFeedback(bool state) {
    isLoadingSendFeedback = state;
    update();
  }

  ///////////////////////////
  getUserData({String? uId}) {
    try {
      changeIsLoadingGetUserDataState(true);
       FirebaseFirestore.instance.collection('users').doc(uId).snapshots().listen((event) {
        userModel = AppUserModel.fromJson(event.data()!);
        nameController.text = userModel!.name ?? '';
        emailController.text = userModel!.email ?? '';
        ageController.text = userModel!.age ?? '';
        twitterController.text = userModel!.twitter ?? '';

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
    required String twitter,
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
            age: age,
            image: imageUrl,
            twitter: twitter,
            uId: userModel!.uId,
            isEmailVerified: false,
            admin: isAdmin,
          ).toMap() // if we have the image add it =
        : {
            'email': email,
            'age': age,
            'name': name,
            'twitter' : twitter,
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
//////////////////////////////////////////////state wrong
  void sendFeedback({
    required String text,
  }) {
    changeIsLoadingSendFeedback(true);
    FeedbackModel model = FeedbackModel(
      name: userModel!.name,
      image: userModel!.image,
      uId: userModel!.uId,
      text: text,
    );
    FirebaseFirestore.instance.collection('feedback').add(model.toMap()).then((value) {
      changeIsLoadingSendFeedback(false);
      Get.back();
    }).catchError((error) {
      changeIsLoadingSendFeedback(false);
    });
  }

  void signOut(context) async {
    await FirebaseAuth.instance.signOut();
    await CacheHelper.reset();
    token = '';
    uId = '';
    isAdmin = null;
    //print (uId);
    Get.delete(tag: "homeController",force: true);
    navigateAndFinish(context, LoginScreen());
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

  // getPosts() {
  //   try {
  //     FirebaseFirestore.instance.collection('posts').snapshots().listen((postEvent) async {
  //       print('/// Docs Changes ...');
  //       print(postEvent.docChanges);
  //       if(kDebugMode) print('/// GET POSTS ...');
  //       changeIsLoadingGettingPosts(true);
  //       /// Get Posts and likes counts
  //       posts = [];
  //       likes = [];
  //       likesCounts = [];
  //       postsId = [];
  //       likedByMe = [];
  //       comments = [];
  //
  //       int i = 0;
  //       for (var post in postEvent.docs) {
  //         print('/// POST NUMBER $i');
  //         posts.add(PostModel.fromJson(post.data()));
  //         postsId.add(post.id);
  //
  //         /// Likes
  //         await post.reference.collection('likes').get().then((likesSnapshots) {
  //           likesCounts.add(likesSnapshots.docs.length);
  //           // if(kDebugMode) print(likesSnapshots.docs.length);
  //           if (likesSnapshots.docs.isNotEmpty) {
  //             for (var doc in likesSnapshots.docs) {
  //               likes.add(doc.data());
  //             }
  //
  //             for (var element in likesSnapshots.docs) {
  //               element.data()['uId'] == userModel!.uId ? likedByMe.add(true) : likedByMe.add(false);
  //             }
  //           } else {
  //             likedByMe.add(false);
  //           }
  //         });
  //
  //         /// comments
  //         await post.reference.collection('comments').get().then((commentsSnapshots) {
  //           commentsCounts.add(commentsSnapshots.docs.length);
  //
  //           List<Map<String, dynamic>> postComments = [];
  //           for (var doc in commentsSnapshots.docs) {
  //             postComments.add(doc.data());
  //             // print('comments|');
  //           }
  //           comments.add(postComments);
  //           print('/// comments length');
  //           if(kDebugMode) print(commentsSnapshots.docs.length);
  //           // if (commentsSnapshots.docs.isNotEmpty) {
  //           //   for (var doc in commentsSnapshots.docs) {
  //           //     comments[i][commentsSnapshots.docs.indexOf(doc)].add(doc.data());
  //           //   }
  //           //
  //           //   // todo: comment by me
  //           //   // for (var element in commentsSnapshots.docs) {
  //           //   //   element.data()['uId'] == userModel!.uId ? likedByMe.add(true) : likedByMe.add(false);
  //           //   // }
  //           // } else {
  //           //   print('yyyy');
  //           //   // comments.add({});
  //           // }
  //         });
  //         print(comments);
  //         print(comments.length);
  //         i++;
  //       }
  //
  //       changeIsLoadingGettingPosts(false);
  //
  //       update();
  //     });
  //   } catch (e, stacktrace) {
  //     if(kDebugMode) print(e);
  //     if(kDebugMode) print(stacktrace);
  //   }
  // }

  // likeOrUnlikePost(postUid, index) {
  //   try {
  //     FirebaseFirestore.instance.collection('posts').doc(postUid).collection('likes').get().then((snapshot) {
  //       if (snapshot.docs.isNotEmpty) {
  //         for (var element in snapshot.docs) {
  //           if(kDebugMode) print(element.data()['uId']);
  //           if(kDebugMode) print(userModel!.uId);
  //           print(' on xxxxxxxxxxxxxxxxxxxxxxxxx');
  //           print (element.data()['uId']);
  //           print (userModel!.uId);
  //           if (element.data()['uId'] == userModel!.uId) {
  //             _unlikePost(postUid, index);
  //           } else {
  //             _likePost(postUid, index);
  //           }
  //         }
  //       } else {
  //         _likePost(postUid, index);
  //       }
  //     });
  //   } catch (e, stacktrace) {
  //     if(kDebugMode) print(e);
  //     if(kDebugMode) print(stacktrace);
  //   }
  // }

  // _likePost(String postUid, index) async {
  //   if(kDebugMode) print('/// LIKE');
  //   Map<String, Object?> data = {'uId': userModel!.uId};
  //   await FirebaseFirestore.instance.collection('posts').doc(postUid).collection('likes').add(data);
  //   changeLikedByMeState(true, index);
  //   getPosts();
  // }

  // _unlikePost(String postUid, index) async {
  //   if(kDebugMode) print('/// UN-LIKE');
  //   String likeIdToRemove = '';
  //
  //   await FirebaseFirestore.instance.collection('posts').doc(postUid).collection('likes').get().then((value) {
  //     likeIdToRemove = value.docs.singleWhere((element) => element.data()['uId'] == userModel!.uId).id;
  //   });
  //   await FirebaseFirestore.instance
  //       .collection('posts')
  //       .doc(postUid)
  //       .collection('likes')
  //       .doc(likeIdToRemove)
  //       .delete();
  //   changeLikedByMeState(false, index);
  //
  //   getPosts();
  // }

  // commentOnPost(postUid, index) async {
  //   if(kDebugMode) print('/// COMMENT');
  //   Map<String, Object?> data = {'uId': userModel!.uId, 'name': userModel!.name, 'comment': commentController.text,
  //   'userImageUrl' : userModel!.image,
  //   };
  //   await FirebaseFirestore.instance.collection('posts').doc(postUid).collection('comments').add(data);
  //   commentController.text = '';
  //   getPosts();
  // }
//////////////////////////////////
//   void saveNotification({
//     required String text,
//   }) {
//     changeIsLoadingSetNotification(true);
//     NotificationModel model = NotificationModel(
//       text: text,
//     );
//     FirebaseFirestore.instance.collection('notifications').add(model.toMap()).then((value) {
//       changeIsLoadingSetNotification(false);
//     }).catchError((error) {
//       changeIsLoadingSetNotification(false);
//     });
//   }
  List<Map<String, dynamic>> favourites = [];
  List<bool> favouriteByMe = [];
  List<int> favouriteByMeIndex=[];
  int favcounter = 0;
  List<int> likedindex=[];
  likeOrUnlikePost(postUid, index) async {
    try {
      await FirebaseFirestore.instance.collection('posts')
          .doc(postUid)
          .collection('likes')
          .get().then((snapshot) {

        if (snapshot.docs.isNotEmpty) {
          int x = 0;
          for (var element in snapshot.docs) {

            if (element.data()['uId']! == uId) {
              x=1;
              _unlikePost(postUid, index);
              likedindex.remove(index);
            }
          }
          if(x==0){
            _likePost(postUid, index);
            likedindex.add(index);
            likedindex.sort();

          }
        } else {
          _likePost(postUid, index);
          likedindex.add(index);
          likedindex.sort();
        }
      });
    } catch (e, stacktrace) {
      if(kDebugMode) print(e);
      if(kDebugMode) print(stacktrace);
    }
  }

  _likePost(String postUid, index) async {
    //print('/// LIKE');

    await FirebaseFirestore.instance.collection('posts')
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
    //print('/// UN-LIKE');

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postUid)
        .collection('likes')
        .doc(uId)
        .delete();

    likesCounts[index]--;
    changeLikedByMeState(false, index);

    update();

  }

  commentOnPost(postUid, postIndex) async {
    if(kDebugMode) print('/// COMMENT');
    Map<String, Object?> data = {'uId': userModel!.uId, 'name': userModel!.name, 'comment': commentController.text,
      'userImageUrl' : userModel!.image,
    };
    await FirebaseFirestore.instance.collection('posts').doc(postUid).collection('comments').add(data);
    commentController.text = '';
    // getPosts();
    getCommentsOnPosts(postUid, postIndex);
    print(postUid);
  }

  getCommentsOnPosts(postUid, postIndex) async {
    print('/// Getting Comments on post index = $postIndex && uid = $postUid');
    await FirebaseFirestore.instance.collection('posts').doc(postUid).collection('comments').get().then((value){
      comments[postIndex] = [];
      for (var item in value.docs) {
        comments[postIndex].add(item.data());
      }
    });
    commentsCounts[postIndex] = comments[postIndex].length;
    print(commentsCounts[postIndex]);
    update();
  }

  changeIsLoadingGetCommentsOnPost(bool state) {
    isLoadingGetCommentsOnPost = state;
    update();
  }

  ////////////////////////////////////////////////////////////////////

  changeFavouriteByMeState(bool state, index) {
    favouriteByMe[index] = state;
    update();
  }

  favouriteOrUnFavouritePost(postUid, index) async {
    try {
      await FirebaseFirestore.instance.collection('posts')
          .doc(postUid)
          .collection('favourites')
          .get().then((value) {
        if (value.docs.isNotEmpty) {
          int y= 0;
          for (var element in value.docs)
          {
            if (element.data()['uId'] == uId)
            {
              _unfavouritePost(postUid, index);
              y=1;
            }
          }
          if(y==0){_favouritePost(postUid, index);}
        }
        else {
          _favouritePost(postUid, index);
        }
      });

    } catch (e, stacktrace) {
      //print(e);
      //print(stacktrace);
    }
  }

  _favouritePost(String postUid, index) async  {
    //print('/// Favourite');
    await FirebaseFirestore.instance.collection('posts').
    doc(postUid).
    collection('favourites').
    doc(uId).
    set({'uId': uId});
    changeFavouriteByMeState(true, index);
    favouriteByMeIndex.add(index);
    favouriteByMeIndex.sort();

    //print(favouriteByMeIndex);

    update();
  }

  _unfavouritePost(String postUid, index) async {
    //print('/// UN-Favourite');

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postUid)
        .collection('favourites')
        .doc(uId)
        .delete();
    favouriteByMeIndex.remove(index);
    changeFavouriteByMeState(false, index);

    //print(favouriteByMeIndex);
    update();
  }

  ////////////////////////////////////////////////////////////////////

  checkAndDeletePost({required String id}) async {

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(id)
        .get()
        .then((value) {
      if(value.data()!['uId'] == uId){
        deletePost(id: id);

        Get.snackbar(' Post Deleted', 'Successfully',colorText: Colors.white);
      }
      update();
    })
        .catchError((error){
      showToast(text: '$error', state: ToastStates.error);
    });

  }

  deletePost({required String id}) async {
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(id)
        .delete();
  }

  getPosts() {
    try {
      int i = 0;

      FirebaseFirestore.instance.collection('posts').snapshots().listen((postEvent) async {

       // print('/// Docs Changes ...');
        //print(postEvent.docChanges);

       // print('/// GET POSTS ...');


        // changeIsLoadingGettingPosts(true);
        /// Get Posts and likes counts

        posts = [];
        likes = [];
        likesCounts = [];
        likedByMe = [];
        postsId = [];
        comments = [];

        /////////////////////
        myPost = [];
        favourites = [];
        favouriteByMe = [];
        favouriteByMeIndex= [];
        favcounter = 0;
        likedindex = [];
        /////////////////////


        for (var post in postEvent.docs) {
          //print('/// POST NUMBER $i');
          posts.add(PostModel.fromJson(post.data()));
          postsId.add(post.id);
          if(post.data()['uId'] == uId) {
            myPost.add(true);
          }
          else {
            myPost.add(false);
          }

          ///////////////////////////////////////////////////////////////

          /// Likes
          await post.reference.collection('likes')
              .get()
              .then((likesSnapshots) {

            //print(likesSnapshots.docs.length);
            likesCounts.add(likesSnapshots.docs.length);
            if (likesSnapshots.docs.isNotEmpty) {

              for (var doc in likesSnapshots.docs)
              {

                likes.add(doc.data());
                if(doc.data()['uId']! == uId) {
                  likedByMe.add(true) ;
                  likedindex.add(i);
                } else {
                  likedByMe.add(false);
                }
              }
            }
            else {
              likedByMe.add(false);
            }

            //print(likedindex);
          });


          ///////////////////////////////////////////////////////////////

          /// Favourites
          await post.reference.collection('favourites')
              .get()
              .then((favouritesSnapshots) {

            if (favouritesSnapshots.docs.isNotEmpty) {

              for (var doc in favouritesSnapshots.docs) {
                favourites.add(doc.data());

                if ( doc.data()['uId']! == uId ) {
                  favouriteByMe.add(true);
                  favouriteByMeIndex.add(i);

                }
                else{
                  favouriteByMe.add(false);
                }
              }
            }
            else {
              favouriteByMe.add(false);
            }
            //print( favouriteByMeIndex);
          });

          i++;


          //////////////////////////////////////////////////////////////
          // comments
                  await post.reference.collection('comments').get().then((commentsSnapshots) {
                    commentsCounts.add(commentsSnapshots.docs.length);

                    List<Map<String, dynamic>> postComments = [];
                    for (var doc in commentsSnapshots.docs) {
                      postComments.add(doc.data());
                      // print('comments|');
                    }
                    comments.add(postComments);
                  });

                }

                changeIsLoadingGettingPosts(false);

                update();
              });
            } catch (e, stacktrace) {
              if(kDebugMode) print(e);
              if(kDebugMode) print(stacktrace);
            }
          }
////////////////////////////////////////
  List<FriendModel> friends = [];
  List<String> friendsId = [];
  FriendModel? friendsModel;
  bool isLoadingGettingFriends = false;
  bool isLoadingAddFriend = false;
  var nameFriendController = TextEditingController();
  var phoneFriendController = TextEditingController();

  changeIsLoadingGettingFriends(bool state) {
    isLoadingGettingFriends = state;
    update();
  }

  changeIsLoadingAddFriend(bool state) {
    isLoadingCreatePost = state;
    update();
  }

  addFriend(
      {
        required String name,
        required String phone,
      }
      ) async {

    changeIsLoadingAddFriend(true);

    FriendModel model = FriendModel(
      name: name,
      phone: phone,
    );
    await FirebaseFirestore.instance.collection('users')
        .doc(uId)
        .collection('friends')
        .add(model.toMap()).then((value)
    {
      nameFriendController.text;
      phoneFriendController.text;

      changeIsLoadingAddFriend(false);

      Get.snackbar('Add Friend ', 'Done',colorText: Colors.white);
    }).catchError((error) {
      changeIsLoadingAddFriend(false);
      showToast(text: '$error', state: ToastStates.error);
    });

    update();
  }

  getFriends() {
    if (friends.isEmpty) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('friends')
          .snapshots()
          .listen((event) {

        friends = [];
        friendsId =[];

        event.docs.forEach((element) {

          friends.add(FriendModel.fromJson(element.data()));
          friendsId.add(element.id);
        });

        update();

      });
    }

    update();
  }

  deleteFriend({required String id}) async {

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('friends')
        .doc(id)
        .delete()
        .then((value) {

      Get.snackbar(' Friend Deleted', 'Successfully',colorText: Colors.white);
      update();
    })
        .catchError((error){
      showToast(text: '$error', state: ToastStates.error);
    });

  }



  ////////////////////////////////////////////
  @override
  void onInit() {
    isLoadingGettingPosts = true;
    getPosts();
    // getLikes();
    //print (uId);
    getUserData(uId: uId);
    getFriends();
    super.onInit();
  }
}
