
class Users {
    Users({
        this.id,
        this.title,
        this.firstName,
        this.lastName,
        this.picture,
    });

    String id;
    String title;
    String firstName;
    String lastName;
    String picture;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        title: json["title"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        picture: json["picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "firstName": firstName,
        "lastName": lastName,
        "picture": picture,
    };
}
