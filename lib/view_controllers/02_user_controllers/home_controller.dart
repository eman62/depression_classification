import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/post_model.dart';
import '../../models/user_model.dart';
import '../../views/widgets/components.dart';

class HomeController extends GetxController{
  int currentIndex = 0;
  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];
  AppUserModel? userModel;
  bool isLoadingGetUserData = false;

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
      changeIsLoadingGetUserDataState(false);
      return userModel;
    } on Exception catch (e) {
      showToast(text: e.toString(), state: ToastStates.ERROR);
      changeIsLoadingGetUserDataState(false);
    }
    update();
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

  @override
  void onInit() {
    getPosts();
    getUserData();
    super.onInit();
  }
}