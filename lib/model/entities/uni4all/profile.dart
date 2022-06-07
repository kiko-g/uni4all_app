class Profile {
  final String name;
  final String gender;
  final String birthday;
  final String nationality;
  final String number;
  final String email;

  const Profile({
    this.name,
    this.gender,
    this.birthday,
    this.nationality,
    this.number,
    this.email,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      gender: json['gender'],
      birthday: json['birthday'],
      nationality: json['nationality'],
      number: json['number'],
      email: json['email'],
    );
  }
}