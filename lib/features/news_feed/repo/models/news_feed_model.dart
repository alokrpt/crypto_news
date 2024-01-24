import 'package:flutter/material.dart';

class NewsFeedModel {
  final String id;
  final String source;
  final String title;
  final Sentiment? sentiment;
  final String imageUrl;
  final String webUrl;
  final DateTime? time;

  NewsFeedModel({
    required this.id,
    required this.source,
    required this.title,
    required this.sentiment,
    required this.imageUrl,
    required this.webUrl,
    required this.time,
  });

  factory NewsFeedModel.fromJson(Map<String, dynamic> json) {
    return NewsFeedModel(
      id: json["id"],
      source: json["source_name"],
      title: json["title"],
      sentiment: sentimentFromString(json["sentiment"]),
      imageUrl: json["image_url"],
      webUrl: json["news_url"],
      time: DateTime.tryParse(json["date"]),
    );
  }
}

enum Sentiment {
  neutral,
  positive,
  negative;

  String text() {
    switch (this) {
      case Sentiment.negative:
        return 'Negative';
      case Sentiment.positive:
        return 'Positive';
      case Sentiment.neutral:
        return 'Neutral';
      default:
        return '';
    }
  }

  IconData icon() {
    switch (this) {
      case Sentiment.negative:
        return Icons.arrow_drop_down_rounded;
      case Sentiment.positive:
        return Icons.arrow_drop_up_rounded;
      case Sentiment.neutral:
        return Icons.graphic_eq_sharp;
    }
  }

  Color color() {
    switch (this) {
      case Sentiment.negative:
        return Colors.red;
      case Sentiment.positive:
        return Colors.green;
      case Sentiment.neutral:
        return Colors.grey;
    }
  }
}

Sentiment? sentimentFromString(String text) {
  switch (text) {
    case 'Neutral':
      return Sentiment.neutral;
    case 'Positive':
      return Sentiment.positive;
    case 'Negative':
      return Sentiment.negative;
    default:
      return null;
  }
}
