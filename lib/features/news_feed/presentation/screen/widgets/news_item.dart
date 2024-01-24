import 'package:crypto_news/features/news_feed/repo/models/news_feed_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.news,
  });
  final NewsFeedModel news;
  @override
  Widget build(BuildContext context) {
    const double imageHeight = 100;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          launchUrl(Uri.parse(news.webUrl));
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.source,
                  style: const TextStyle(
                    color: Colors.orange,
                  ),
                ),
                _padding4(),
                SizedBox(
                  width: MediaQuery.of(context).size.width - imageHeight - 104,
                  child: Text(
                    news.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
                _padding4(),
                if (news.sentiment != null)
                  Row(
                    children: [
                      Icon(
                        news.sentiment!.icon(),
                        color: news.sentiment!.color(),
                      ),
                      Text(
                        news.sentiment!.text(),
                        style: TextStyle(
                          color: news.sentiment!.color(),
                        ),
                      ),
                    ],
                  )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Image.network(
              news.imageUrl,
              height: imageHeight,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _padding4() => const SizedBox(
        height: 4,
      );
}
