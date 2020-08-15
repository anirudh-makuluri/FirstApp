import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Article extends StatefulWidget {
  final String blogUrl;
  Article({this.blogUrl});
  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        initialUrl:widget.blogUrl,

      ),
    );
  }
}
