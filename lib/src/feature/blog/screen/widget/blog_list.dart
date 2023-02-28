import 'package:flutter/material.dart';
import 'package:royal_landapp/src/feature/blog/screen/widget/blog_item.dart';

class BlogList extends StatefulWidget {
  const BlogList({Key? key}) : super(key: key);

  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          cacheExtent: 0,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          // padding: EdgeInsets.only(left: 10, top: 10, right: 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 4 / 4.5,
              crossAxisCount: 2,
              // crossAxisSpacing: 4,
              mainAxisSpacing: 0),
          itemCount: 4,
          itemBuilder: (context, index) {
            return BlogItem(
                // showIcon: true,

                );
          },
        ),
      ],
    );
  }
}
