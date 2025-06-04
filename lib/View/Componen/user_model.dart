class User {
  String image, name, email, phone, weight, height;
  // String aboutMeDescription;

  // Constructor
  User({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.weight,
    required this.height,
    // required this.aboutMeDescription,
  });

  User copy({
    String? imagePath,
    String? name,
    String? phone,
    String? email,
    String? weight,
    String? height,
    // String? about,
  }) =>
      User(
        image: imagePath ?? image,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        weight: weight ?? this.weight,
        height: height ?? this.height,

        // aboutMeDescription: about ?? this.aboutMeDescription,
      );

  static User fromJson(Map <String, dynamic> json) => User(
        image: json['imagePath'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        weight: json['weight'],
        height: json['height'],
      );

  Map <String, dynamic> toJson() => {
    'imagePath': image,
    'name': name,
    'email': email,
    'phone': phone,
    'weight': weight,
    'height': height,
  };
}
