class ModelModel {
  final String id;
  final String name;

  ModelModel({required this.id, required this.name});

  factory ModelModel.formJson(Map <dynamic, dynamic> json){
    return new ModelModel(
      id: json['id'],
      name: json['name'],
    );
  }
}