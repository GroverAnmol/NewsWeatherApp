import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:news_app1/models/article.dart';

class ArticlePage extends StatelessWidget {
  final Articles article;
  ArticlePage({required this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF464646),
        child: SafeArea(
          child: Stack(
            children: [
              article.urlToImage != null ?
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.urlToImage.toString()), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ) :
              Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage('https://source.unsplash.com/weekly?coding'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),

              Positioned(
                left: 10,
                top: 50,
                child: CircleAvatar(
                  // radius: 20,
                  backgroundColor: Colors.transparent,
                  child: GestureDetector(
                    onTap: () => Navigator.pop( context

                    ),
                    child: Icon(Icons.arrow_back,color: Colors.white,size: 42.0,shadows: <Shadow>[Shadow(color: Colors.grey.shade900, blurRadius: 21.0)],),

                  ),
                ),
              ),


              Positioned(
                top: 570,
                left: 0,
                child: Container(


                  padding: const EdgeInsets.all(6.0),
                  child: Positioned(
                    top: 750,
                    left: 20,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                      ),
                      child: LimitedBox(
                        maxWidth: 300,

                        child: Positioned(
                          child: Text(
                            article.description.toString(),
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'RobotoSlab',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              /* const SizedBox(
                 height: 8.0,
              ),*/
              Positioned(
                top: 500,
                left: 10,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(article.title.toString().substring((article.title.toString().lastIndexOf('-')+2),article.title.toString().length
                    ),
                      style:const TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoSlab',
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                      ),

                    ),
                    const SizedBox(width: 45),
                    Positioned(
                      top: 400,
                      left: 500,
                      child: Text(
                        article.publishedAt.toString().substring(0,10),
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'RobotoSlab',
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Container(
                child: Positioned(
                  top: 350,
                  left: 10,
                  child: LimitedBox(
                    maxWidth: 320,
                    child: Text(
                      article.title!.substring(0,article.title?.lastIndexOf('-')),
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}