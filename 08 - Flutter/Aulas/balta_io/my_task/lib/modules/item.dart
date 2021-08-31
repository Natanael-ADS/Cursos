class Item {
  String title = "";
  bool done = false;

  Item({required this.title, required this.done});

  Item.FromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['title'] = this.title;
    data['done'] = this.done;

    return data;
  }
}
