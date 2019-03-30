import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;
import 'package:quran_app/model/Chapters.dart';
import 'package:quran_app/src/chapters/model/model.dart';

void main() {
  test("Chapter_test", () {
    final res_chapters = """{
    "id":1,
    "chapter_number":1,
    "bismillah_pre":false,
    "revelation_order":5,
    "revelation_place":"makkah",
    "name_complex":"Al-Fātiĥah",
    "name_arabic":"الفاتحة",
    "name_simple":"Al-Fatihah",
    "verses_count":7,
    "pages":[1,1],
    "translated_name":{"language_name":"english",
    "name":"The Opener"}}""";

    //final res_final=json.jsonDecode(chapters);
    expect(getChapter(res_chapters), isNotEmpty);
  });

  test("Json chap", () async {
    final storiesUrl = 'http://staging.quran.com:3000/api/v3/chapters';
    final storyRes = await http.get(Uri.parse(storiesUrl));
//    final res = json.jsonDecode(storyRes.body);
//    print(res['chapters'][0]);
    expect(getChapter(storyRes.body), isNotNull);
  });

  test("Json verses", () async {
    final storiesUrl =
        'http://staging.quran.com:3000/api/v3/chapters/1/verses?recitation=1&translations=21&language=en&text_type=words';
    final storyRes = await http.get(Uri.parse(storiesUrl));
    //print(storyRes.body);
    expect(getmadni(storyRes.body), isNotNull);
  });

  test("Json meta", () async {
    final storiesUrl =
        'http://staging.quran.com:3000/api/v3/chapters/2/verses?recitation=1&translations=21&language=en&page=1&limit=50&text_type=words';
    final storyRes = await http.get(Uri.parse(storiesUrl));
    //print(storyRes.body);
    expect(getmeta(storyRes.body), isNotNull);
  });
}
