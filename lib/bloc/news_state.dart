import 'package:equatable/equatable.dart';
import 'package:news_app1/models/article.dart';

abstract class NewsState extends Equatable {}

class NewsInitialState extends NewsState {
  @override
  List<Object> get props => [];
}


class NewsLoadedState extends NewsState {
  List<Articles> articles;
  NewsLoadedState({required this.articles});
  @override
  List<Object> get props => [];
}
class NewsErrorState extends NewsState {
  String message;
  NewsErrorState({required this.message});
  @override
  List<Object> get props => [];
}/*
class Note {
  String _title;
  String _description;
  String _urlToImage;
  String _publishedAt;
  Note(this._title, this._description, this._urlToImage, this._publishedAt);
  Note.withId( this._title, this._description, this._urlToImage, this._publishedAt);
  String get title => _title;
  String get description => _description;
  String get urlToImage => _urlToImage;
  String get publishedAt => _publishedAt;
  set title(String newTitle) {
    {
      this._title = newTitle;
    }
  }
  set description(String newDescription) {
    {
      this._description = newDescription;
    }
  }
  set publishedAt(String newPublishedAt) {
    {
      this._publishedAt = newPublishedAt;
    }
  }
  set urlToImage(String newUrlToImage) {
    this._urlToImage = newUrlToImage;
  }
  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['title'] = _title;
    map['description'] = _description;
    map['urlToImage'] = _urlToImage;
    map['publishedAt'] = _publishedAt;
    return map;
  }
  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._title = map['title'];
    this._description = map['description'];
    this._urlToImage = map['urlToImage'];
    this._publishedAt = map['publishedAt'];
  }
}
*/