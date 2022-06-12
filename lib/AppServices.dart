import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/AppAPI.dart';
import 'package:news_app/Model/NewsModel.dart';

String key = 'f60c311657c140839de3a3a75c20fbcc';

class AppServices {
  Future<List<NewsModel>> getNewsData(String url) async {
    List<NewsModel> newList=[];

    Response response;
    Map? dataResponse;
    // String url = AppAPI().news;

    try {
      response = await get(
        Uri.parse(url),
      );
      print(response.body);

      if (response.statusCode == 200) {
        dataResponse = jsonDecode((response.body));
        bool success = true;
        // bool success = dataResponse!['Success'];
        if (success) {
          final json = jsonDecode(response.body);
          // print(json);
          newList = json['articles']
              .map<NewsModel>((json) => NewsModel.fromJson(json))
              .toList();

        } else {

          // LoginController().logoutFunction(context);
        }
      } else {
        // AppErrorHandling()
        //     .responseError(response, context, url, sessionId.toString());
      }

    } catch (e) {
      // AppErrorHandling()
      //     .catchError(e.toString(), context, url, sessionId.toString());
    }
    return newList;

  }

}
