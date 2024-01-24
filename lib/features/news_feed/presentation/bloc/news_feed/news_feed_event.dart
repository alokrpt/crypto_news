part of 'news_feed_bloc.dart';

@immutable
sealed class NewsFeedEvent {}

class FetchFeedEvent extends NewsFeedEvent {
  final int pageNo;

  FetchFeedEvent({
    this.pageNo = 1,
  });
}
