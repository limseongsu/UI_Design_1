import 'package:flutter/material.dart';
import 'package:ui_design/body/detail_bottom_bar.dart';
import 'package:ui_design/models/fake_data.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailPages extends StatefulWidget {
  List<Result> news;

  DetailPages(this.news);

  @override
  _DetailPagesState createState() => _DetailPagesState();
}

class _DetailPagesState extends State<DetailPages> {
  List<Widget> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      for (int i = 0; i < widget.news[0].paragraphs.length; i++) {
        if (widget.news[0].paragraphs[i].type == 'Text' ||
            widget.news[0].paragraphs[i].type == 'Quote') {
          items.add(Column(
            children: [
              Text(
                widget.news[0].paragraphs[i].text,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 16.0,
              )
            ],
          ));
        } else if (widget.news[0].paragraphs[i].type == 'CodeBlock') {
          List codes = widget.news[0].paragraphs[i].text.split('/n').toList();
          List<Text> texts = codes
              .map((e) => Text(
            e,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ))
              .toList();
          items.add(Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0XFFE9E7EA),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: texts,
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              )
            ],
          ));
        } else if (widget.news[0].paragraphs[i].type == 'Header') {
          items.add(Column(
            children: [
              Text(
                widget.news[0].paragraphs[i].text,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16.0,
              )
            ],
          ));
        } else if (widget.news[0].paragraphs[i].type == 'Subhead') {
          items.add(Column(
            children: [
              Text(
                widget.news[0].paragraphs[i].text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16.0,
              )
            ],
          ));
        } else
          items.add(Column(
            children: [
              InkWell(
                child: Text(
                  '• ${widget.news[0].paragraphs[i].text}',
                  style: TextStyle(
                      height: 1.5,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline),
                ),
                onTap: () =>
                    launch('${widget.news[0].paragraphs[i].markups[0].href}'),
              ),
              SizedBox(
                height: 16.0,
              )
            ],
          ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: false,
        title: Text(
          'Published in: ${widget.news[0].publication.name}',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    '${widget.news[0].publication.logoUrl}',
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                widget.news[0].title,
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 16),
              Text(
                widget.news[0].subtitle,
                style: TextStyle(fontSize: 16, color: Colors.black38),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(
                    Icons.account_circle_sharp,
                    size: 42,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.news[0].publication.name,
                        style: TextStyle(color: Colors.black45),
                      ),
                      Text(
                        '${widget.news[0].metadata.date}•${widget.news[0].metadata.readTimeMinutes} min read',
                        style: TextStyle(color: Colors.black38),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start, children: items)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: BottomBar(widget.news),
      ),
    );
  }
}