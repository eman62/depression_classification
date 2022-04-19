abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppGetUserLoadingState extends AppStates {}

class AppGetUserSuccessState extends AppStates {}

class AppGetUserErrorState extends AppStates {
  final String error;
  AppGetUserErrorState (this.error);
}

class AppGetAllUserLoadingState extends AppStates {}

class AppGetAllUserSuccessState extends AppStates {}

class AppGetAllUserErrorState extends AppStates {
  final String error;
  AppGetAllUserErrorState (this.error);
}

class AppBottomNavState extends AppStates {}

class AppNewPostState extends AppStates {}


////////// Profile Image

class AppProfileImagePickedSuccessState extends AppStates {}

class AppProfileImagePickedErrorState extends AppStates {}

//////////  Post Image

class AppPostImagePickedSuccessState extends AppStates {}

class AppPostImagePickedErrorState extends AppStates {
}

class AppRemovePostImageState extends AppStates {}

///////////////// Get Posts

class AppGetPostsLoadingState extends AppStates {}

class AppGetPostsSuccessState extends AppStates {}

class AppGetPostsErrorState extends AppStates {
  final String error;
  AppGetPostsErrorState (this.error);
}

//////////////// Likes

class AppLikePostsSuccessState extends AppStates {}

class AppLikePostsErrorState extends AppStates {
  final String error;
  AppLikePostsErrorState (this.error);
}

///////////////////////// Send Feedback

class AppSendFeedbackSuccessState extends AppStates {}

class AppSendFeedbackErrorState extends AppStates {
  final String error;
  AppSendFeedbackErrorState (this.error);
}

///////////////////////// Get Feedback

class AppGetFeedbackSuccessState extends AppStates {}

class AppGetFeedbackErrorState extends AppStates {
  final String error;
  AppGetFeedbackErrorState (this.error);
}
/////// update profileImage

class updateProfileImageSuccessState extends AppStates {}

class updateProfileImageErrorState extends AppStates {}

////////// update User Info

class updateUserLoadingState extends AppStates {}

class updateUserErrorState extends AppStates {}

//////// Create post

class AppCreatePostLoadingState extends AppStates {}

class AppCreatePostSuccessState extends AppStates {}

class AppCreatePostErrorState extends AppStates {
  final String error;
  AppCreatePostErrorState(this.error);
}

////////// Change Mode

class AppChangeModeState extends AppStates {}
////////////////////////////////////////////
class AppLoginInitialStates extends AppStates {}

class AppLoginLoadingStates extends AppStates {}

class AppLoginSuccessStates extends AppStates {
  final String uId;

  AppLoginSuccessStates (this.uId);
}

class AppLoginErrorStates extends AppStates {
  final String error;

  AppLoginErrorStates(this.error);
}

class AppChangePasswordVisibilityState extends AppStates {}
////////////////////////////////////////////////

class AppRegisterInitialState extends AppStates {}

class AppRegisterLoadingState extends AppStates {}

class AppRegisterSuccessState extends AppStates {}

class AppRegisterErrorState extends AppStates {
  final String error;

  AppRegisterErrorState(this.error);
}

class AppCreateUserSuccessState extends AppStates {}

class AppCreateUserErrorState extends AppStates {
  final String error;

  AppCreateUserErrorState(this.error);
}

class AppChangePasswordVisibilityState2 extends AppStates {}

class state5 extends AppStates {}