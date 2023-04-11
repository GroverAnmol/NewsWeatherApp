import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/bloc/news_bloc.dart';
import 'package:news_app1/bloc/news_event.dart';
import 'package:news_app1/bloc/news_state.dart';
import 'package:news_app1/weather/screens/weather_screen.dart';
import 'package:news_app1/views/error.dart';
import 'package:news_app1/views/list.dart';
import 'package:news_app1/views/loading.dart';
import 'package:news_app1/weather/modals/networking.dart';
import 'package:news_app1/weather/screens/loading_screen.dart';
LoadingScreen loadingScreen = LoadingScreen();

class HomeView extends StatefulWidget {

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  late NewsBloc newsBloc;

  @override
  void initState() {
    newsBloc = BlocProvider.of<NewsBloc>(context);
    newsBloc.add(FetchNewsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // final NewsController _newsController = Get.put(NewsController());
    return Scaffold(
      backgroundColor: const Color(0xFF464646),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              flex: 4,
              child: const Text(
                " HEADLINES",
                style: TextStyle(
                    fontSize: 29,
                    letterSpacing: 2.0,
                    color: Color(0xFF464646),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                flex:1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
              child: Icon(Icons.cloud,
              color: Colors.white,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return LoadingScreen();
                }));
              },
            )
            )
          ],
        ),
        centerTitle: true,
      ),
      body:Center(

        child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
          if (state is NewsInitialState) {
            return buildLoading();
          } else if (state is NewsLoadedState) {
            return buildHintsList(state.articles);
          } else if (state is NewsErrorState) {
            return buildError(state.message);
          }
          else return buildLoading();
        }),
      ),
    );
  }
}
