class LoginModel {
  String? usersId;
  String? usersEmail;
  String? usersPassword;
  String? usersCreate;

  LoginModel(
      {this.usersId, this.usersEmail, this.usersPassword, this.usersCreate});

  LoginModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersEmail = json['users_email'];
    usersPassword = json['users_password'];
    usersCreate = json['users_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['users_id'] = this.usersId;
    data['users_email'] = this.usersEmail;
    data['users_password'] = this.usersPassword;
    data['users_create'] = this.usersCreate;
    return data;
  }
}
