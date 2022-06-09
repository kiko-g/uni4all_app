class Group {
  final int id;
  final String typename;
  final String title;
  final String description;
  final int mlimit;
  final bool autoaccept;
  final int classid;

  const Group({
    this.id,
    this.typename,
    this.title,
    this.description,
    this.mlimit,
    this.autoaccept,
    this.classid,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      typename: json['typename'],
      title: json['title'],
      description: json['description'],
      mlimit: json['mlimit'],
      autoaccept: json['autoaccept'],
      classid: json['classid'],
    );
  }
}
