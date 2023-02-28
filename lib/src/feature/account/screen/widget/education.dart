import 'package:flutter/material.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: Container(
        child: Text("Null!"),
      ),
    );
  }

  get _buildAppBar {
    return AppBar(
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Education",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://scontent.fpnh20-1.fna.fbcdn.net/v/t1.15752-9/245004538_1470052286710763_5830766021133930848_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=ae9488&_nc_eui2=AeE8n4EtHQtRwzHdO92NjpunJrNOD4h9W2Yms04PiH1bZink-UnraAZQALqEB1G0_nVGxdE-XBLiY2dBbJhOF0l2&_nc_ohc=TeHjt-QHFCIAX9W0qd6&_nc_ht=scontent.fpnh20-1.fna&oh=1d5cb95b64cb2b31b0f2bf4aa3c7c35e&oe=61CE9F63"),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.indigo,
      centerTitle: true,
    );
  }
}
