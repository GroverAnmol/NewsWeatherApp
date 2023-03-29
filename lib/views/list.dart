import 'package:flutter/material.dart';
import 'package:news_app1/models/article.dart';
import 'package:news_app1/views/articles_details_page.dart';

Widget buildHintsList(List<Articles> articles) {
  return Container(
    child:  ListView.builder(
      itemCount: articles.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.fromLTRB(16, 18, 16, 18),
          decoration: BoxDecoration(
            // color: const Color(0xFF464646),
              borderRadius: BorderRadius.circular(15.0)),
          child: Card(

            margin: EdgeInsets.zero,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            shadowColor: Colors.black87,
            elevation: 300.0,

            child: Stack(

              alignment: Alignment.bottomCenter,
              children: [

                Ink.image(
                  image: NetworkImage(
                    articles[index].urlToImage!,
                  ),
                  fit: BoxFit.cover,
                  height: 250,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArticlePage(
                                  article:
                                  articles[index])));
                      //_newsController.articles[index].description;
                    },
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Positioned(
                        top: 1000,
                        left: 600,
                        right: 1000,
                        child:
                        Text(
                          articles[index].title!,
                          // textAlign: TextAlign.end,
                          style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Positioned(
                        top:5000,
                        left: 4000,
                        child:
                        Text(
                          articles[index].publishedAt!.substring(0,10)
                          ,
                          //  textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),


                      ),


                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
