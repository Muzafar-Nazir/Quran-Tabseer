import 'dart:convert';

class QuranData {
  int? id;
  String? name;
  String? transliteration;
  String? translation;
  String? type;
  int? totalVerses;
  String? link;

  QuranData(
      {this.id,
      this.name,
      this.transliteration,
      this.translation,
      this.type,
      this.totalVerses,
      this.link});

  QuranData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    transliteration = json['transliteration'];
    translation = json['translation'];
    type = json['type'];
    totalVerses = json['total_verses'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['transliteration'] = this.transliteration;
    data['translation'] = this.translation;
    data['type'] = this.type;
    data['total_verses'] = this.totalVerses;
    data['link'] = this.link;
    return data;
  }
}

class Link {
  int? id;
  String? name;
  String? transliteration;
  String? translation;
  String? type;
  int? totalVerses;
  List<Verses>? verses;

  Link(
      {this.id,
      this.name,
      this.transliteration,
      this.translation,
      this.type,
      this.totalVerses,
      this.verses});

  Link.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    transliteration = json['transliteration'];
    translation = json['translation'];
    type = json['type'];
    totalVerses = json['total_verses'];
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(new Verses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['transliteration'] = this.transliteration;
    data['translation'] = this.translation;
    data['type'] = this.type;
    data['total_verses'] = this.totalVerses;
    if (this.verses != null) {
      data['verses'] = this.verses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Verses {
  int? id;
  String? text;
  String? translation;
  String? transliteration;

  Verses({this.id, this.text, this.translation, this.transliteration});

  Verses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    translation = json['translation'];
    transliteration = json['transliteration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['translation'] = this.translation;
    data['transliteration'] = this.transliteration;
    return data;
  }
}
