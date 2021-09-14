part of 'feed_cubit.dart';

@immutable
abstract class FeedState {}

class FeedInitial extends FeedState {}

class FeedLoadPosts extends FeedState {}

class FeedLoadedSuccessfully extends FeedState {}
class ChangeLikeOnPostState extends FeedState {}


