class Post {
  String userId;
  String id;
  String title;
  String body;

  Post({
    this.userId,
    this.id,
    this.body,
    this.title,
  });
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'].toString(),
      id: json['id'].toString(),
      title: json['title'],
      body: json['body'],
    );
  }
}
