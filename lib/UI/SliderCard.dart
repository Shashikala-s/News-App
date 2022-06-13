import 'package:flutter/material.dart';

import 'package:news_app/Model/NewsModel.dart';
import 'package:page_transition/page_transition.dart';

import 'DetailPage.dart';

class SliderCard extends StatelessWidget {
  final NewsModel newsModel;

  const SliderCard({
    Key? key,
    required this.newsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight,
                child:  DetailPage(newsModel: newsModel)));
      },
      child: Card(

          child: Container(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        newsModel.author != '-'
                            ? Text('by' + newsModel.author,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.apply(color: Colors.white))
                            : Text(''),
                        Text(newsModel.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.apply(color: Colors.white,fontWeightDelta: 4)),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Text(newsModel.description,
                        maxLines: 4,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.apply(color: Colors.white)),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.colorBurn),
                  image: NetworkImage(
                    newsModel.urlToImage,
                  ),
                ),
              ))),
    );
  }
}