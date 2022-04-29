import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:save/models/post_model.dart';

import '../../models/feedback_model.dart';
import '../../models/user_model.dart';

class AdminController extends GetxController {
  List<FeedbackModel> feedback = [];
  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];
  List<AppUserModel> users = [];
  AppUserModel? userModel;

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

  /// todo: check method
  void getPosts() {
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
    update();
  }

  void getUsers() {
    if (users.isEmpty) {
      FirebaseFirestore.instance
          .collection('users')
          //   .get()
          .snapshots()
          .listen((event) {
        users = [];
        event.docs.forEach((element) {
          if (element.data()['uId'] != userModel?.uId) users.add(AppUserModel.fromJson(element.data()));
        });
      });
    }
    update();
  }

  @override
  void onInit() {
    getFeedbacks();
    getPosts();
    getUsers();
    super.onInit();
  }
}
