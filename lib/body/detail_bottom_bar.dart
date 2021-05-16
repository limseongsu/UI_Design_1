import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_design/models/fake_data.dart';
import 'package:ui_design/models/provider.dart';
//TODO IconButton 으로 수정
class BottomBar extends StatefulWidget {
  BottomBar(this.news);

  List<Result> news;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8.0,),
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: IconButton(
                  icon: context.read<ThisProvider>().like.contains(widget.news[0].id)
                      ? Icon(Icons.favorite,
                    size: 30,)
                      : Icon(Icons.favorite_border,
                    size: 30,),
                  onPressed: () {
                    setState(() {
                      if (context.read<ThisProvider>().like.contains(widget.news[0].id)) {
                        context.read<ThisProvider>().like.remove(widget.news[0].id);
                      } else context.read<ThisProvider>().like.add(widget.news[0].id);
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: context.read<ThisProvider>().bookMark.contains(widget.news[0].id)
                      ? Icon(Icons.bookmark,
                    size: 30,)
                      : Icon(Icons.bookmark_border,
                    size: 30,),
                  onPressed: () {
                    setState(() {
                      if (context.read<ThisProvider>().bookMark.contains(widget.news[0].id)) {
                        context.read<ThisProvider>().bookMark.remove(widget.news[0].id);
                      } else context.read<ThisProvider>().bookMark.add(widget.news[0].id);
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.share_rounded,
                    size: 30,),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.text_fields,
                  size: 30,),
              ],
            )
        ),
        SizedBox(width: 16.0,),
      ],
    );
  }
}
