import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/bloc/news_event.dart';
import 'package:news_app1/bloc/news_state.dart';
import 'package:news_app1/models/article.dart';
import 'package:news_app1/services/news_repo.dart';
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsWebService webService;
  NewsBloc({required this.webService}) : super(NewsInitialState()){
    on<FetchNewsEvent>((event, emit) async {
      if (event is NewsEvent) {
        emit(NewsInitialState());
        try {
          List<Articles> articles = await webService.fetchNews();
          emit(NewsLoadedState(articles: articles));
        } catch (e) {
          emit(NewsErrorState(message: e.toString()));
        }
      }
    }
    );
  }
}