class UserModel {
  String? status;
  String? message;
  String? token;
  Profile? profile;

  UserModel({this.status, this.message, this.profile});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    profile =
    json['profile'] != null ?  Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? sId;
  String? userName;
  String? email;
  String? imageUrl;
  int? score;
  bool? mathmatics;
  bool? algorithm;
  bool? bakckend;
  bool? isAdmin;

  Profile(
      {this.sId,
        this.userName,
        this.email,
        this.imageUrl,
        this.score,
        this.mathmatics,
        this.algorithm,
        this.bakckend,
        this.isAdmin});

  Profile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    score = json['score'];
    mathmatics = json['mathmatics'];
    algorithm = json['algorithm'];
    bakckend = json['bakckend'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    data['userName'] = userName;
    data['email'] = email;
    data['imageUrl'] = imageUrl;
    data['score'] = score;
    data['mathmatics'] = mathmatics;
    data['algorithm'] = algorithm;
    data['bakckend'] = bakckend;
    data['isAdmin'] = isAdmin;
    return data;
  }
}
