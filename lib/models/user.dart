class User {
    User({
        required this.page,
        required this.perPage,
        required this.total,
        required this.totalPages,
        required this.data,
        required this.support,
    });

    final int page;
    final int perPage;
    final int total;
    final int totalPages;
    final List<UserData> data;
    final Support support;

    factory User.fromJson(Map<String, dynamic> json) => User(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: List<UserData>.from(json["data"].map((x) => UserData.fromJson(x))),
        support: Support.fromJson(json["support"]),
    );
}

class UserData {
    UserData({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.avatar,
    });

    final int id;
    final String email;
    final String firstName;
    final String lastName;
    final String avatar;

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );
}

class Support {
    Support({
        required this.url,
        required this.text,
    });

    final String url;
    final String text;

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );
}
