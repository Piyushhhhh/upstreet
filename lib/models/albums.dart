class Album {
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Album(int id, String title, String url, String thumbnailUrl) {
    this.id = id;
    this.title = title;
    this.url = url;
    this.thumbnailUrl = thumbnailUrl;
  }

  Album.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];

  Map toJson() {
    return {'id': id, 'title': title, 'url': url, 'thumbnailUrl': thumbnailUrl};
  }
}
