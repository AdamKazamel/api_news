import 'package:flutter/material.dart';
import 'package:news_api/model/news_model.dart';
import 'package:news_api/services/news_services.dart';


class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
   NewsServices services = NewsServices();
   List<Article>? news = <Article> [];
   bool newsLoading = true;
  @override
  void initState() {
    super.initState();
    gettingNews();

  }
   gettingNews() async {
    news = await services.getHttp() ;
    setState(() {
      newsLoading = false;
    });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: newsLoading ? Center(child: CircularProgressIndicator(),) :Container(
        // child: Text(news![0].author.toString()),
          child: ListView.builder(itemCount:news!.length ,shrinkWrap: true ,itemBuilder: (context, index) {
            return Row(children: [
            Text(news![index].author.toString()),
            const SizedBox(width: 5.0,),
            Text(news![index].title.toString()),
            ],);
          },),
    ));
  }
}

