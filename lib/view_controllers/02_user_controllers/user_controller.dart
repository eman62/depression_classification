import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:save/models/friend_model.dart';
import 'package:save/models/notification_model.dart';
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
  bool isLoadingSetNotification = false;
  bool isLoadingSendFeedback = false;
  bool isLoadingGetCommentsOnPost = false;
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
  List<NotificationModel> notifications = [];

  bool isDark = true;
  IconData suffix = Icons.brightness_7_outlined;

  changeDarkModeIcon() {
    isDark = !isDark;
    suffix = isDark ? Icons.brightness_7_outlined : Icons.dark_mode;
    update();
  }


  sendSendSms() async {
    // String message = 'test message';
    // List<String> recipients = ['+201288560645'];
    // String _result = await sendSMS(message: message, recipients: recipients)
    //     .catchError((onError) {
    //   print(onError);
    // });
    // print(_result);
  }

  Future deleteMyAccount(context) async {
    try {
      /// delete user from auth
      User? user = FirebaseAuth.instance.currentUser;
      user!.delete();

      /// delete user data from the database
      deleteUserFromDatabase(user);

      /// delete user posts
      deleteUserPosts(user);
      signOut(context);
    } catch (e) {
      print(e.toString());
    }
  }

  deleteUserPosts(User? user) async {
    var collection = FirebaseFirestore.instance.collection('posts');
    var snapshot = await collection.where('uId', isEqualTo: user!.uid).get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
  }

  deleteUserFromDatabase(User? user) async {
    var collection = FirebaseFirestore.instance.collection('users');
    var doc = await collection.doc(user!.uid).get();
    await doc.reference.delete();
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
  getMyUserData({String? uId}) {
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
      if (kDebugMode) print('XXX EXCEPTION');
      if (kDebugMode) print(stacktrace);
      showToast(text: e.toString(), state: ToastStates.error);
      changeIsLoadingGetUserDataState(false);
    }
  }

  Future<AppUserModel> getAnyUserData({String? uId}) async {
    AppUserModel? _userModel;

    var user = await FirebaseFirestore.instance.collection('users').doc(uId).get();
    Map<String, dynamic>? userData = user.data();
    if (userData != null) {
      _userModel = AppUserModel.fromJson(user.data()!);
    } else {
      _userModel = AppUserModel();
    }
    return _userModel;
  }

  getUserNotifications() {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('notifications')
          .snapshots()
          .listen((event) {
        List<NotificationModel> _notifications = [];

        for (var item in event.docs) {
          _notifications.add(NotificationModel.fromJson(item.data()));
        }
        notifications = _notifications;
      });
      update();
    } catch (e, stacktrace) {
      if (kDebugMode) print('XXX EXCEPTION');
      if (kDebugMode) print(stacktrace);
      showToast(text: e.toString(), state: ToastStates.error);
      // changeIsLoadingGetUserDataState(false);
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

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
    } else {
      if (kDebugMode) print('no image selected');
    }

    update();
  }

  _uploadProfileImage(profileImage) async {
    String path = 'profile_pic-${DateTime.now()}';
    if (kDebugMode) print(path);

    final ref = firebase_storage.FirebaseStorage.instance.ref('profile_pics').child(path);
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
            'twitter': twitter,
            'uId': userModel!.uId,
            'admin': isAdmin,
            'isEmailVerified': false,
          }; // if we don't have image don't make it = null, just leave its value

    FirebaseFirestore.instance.collection('users').doc(userModel!.uId).update(model).then((value) {
      getMyUserData(uId: userModel?.uId);
      getPosts();
      changeIsLoadingUpdateUser(false);
    }).catchError((error) {
      changeIsLoadingUpdateUser(false);
    });
    //}
  }

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
    Get.delete(tag: "homeController", force: true);
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

  changeFavouriteByMeState(bool state, index) {
    favouriteByMe[index] = state;
    update();
  }

  favouriteOrUnFavouritePost(postUid, index) async {
    try {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postUid)
          .collection('favourites')
          .get()
          .then((value) {
        if (value.docs.isNotEmpty) {
          int y = 0;
          for (var element in value.docs) {
            if (element.data()['uId'] == uId) {
              _unFavouritePost(postUid, index);
              y = 1;
            }
          }
          if (y == 0) {
            _favouritePost(postUid, index);
          }
        } else {
          _favouritePost(postUid, index);
        }
      });
    } catch (e, stacktrace) {
      //print(e);
      //print(stacktrace);
    }
  }

  _favouritePost(String postUid, index) async {
    //print('/// Favourite');
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postUid)
        .collection('favourites')
        .doc(uId)
        .set({'uId': uId});
    changeFavouriteByMeState(true, index);
    favouriteByMeIndex.add(index);
    favouriteByMeIndex.sort();

    //print(favouriteByMeIndex);

    update();
  }

  _unFavouritePost(String postUid, index) async {
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
        List<Map<String, dynamic>> rFavourites = [];
        List<bool> rFavouriteByMe = [];
        List<int> rFavouriteByMeIndex = [];
        int rFavCounter = 0;
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

          /// Favourites
          await post.reference.collection('favourites').get().then((favouritesSnapshots) {
            if (favouritesSnapshots.docs.isNotEmpty) {
              bool isFavouredByMe = false;
              for (var doc in favouritesSnapshots.docs) {
                // no need to work on favourites List --> commented for saving resources
                // favourites.add(doc.data());
                if (doc.data()['uId'] == uId) {
                  isFavouredByMe = true;
                }
              }
              if (isFavouredByMe) {
                rFavouriteByMe.add(true);
                rFavouriteByMeIndex.add(i);
              } else {
                rFavouriteByMe.add(false);
              }
            } else {
              rFavouriteByMe.add(false);
            }
            //print( favouriteByMeIndex);
          });

          //////////////////////////////////////////////////////////////
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
        myPost = rMyPost;
        favourites = rFavourites;
        favouriteByMe = rFavouriteByMe;
        favouriteByMeIndex = rFavouriteByMeIndex;
        favCounter = rFavCounter;
        likedIndex = rLikedIndex;

        changeIsLoadingGettingPosts(false);
        update();
      });
    } catch (e, stacktrace) {
      if (kDebugMode) print(e);
      if (kDebugMode) print(stacktrace);
    }
  }

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

  addFriend({
    required String name,
    required String phone,
  }) async {
    changeIsLoadingAddFriend(true);

    FriendModel model = FriendModel(
      name: name,
      phone: phone,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('friends')
        .add(model.toMap())
        .then((value) {
      nameFriendController.text;
      phoneFriendController.text;

      changeIsLoadingAddFriend(false);

      Get.snackbar('Add Friend ', 'Done', colorText: Colors.white);
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
        friendsId = [];

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
      Get.snackbar(' Friend Deleted', 'Successfully', colorText: Colors.white);
      update();
    }).catchError((error) {
      showToast(text: '$error', state: ToastStates.error);
    });
  }

  @override
  void onInit() {
    isLoadingGettingPosts = true;
    getPosts();
    getMyUserData(uId: uId);
    getFriends();
    super.onInit();
  }
}
