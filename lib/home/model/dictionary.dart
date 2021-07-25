class Dictionary {
  String? word;
  List<Meanings>? meanings;

  Dictionary({this.word, this.meanings});

  Dictionary.fromJson(Map<String, dynamic> json) {
    word = json['word'];
    if (json['meanings'] != null) {
      meanings = [];
      json["meanings"].forEach((v) {
        meanings?.add(Meanings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["word"] = word;
    if (this.meanings != null) {
      data["meanings"] = this.meanings!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class Meanings {
  String? partOfSpeech;
  List<Definitions>? definitions;

  Meanings({this.partOfSpeech, this.definitions});

  Meanings.fromJson(dynamic json) {
    partOfSpeech = json["partOfSpeech"];
    if (json["definitions"] != null) {
      definitions = [];
      json["definitions"].forEach((v) {
        definitions?.add(Definitions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["partOfSpeech"] = partOfSpeech;
    if (this.definitions != null) {
      data["definitions"] = this.definitions!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class Definitions {
  String? definition;
  String? example;

  Definitions({this.definition, this.example});

  Definitions.fromJson(dynamic json) {
    definition = json["definition"];
    example = json["example"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["definition"] = definition;
    data["example"] = example;
    return data;
  }

}