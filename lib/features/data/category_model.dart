class CategoriesData {
  CategoriesData({
    required this.genres,
  });
  late final List<CategoryModel> genres;
  
  CategoriesData.fromJson(Map<String, dynamic> json){
    genres = List.from(json['genres']).map((e)=>CategoryModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['genres'] = genres.map((e)=>e.toJson()).toList();
    return data;
  }
}

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;
  
  CategoryModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}