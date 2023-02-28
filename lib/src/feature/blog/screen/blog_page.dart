import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:royal_landapp/src/feature/blog/screen/widget/blog_list.dart';
import 'package:royal_landapp/src/feature/home/screen/home_page.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       brightness: Brightness.light,
         backgroundColor: Colors.amberAccent[700],
    elevation: 0,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios_outlined,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        // centerTitle: true,
        title: Text(
          "News",
          style:
              TextStyle(color: Colors.white, fontFamily: 'BattambangRegular'),
          textScaleFactor: 1.1,
        ),
      ),
      body: BlogBody(),
    );
  }
}

class BlogBody extends StatelessWidget {
  // const BlogBody({ Key? key }) : super(key: key);
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SmartRefresher(
          cacheExtent: 1,
          enablePullDown: true,
          enablePullUp: true,
          physics: AlwaysScrollableScrollPhysics(),
          controller: _refreshController,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 10, right: 0),
                  //alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.library_books_outlined,
                            color: Colors.amberAccent[700],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("News")
                        ],
                      ),
                      Row(
                        children: [
                          Text("View more"),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.amberAccent[700],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                BlogList(),
                SizedBox(height: 15),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 10, right: 0),
                  //alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.library_books_outlined,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Guides")
                        ],
                      ),
                      Row(
                        children: [
                          Text("View more"),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.amberAccent[700],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                BlogList()
              ],
            ),
          )),
    );
  }
}
