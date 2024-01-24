part of 'news_feed_bloc.dart';

@immutable
sealed class NewsFeedState {}

final class NewsFeedInitial extends NewsFeedState {}

final class NewsFeedLoading extends NewsFeedState {}

final class NewsFeedLoaded extends NewsFeedState {
  final List<NewsFeedModel> newsList;

  NewsFeedLoaded({
    required this.newsList,
  });
}

final class NewsFeedError extends NewsFeedState {
  final String errorMessage;

  NewsFeedError({
    required this.errorMessage,
  });
}
