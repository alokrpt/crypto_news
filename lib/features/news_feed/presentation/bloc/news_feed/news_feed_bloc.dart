import 'package:bloc/bloc.dart';
import 'package:crypto_news/features/news_feed/data/news_feed_data_source.dart';
import 'package:crypto_news/features/news_feed/repo/models/news_feed_model.dart';
import 'package:meta/meta.dart';

part 'news_feed_event.dart';
part 'news_feed_state.dart';

class NewsFeedBloc extends Bloc<NewsFeedEvent, NewsFeedState> {
  final NewsFeedDataSource dataSource;
  NewsFeedBloc(this.dataSource) : super(NewsFeedInitial()) {
    on<NewsFeedEvent>((event, emit) async {
      if (event is FetchFeedEvent) {
        emit(NewsFeedLoading());
        final response = await dataSource.fetchNews(event.pageNo);

        if (response?['data'] == null) {
          emit(
            NewsFeedError(errorMessage: 'Api Error'),
          );
        } else {
          try {
            List<NewsFeedModel> news = (response!['data'] as List)
                .map((newsItem) => NewsFeedModel.fromJson(newsItem))
                .toList();
            emit(NewsFeedLoaded(newsList: news));
          } catch (e) {
            emit(NewsFeedError(errorMessage: 'Parsing Error'));
          }
        }
      }
    });
  }
}
