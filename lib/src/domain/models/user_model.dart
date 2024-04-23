class UserModel {
  String? category;
  String? childName;
  String? date;
  String? dateOfBirth;
  String? description;
  String? doctorName;
  String? email;
  String? gender;
  String? level;
  String? password;
  String? phone;
  String? points;
  String? test;
  String? userId;
  String? levelProgress;

  UserModel(
      {this.category,
      this.childName,
      this.levelProgress,
      this.date,
      this.dateOfBirth,
      this.description,
      this.doctorName,
      this.email,
      this.gender,
      this.level,
      this.password,
      this.phone,
      this.points,
      this.test,
      this.userId});

  UserModel.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    childName = json['childName'];
    date = json['date'];
    dateOfBirth = json['dateOfBirth'];
    levelProgress = json['levelProgress'];
    description = json['description'];
    doctorName = json['doctorName'];
    email = json['email'];
    gender = json['gender'];
    level = json['level'];
    password = json['password'];
    phone = json['phone'];
    points = json['points'];
    test = json['test'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) data['category'] = category;
    if (childName != null) data['childName'] = childName;
    if (date != null) data['date'] = date;
    if (dateOfBirth != null) data['dateOfBirth'] = dateOfBirth;
    if (description != null) data['description'] = description;
    if (doctorName != null) data['doctorName'] = doctorName;
    if (email != null) data['email'] = email;
    if (gender != null) data['gender'] = gender;
    if (level != null) data['level'] = level;
    if (password != null) data['password'] = password;
    if (phone != null) data['phone'] = phone;
    if (points != null) data['points'] = points;
    if (test != null) data['test'] = test;
    if (levelProgress != null) data['levelProgress'] = levelProgress;
    if (userId != null) data['userId'] = userId;
    return data;
  }
}
