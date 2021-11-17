import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:news_api/model/news_model.dart';


class NewsServices {
  String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
   Future<List<Article>?> getHttp() async {

      var response = await Dio().get('https://newsapi.org/v2/everything?q=tesla&from=$now&page=1&language=en&sortBy=publishedAt&apiKey=5dff981646814b95a24204ed387bc108');
      return  newsModelFromJson(response.data).articles;
  }
}
