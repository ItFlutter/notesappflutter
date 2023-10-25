class AppLink {
  //===========================SERVER=================================
  static const String server = "http://192.168.1.109/notesapp";
  //===========================AUTH=================================
  static const String login = "$server/auth/login.php";
  static const String signup = "$server/auth/signup.php";
  //===========================Notes=================================
  static const String view = "$server/notes/view.php";
  static const String delete = "$server/notes/delete.php";
  static const String add = "$server/notes/add.php";
  static const String edit = "$server/notes/edit.php";
  //===========================Search=================================
  static const String search = "$server/search.php";
}
