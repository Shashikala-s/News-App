import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Model/NewsModel.dart';
import 'package:news_app/Services/AppAPI.dart';
import 'package:news_app/Services/AppServices.dart';
import 'package:news_app/UI/AllNews.dart';
import 'package:news_app/UI/SliderCard.dart';
import 'package:news_app/Utils/AppScaffoldMessenger.dart';
import 'package:news_app/Utils/Menu/AppOptionMenu.dart';
import 'package:page_transition/page_transition.dart';

import '../Utils/Constant.dart';
import 'DetailPage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final searchController = TextEditingController();

  List<Widget> items = [];
  List<NewsModel> newsList = [];
  List<String> categories = ['Healthy', 'Technology', 'Finance', 'Art'];
  int selectedCategory = 0;

  @override
  void initState() {
    getDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.010),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: searchController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                    color: Theme.of(context).iconTheme.color!,
                                    width: 0.2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                    color: Theme.of(context).iconTheme.color!,
                                    width: 0.2),
                              ),
                              labelText: 'Search..',
                              suffixIcon: GestureDetector(
                                  onTap: (){
                                    getDetails();
                                  },
                                  child: const Icon(Icons.search)),),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        mini: true,
                        onPressed: () {},
                        child: Icon(
                          Icons.notifications_active,
                          color: Theme.of(context).cardColor,
                        ),
                      ),
                      PopupMenuButton<String>(
                        onSelected: (String selected) {
                          AppOptionMenu().choiceSelection(selected, context);
                        },
                        itemBuilder: (BuildContext context) {
                          return AppOptionMenu.choices.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.010),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Latest News',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.apply(color: Colors.black, fontWeightDelta: 3)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.leftToRight,
                                child: AllNews(
                                  newsList: newsList,
                                )));
                      },
                      child: Text(Constant().seeMore,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.apply(color: Colors.blue, fontWeightDelta: 1)),
                    ),
                  ],
                ),
              ),
              items.isNotEmpty
                  ? CarouselSlider(
                      items: items,
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.30,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.99,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 50),
                        autoPlayAnimationDuration: const Duration(seconds: 10),
                        autoPlayCurve: Curves.easeIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ))
                  : const Text(''),
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.030),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.050,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            FloatingActionButton.extended(
                              onPressed: () {
                                setState(() {
                                  selectedCategory = index;
                                });
                              },
                              label: Text(categories[index]),
                              heroTag: null,
                              elevation: 0,
                              backgroundColor: selectedCategory == index
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).focusColor,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.020,
                            )
                          ],
                        );
                      }),
                ),
              ),
              Expanded(
                // height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder<List<NewsModel>>(
                    future: AppServices().getNewsData(AppAPI().newsTop),
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? Container(
                              child: ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType
                                                  .leftToRight,
                                              child: DetailPage(
                                                  newsModel:
                                                      snapshot.data![index])));
                                    },
                                    child: Card(
                                        child: Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      snapshot
                                                          .data![index].title,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          ?.apply(
                                                              color:
                                                                  Colors.white,
                                                              fontWeightDelta:
                                                                  4)),
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.07,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                            snapshot
                                                                .data![index]
                                                                .author,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .caption
                                                                ?.apply(
                                                                    color: Colors
                                                                        .white)),
                                                      ),
                                                      Text(
                                                          snapshot.data![index]
                                                              .publishedAt
                                                              .split('T')[0],
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .caption
                                                              ?.apply(
                                                                  color: Colors
                                                                      .white)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.2),
                                                    BlendMode.colorBurn),
                                                image: NetworkImage(
                                                  snapshot
                                                      .data![index].urlToImage,
                                                ),
                                              ),
                                            ))),
                                  );
                                },
                              ),
                            )
                          : Text('');
                    },
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.height * 0.05,
              right: MediaQuery.of(context).size.height * 0.05,
              child: Container(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white.withOpacity(1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.home,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          'Home',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.apply(color: Colors.black, fontWeightDelta: 1),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          'Favorite',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.apply(color: Colors.black, fontWeightDelta: 1),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          'Profile',
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.apply(color: Colors.black, fontWeightDelta: 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      )),
    );
  }

  void getDetails() async {
    String url=AppAPI().news;
    if (searchController.text.isNotEmpty) {
      url = AppAPI().newsSearch + searchController.text +'&'+ Constant().apiKey;
    } else {
      url = AppAPI().news;
    }
    if (url.isNotEmpty) {
      AppScaffoldMessenger().loadingMsg(context, 'Loading..');
      await AppServices().getNewsData(url).then((value) {
        setState(() {
          if (value.isNotEmpty) {
            newsList=[];
            items=[];
            newsList = value;
            for (var dta in value) {
              items.add(SliderCard(
                newsModel: dta,
              ));
            }
            if (searchController.text.isNotEmpty) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: AllNews(
                        newsList: newsList,
                      )));
            }
          }
        });
      });
    }
  }


}
