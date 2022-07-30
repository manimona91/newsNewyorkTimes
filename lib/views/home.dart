import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/model/article.dart';
import 'package:news/resources/api.dart';
import 'package:news/views/news.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Articles> newslist = [];
  bool _loading = true;
  bool _changeColor = true;

  void getArticles() async {
    NewsAPI news = NewsAPI();
    await news.getArticles();
    setState(() {
      _changeColor = false;
    });
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    _changeColor = true;
    super.initState();

    getArticles();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //if (_loading) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              color: Colors.white,
              child: Image.asset('assets/newYorkIcon.png',
                  height: 200,
                  scale: 2.5,
                  opacity: AlwaysStoppedAnimation(0.3))),
          Text(""),
          SizedBox(
            height: 50,
          ),
          Center(
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
    /*  } else {
      return NewsPage(newslist: newslist);
    }*/
  }
}
