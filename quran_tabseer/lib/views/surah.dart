import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quran_tabseer/model/quran_data.dart';
import 'package:quran_tabseer/utils/custom_textstyle.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({Key? key}) : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<QuranData>>(
        future: fetchData(),
        builder: ((context, AsyncSnapshot<List<QuranData>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Center(
                        child: Text(
                          snapshot.data![index].name.toString(),
                          style: StylesText.ListHeadingStyle,
                        ),
                      ),
                      subtitle: Column(
                        children: [
                          Text(snapshot.data![index].link.toString()),
                          // Text(snapshot.data![index].totalVerses.toString()),
                          Text(snapshot.data![index].translation.toString()),
                          Text(
                              snapshot.data![index].transliteration.toString()),
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Eror"),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }

  Future<List<QuranData>> fetchData() async {
    List<QuranData> data = [];
    String url =
        "https://cdn.jsdelivr.net/npm/quran-json@3.1.2/dist/chapters/ur/index.json";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response);
      final result = jsonDecode(response.body);

      setState(() {
        for (Map<String, dynamic> value in result) {
          data.add(QuranData.fromJson(value));
        }
      });
      return data;
    } else {
      throw Exception("NetWork Erroor");
    }
  }
}
