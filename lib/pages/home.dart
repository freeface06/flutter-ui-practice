import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice/config/config.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart'; // 참고 : https://pub.dev/packages/pull_to_refresh

// vo
import 'package:practice/vo/postVo.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  List<Post> _postList = [];

  int _postSize = 0;

  final int _addCount = Config().viewCount;
  int _listCount = Config().viewCount;

  @override
  void initState() {
    super.initState();
    setState(() {
      _fetchPosts();
    });
  }

  void _fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> rawPosts = jsonDecode(response.body);
      _postSize = rawPosts.length;
      List<Post> posts = rawPosts.map((json) => Post.fromJson(json)).toList();
      setState(() {
        _postList = posts;
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  //새로고침
  void _onRefresh() async {
    await Future.delayed(
        const Duration(milliseconds: 1000)); //1초를 기다린 후 새로고침한다.
    setState(() {
      _listCount = _addCount;
    });
    //이 부분에 새로고침 시 불러올 기능을 구현한다.
    _refreshController.refreshCompleted();
  }

  //무한 스크롤
  void _onLoading() async {
    await Future.delayed(
        const Duration(milliseconds: 1000)); //1초를 기다린 후 새로운 데이터를 불러온다.
    setState(() {
      if (_listCount >= _postSize) {
        _listCount = _postSize;
      } else {
        _listCount += _addCount;
      }
    });
    //이부분에 데이터를 계속 불러오는 기능을 구현한다.
    //리스트뷰를 사용한다면 간단한 예로 list.add를 이용하여 데이터를 추가시켜준다.
    _refreshController.loadComplete();
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
          enablePullDown: true,
          // 아래로 당겨서 새로고침 할 수 있게 할건지의 유무를 결정
          enablePullUp: true,
          // 위로 당겨서 새로운 데이터를 불러올수 있게 할건지의 유무를 결정
          // 이 부분은 'header' 즉 머리뿐으로써, 새로고침시 로딩결과에 따라 어떠한 글자를 띄워 줄지 정의 할 수 있다.
          header: CustomHeader(
            builder: (BuildContext context, RefreshStatus? mode) {
              Widget body;
              body = Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text("새로고침"),
                  CupertinoActivityIndicator()
                ],
              );
              return SizedBox(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          // 이 부분은 'footer' 번역하면 바닥글이란 의미인데 무한스크롤시 로딩결과에 따라 어떠한 글자를 띄워 줄지를 정의할수있다.
          footer: CustomFooter(
            builder: (context, mode) {
              Widget body;
              if (_listCount < _postSize) {
                body = Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text("로딩중..."),
                      CupertinoActivityIndicator()
                    ]);
              } else {
                body = Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[Icon(Icons.cancel), Text("데이터 없음.")],
                );
              }
              return SizedBox(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          // 새로고침을 구현한 함수
          onLoading: _onLoading,
          // 무한스크롤을 구현한 함수
          child: _postList.length == 0
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemCount: _listCount,
                  itemBuilder: (context, index) {
                    final Post post = _postList[index];
                    return ListTile(
                      leading: const Icon(Icons.local_post_office),
                      title: Text(post.title),
                      subtitle: Text(post.body),
                      trailing: const Icon(Icons.arrow_right),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                )),
    );
  }
}
