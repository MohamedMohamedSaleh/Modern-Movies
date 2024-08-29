class ShowVideoModel {
  late final int id;
  late final List<VideoModel> results;

  ShowVideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    results =
        List.from(json['results']).map((e) => VideoModel.fromJson(e)).toList();
  }
}

class VideoModel {
  late final String iso_639_1;
  late final String iso_3166_1;
  late final String name;
  late final String key;
  late final String site;
  late final int size;
  late final String type;
  late final bool official;
  late final String publishedAt;
  late final String id;

  VideoModel.fromJson(Map<String, dynamic> json) {
    iso_639_1 = json['iso_639_1'];
    iso_3166_1 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }
}
