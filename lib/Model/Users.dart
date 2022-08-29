class Users {
  final String id;
  final String userid;
  final String passwd;
  final String userstatus;
  final String isadmin;

  static final columns = ["id", "userid", "passwd", "userstatus", "isadmin"];

  Users(this.id, this.userid, this.passwd, this.userstatus, this.isadmin);

  factory Users.fromMap(Map data) {
    return Users(data['id'], data['userid'], data['passwd'],
        data['userstatus'], data['isadmin']);
  }

  String get username => userid;

  String get password => passwd;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["userid"] = userid;
    map["passwd"] = passwd;
    map["userstatus"] = userstatus;
    map["isadmin"] = isadmin;
    return map;
  }
}