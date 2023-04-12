import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/bloc/news_bloc.dart';
import 'package:news_app1/services/news_repo.dart';
import 'package:news_app1/views/home_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData(),
      themeMode: ThemeMode.system,
      home:  BlocProvider(
          create: (context) => NewsBloc(webService: NewsWebServiceImpl()),
          child: HomeView()),
    );
  }
}
