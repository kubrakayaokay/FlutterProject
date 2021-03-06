class Notes {
  int id;
  String title;
  String description;

  Notes(this.title, this.description);
  Notes.withId(this.id, this.title, this.description);


  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["title"] = title;
    map["description"] = description;
    return map;  }

  Notes.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.title = map["title"];
    this.description = map["description"];
  }
}