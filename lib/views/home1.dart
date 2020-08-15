import 'package:all_in_1/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:all_in_1/weather.dart';
import 'package:all_in_1/corona.dart';
import 'package:all_in_1/models/article_model.dart';
import 'package:all_in_1/models/categorymodel.dart';
import 'package:flutter/material.dart';
import 'package:all_in_1/helper/news1.dart';
import 'package:all_in_1/views/article_view.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticleModel> articles= new List<ArticleModel>();

  bool loading = true;
  @override
  void initState(){
    super.initState();
    getNews();
  }

  getNews()async{
    News newsClass=News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        automaticallyImplyLeading: false,
        title: Center(child: Text("News",style: TextStyle(fontFamily: 'BalooTamma2'),)),
        elevation: 0.0,
      ),
      body:loading?Container(
        child:Center(child: CircularProgressIndicator()) ,
      )
          :SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),

        child:Column(
            children: [


              ///Blogs
              Container(
                padding: EdgeInsets.only(top: 16),
                child: ListView.builder(
                  itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context,index){
                    return BlogTile(
                      imageUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      desc: articles[index].description,
                      url: articles[index].url,
                    );
                    }),
              ),
            ],
        ) ,
      ),
          ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top:Radius.circular(32)
        ),
        child: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 500),
          animationCurve: Curves.easeInOutQuad,
          backgroundColor: Colors.blueGrey,
          color: Colors.black45,
          buttonBackgroundColor: Colors.blueGrey,
          height: 60,
          items: [
            FaIcon(FontAwesomeIcons.home,size: 25,),
            FaIcon(FontAwesomeIcons.newspaper,size: 25,),
            FaIcon(FontAwesomeIcons.sun,size: 25,),
            FaIcon(FontAwesomeIcons.virus,size: 25,),


          ],
          index: 1,
          onTap: (index){
            if(index==2)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>Weather()));
            }

            else if(index==0)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>HomePage()));
            }
            else if(index==3)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>Corona()));
            }

          },
        ),
      ),

      

    );
  }
}





class BlogTile extends StatelessWidget {
  final String imageUrl,title,desc,url;
  BlogTile({@required this.imageUrl,@required this.title,@required this.desc,@required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>Article(blogUrl:url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(6),child: Image.network(imageUrl)),
            SizedBox(height: 8,),
            Text(title),
            SizedBox(height: 8,),
            Text(desc),
          ],
        ),
      ),
    );
  }
}
