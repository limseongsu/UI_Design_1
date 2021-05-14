import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ui_design/models/fake_data.dart';

class MainSlider extends StatelessWidget {
  List<Result> news;

  MainSlider(this.news);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: news.map((e) => ThisWidget(e)).toList(),
        options: CarouselOptions(
          enableInfiniteScroll: false,
        ));
  }
}

class ThisWidget extends StatelessWidget {

ThisWidget(this.news);

  final Result news;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.network(
                "${news.publication.logoUrl}",
                width: 100,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('${news.title}'),
                    subtitle: Text(
                        '${news.metadata.date} - ${news.metadata.readTimeMinutes} min read'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
