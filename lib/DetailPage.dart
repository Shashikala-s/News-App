import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/Model/NewsModel.dart';

class DetailPage extends StatefulWidget {
  final NewsModel newsModel;

  const DetailPage({Key? key, required this.newsModel}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const FaIcon(FontAwesomeIcons.heartPulse, color: Colors.white),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.colorBurn),
                        image: NetworkImage(
                          widget.newsModel.urlToImage,
                        ),
                      ),
                    )),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.35,
                right: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.height * 0.05,
                child: Container(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.015),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFd7d7d9).withOpacity(0.91)),
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.newsModel.publishedAt.split('T')[0],
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.apply(color: Colors.black, fontWeightDelta: 2),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        widget.newsModel.title,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.apply(color: Colors.black, fontWeightDelta: 3),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        'Published by ' + widget.newsModel.author,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.apply(color: Colors.black, fontWeightDelta: 1),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 5,
                  child: Container(
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: Colors.grey[400],
                      mini: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.52,
                left: MediaQuery.of(context).size.height*0.02,
                right: MediaQuery.of(context).size.height*0.02,

                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                  // color: Colors.redAccent,
                  child: Text(widget.newsModel.content,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.apply(color: Colors.black)),
                ),
              )
            ],
          ),
        ));
  }
}
