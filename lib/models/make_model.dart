class MakeModel {
  final String id;
  final String name;

  MakeModel({required this.id, required this.name});

  factory MakeModel.formJson(Map <dynamic, dynamic> json){
    return new MakeModel(
      id: json['id'],
      name: json['name'],
    );
  }
}