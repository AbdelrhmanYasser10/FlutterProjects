abstract class SocialStates {}

class SocialInitialState extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates
{
  final String error;

  SocialGetUserErrorState(this.error);
}

class SocialChangeBottomNavState extends SocialStates {}

class SocialNewPostState extends SocialStates {}

class SocialProfileImagePickedSuccessState extends SocialStates {}

class SocialProfileImagePickedErrorState extends SocialStates {}

class SocialCoverImagePickedSuccessState extends SocialStates {}

class SocialCoverImagePickedErrorState extends SocialStates {}

class SocialUploadProfileImageSuccessState extends SocialStates {}

class SocialUploadProfileImageErrorState extends SocialStates {}

class SocialUploadCoverImageSuccessState extends SocialStates {}

class SocialUploadCoverImageErrorState extends SocialStates {}

class SocialUserUpdateLoadingState extends SocialStates {}

class SocialUserUpdateErrorState extends SocialStates {}



class SocialCreatePostLoadingState extends SocialStates {}

class SocialCreatePostSuccessState extends SocialStates {}

class SocialCreatePostErrorState extends SocialStates {}

class SocialPostImagePickedSuccessState extends SocialStates {}

class SocialPostImagePickedErrorState extends SocialStates {}

class SocialRemovePostImageState extends SocialStates {}

class SocialGetPostsLoadingState extends SocialStates {}

class SocialGetPostsSuccessState extends SocialStates {}

class SocialGetPostsErrorState extends SocialStates
{
  final String error;

  SocialGetPostsErrorState(this.error);
}

class SocialGetPostLikeSuccessState extends SocialStates {}

class SocialGetPostLikeErrorState extends SocialStates
{
  final String error;

  SocialGetPostLikeErrorState(this.error);
}

class SocialGetPostCommentSuccessState extends SocialStates {}

class SocialGetPostCommentErrorState extends SocialStates
{
  final String error;

  SocialGetPostCommentErrorState(this.error);
}

class SocialGetPostUsersSuccessState extends SocialStates {}

class SocialGetPostUsersErrorState extends SocialStates
{
  final String error;

  SocialGetPostUsersErrorState(this.error);
}


class SocialGetMessagesSuccessState extends SocialStates {}

class SocialSendMessageErrorState extends SocialStates
{
  final String error;

  SocialSendMessageErrorState(this.error);
}

class SocialSendMessageSuccessState extends SocialStates {}


