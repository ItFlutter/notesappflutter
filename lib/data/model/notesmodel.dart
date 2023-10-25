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
    notesId = json['notes_id'];
    notesTitle = json['notes_title'];
    notesNote = json['notes_note'];
    notesUser = json['notes_user'];
    notesColor = json['notes_color'];
    notesCreate = json['notes_create'];
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
