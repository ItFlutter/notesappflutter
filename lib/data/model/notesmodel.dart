class NotesModel {
  String? notesId;
  String? notesTitle;
  String? notesNote;
  String? notesUser;
  String? notesColor;
  String? notesCreate;

  NotesModel(
      {this.notesId,
      this.notesTitle,
      this.notesNote,
      this.notesUser,
      this.notesColor,
      this.notesCreate});

  NotesModel.fromJson(Map<String, dynamic> json) {
    notesId = json['notes_id'].toString();
    notesTitle = json['notes_title'].toString();
    notesNote = json['notes_note'].toString();
    notesUser = json['notes_user'].toString();
    notesColor = json['notes_color'].toString();
    notesCreate = json['notes_create'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notes_id'] = this.notesId;
    data['notes_title'] = this.notesTitle;
    data['notes_note'] = this.notesNote;
    data['notes_user'] = this.notesUser;
    data['notes_color'] = this.notesColor;
    data['notes_create'] = this.notesCreate;
    return data;
  }
}
