class LevelModel {
  int? level;
  int? testsNum;
  List<CategoryModel>? categories;

  LevelModel({
    this.level,
    this.testsNum,
    this.categories});

  LevelModel.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    testsNum = json['testsNum'];
    if (json['categories'] != null) {
      categories = <CategoryModel>[];
      json['categories'].forEach((v) {
        categories?.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = level;
    data['testsNum'] = testsNum;
    if (categories != null) {
      data['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryModel {
  int? id;
  List<TestModel>? tests;

  CategoryModel({this.id, this.tests});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['tests'] != null) {
      tests = <TestModel>[];
      json['tests'].forEach((v) {
        tests?.add(TestModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (tests != null) {
      data['tests'] = tests?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TestModel {
  int? id;
  String? audio;
  int? points;
  int? nextTest;
  int? testNum;
  List<String>? recognition;
  int? nextCategory;
  int? nextLevel;
  List<McqModel>? mcq;
  bool? isLast;

  TestModel(
      {this.id,
        this.audio,
        this.testNum,
        this.points,
        this.nextTest,
        this.nextLevel,
        this.recognition,
        this.nextCategory,
        this.mcq,
        this.isLast});

  TestModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    audio = json['audio'];
    points = json['points'];
    testNum = json['testNum'];
    nextTest = json['nextTest'];
    nextLevel = json['nextLevel'];
    recognition = json['recognition'].cast<String>();
    nextCategory = json['nextCategory'];
    if (json['images'] != null) {
      mcq = <McqModel>[];
      json['images'].forEach((v) {
        mcq?.add(McqModel.fromJson(v));
      });
    }
    isLast = json['isLast'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['audio'] = audio;
    data['testNum'] = testNum;
    data['points'] = points;
    data['nextTest'] = nextTest;
    data['nextLevel'] = nextLevel;
    data['recognition'] = recognition;
    data['nextCategory'] = nextCategory;
    if (mcq != null) {
      data['images'] = mcq?.map((v) => v.toJson()).toList();
    }
    data['isLast'] = isLast;
    return data;
  }
}

class McqModel {
  String? image;
  bool? isAnswer;
  bool? answer;

  McqModel({this.image, this.isAnswer});

  McqModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    isAnswer = json['isAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['isAnswer'] = isAnswer;
    return data;
  }
}
