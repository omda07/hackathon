class MathematicsModel {
  String? status;
  String? message;
  List<Users>? users;

  MathematicsModel({this.status, this.message, this.users});

  MathematicsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add( Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? sId;
  String? userName;
  String? email;
  String? phone;
  String? linkedIn;
  String? imageUrl;
  int? score;
  bool? mathmatics;
  bool? algorithm;
  bool? bakckend;
  bool? isAdmin;

  Users(
      {this.sId,
        this.userName,
        this.email,
        this.phone,
        this.linkedIn,
        this.imageUrl,
        this.score,
        this.mathmatics,
        this.algorithm,
        this.bakckend,
        this.isAdmin});

  Users.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['userName'];
    email = json['email'];
    phone = json['phone'];
    linkedIn = json['linkedIn'];
    imageUrl = json['imageUrl'];
    score = json['score'];
    mathmatics = json['mathmatics'];
    algorithm = json['algorithm'];
    bakckend = json['bakckend'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['_id'] = sId;
    data['userName'] = userName;
    data['email'] = email;
    data['phone'] = phone;
    data['linkedIn'] = linkedIn;
    data['imageUrl'] = imageUrl;
    data['score'] = score;
    data['mathmatics'] = mathmatics;
    data['algorithm'] = algorithm;
    data['bakckend'] = bakckend;
    data['isAdmin'] = isAdmin;
    return data;
  }
}
