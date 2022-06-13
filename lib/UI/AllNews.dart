import 'package:flutter/material.dart';
import 'package:news_app/Utils/Constant.dart';
import 'package:news_app/Model/NewsModel.dart';
import 'package:page_transition/page_transition.dart';

import 'DetailPage.dart';

class AllNews extends StatefulWidget {
  final List<NewsModel> newsList;

  const AllNews({Key? key, required this.newsList}) : super(key: key);

  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.grey),
        elevation: 0,
        title: Text(
          'News Updates',
          style:
              Theme.of(context).textTheme.headline6!.apply(fontWeightDelta: 1),
        ),
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height * 0.050,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.newsList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.15,
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.colorBurn),
                        image: NetworkImage(
                          widget.newsList[index].urlToImage,
                        ),
                      ),
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      widget.newsList[index].publishedAt.split('T')[0],
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          ?.apply(color: Colors.black, fontWeightDelta: 2),

                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      widget.newsList[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.apply(color: Colors.black, fontWeightDelta: 3),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      widget.newsList[index].description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.apply(color: Colors.black, ),
                      textAlign: TextAlign.start,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.leftToRight,
                                child:  DetailPage(
                                  newsModel: widget.newsList[index],
                                )));
                      },
                      child: Text(Constant().seeMore,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.apply(color: Colors.blue, fontWeightDelta: 1)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      'Published by ' + widget.newsList[index].author,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.apply(color: Colors.black, fontWeightDelta: 2),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
