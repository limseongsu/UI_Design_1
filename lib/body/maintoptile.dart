import 'package:flutter/material.dart';
import 'package:ui_design/main.dart';
import 'package:ui_design/models/fake_data.dart';
import 'package:ui_design/body/detailpage.dart';

class MainTopTile extends StatefulWidget {
  List<Result> news;

  MainTopTile(this.news);

  @override
  _MainTopTileState createState() => _MainTopTileState();
}

class _MainTopTileState extends State<MainTopTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => DetailPage())); //news[0]
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top stories for you",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Center(
            child: Image.network("${widget.news[0].publication.logoUrl}"),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            '${widget.news[0].title}',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            '${widget.news[0].metadata.author.name}',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            '${widget.news[0].metadata.date}',
            style: TextStyle(fontSize: 16, color: Colors.black38),
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
