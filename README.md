# dependencies:
```
dependencies:
  ...
  cupertino_icons: ^1.0.2
  http: ^0.13.4
  table_calendar: ^3.0.0
  pull_to_refresh: ^2.0.0
  intl: ^0.18.1
  ...
```

# Day 1.

- BottomNavigationBar 탭5개 생성
- 탭5개 마다 각각의 페이지 생성
- 탭하였을때 각각의 페이지로 VIEW 변경

# Day 2.

- AppBar Custom
- AppBar 버튼 클릭시 SnackBar 메세지 출력
- fetch를 사용한 더미데이터 가져오기
- 가져온 더미데이터를 바탕으로 Home 화면에 ListView 추가
- Calendar 탭에 달력 뷰 추가

# Day 3.

- pull_to_refresh을 사용한 ListView scroll 로딩 기능.
- 하단으로 scroll시 새로운 데이터 로딩
- 상단으로 scroll시 페이지 새로고침

# Day 4.
- ListView 탭시 showDialog 팝업창으로 상세내용 표시.
- TableCalendar Event 추가
- TableCalendar Widget Locale 설정
1) dependencies에 intl패키지 추가
```
dependencies:
...
  intl: ^0.18.1
...
```

2) intl패키지 import
```
import 'package:intl/date_symbol_data_local.dart';
```

3) main.dart에 main()함수 수정
```
void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}
```

4) TableCalendar locale 속성값 추가

```
TableCalendar<Event>(
...
  locale: 'ko_KR',
...
```
