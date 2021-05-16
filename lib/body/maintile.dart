import 'package:flutter/material.dart';
import 'package:ui_design/body/detailpage.dart';
import 'package:ui_design/models/fake_data.dart';
import 'package:provider/provider.dart';
import 'package:ui_design/models/provider.dart';

// ignore: must_be_immutable
class MainTile extends StatefulWidget {
  List<Result> news;


  @override
  _MainTileState createState() => _MainTileState();

  MainTile(this.news);
}

class _MainTileState extends State<MainTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPages(widget.news)));
      },
      child: SizedBox(
        child: ListTile(
          leading: Image.network("${widget.news[0].publication.logoUrl}"),
          title: Text('${widget.news[0].title}'),
          subtitle: Text(
              '${widget.news[0].metadata.date} - ${widget.news[0].metadata.readTimeMinutes} min read'),
          trailing: IconButton(
            alignment: Alignment.centerRight,
            icon: context
                    .read<ThisProvider>()
                    .bookMark
                    .contains(widget.news[0].id)
                ? Icon(Icons.bookmark)
                : Icon(Icons.bookmark_border),
            onPressed: () {
              setState(() {
                if (context
                    .read<ThisProvider>()
                    .bookMark
                    .contains(widget.news[0].id)) {
                  context
                      .read<ThisProvider>()
                      .bookMark
                      .remove(widget.news[0].id);
                } else
                  context.read<ThisProvider>().bookMark.add(widget.news[0].id);
              });
            },
          ),
        ),
      ),
    );
  }
}
