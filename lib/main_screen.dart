import 'package:flutter/material.dart';
import 'package:news_app1/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/bloc/news_bloc.dart';
import 'package:news_app1/services/news_repo.dart';
import 'package:news_app1/updated_weather/screen/updated_weather_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            KButtons(
              icon: Icons.pages,
              color: Colors.grey,
              builder: (context)=>
                  BlocProvider(
                      create: (context) => NewsBloc(webService: NewsWebServiceImpl()),
                      child: const HomeView()),
            ),
            KButtons(
              icon: Icons.cloud,
                builder: (context){
              return const UpdatedWeatherScreen();
            } , color: Colors.blueGrey),
            const KButtons(
                icon: Icons.money,
                builder: null,
                color: Colors.green),
            const KButtons(
                icon: Icons.more_horiz,
                builder: null,
                color: Colors.red),
          ],
        ),
      ),
    );
  }
}

class KButtons extends StatelessWidget {
  final WidgetBuilder? builder;
  final Color color;
  final IconData icon;
  const KButtons({super.key, required this.builder,required this.color,required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(
          builder:builder!));
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
    ),
        child: Icon(icon)
    );
  }
}
