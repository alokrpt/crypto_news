import 'package:crypto_news/features/news_feed/data/news_feed_data_source.dart';
import 'package:crypto_news/features/news_feed/presentation/bloc/news_feed/news_feed_bloc.dart';
import 'package:crypto_news/features/news_feed/presentation/screen/widgets/news_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crypto News',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocProvider(
        create: (context) =>
            NewsFeedBloc(NewsFeedDataSource())..add(FetchFeedEvent()),
        child: BlocBuilder<NewsFeedBloc, NewsFeedState>(
          builder: (context, state) {
            if (state is NewsFeedLoading || state is NewsFeedInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is NewsFeedError) return Text(state.errorMessage);
            if (state is NewsFeedLoaded) {
              return ListView.builder(
                itemCount: state.newsList.length,
                itemBuilder: (context, index) {
                  return NewsItem(news: state.newsList[index]);
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
