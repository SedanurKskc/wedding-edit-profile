class ServiceModel {
  final int? id;
  final String? header;
  final String? value;

  ServiceModel({this.id, this.header, this.value});

  ServiceModel fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json["id"],
      header: json["header"],
      value: json["value"],
    );
  }
}
