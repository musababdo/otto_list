class CityModel {
  final String id;
  final String name;

  CityModel({required this.id, required this.name});

  factory CityModel.formJson(Map <dynamic, dynamic> json){
    return new CityModel(
      id: json['id'],
      name: json['name'],
    );
  }
}