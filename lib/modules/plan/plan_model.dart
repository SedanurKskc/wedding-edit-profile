class PlanModel {
  int? id;
  String? header;
  bool? value;
  String? parent;

  PlanModel({this.id, this.header, this.value, this.parent});

  PlanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    value = json['value'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['header'] = header;
    data['value'] = value;
    data['parent'] = parent;
    return data;
  }
}

extension PlanModelListExtension on List<PlanModel> {
  List<String> get uniqueParents => map((e) => e.parent ?? "").toSet().toList();
  List<PlanModel> childs(String parent) => where((e) => e.parent == parent).toList();
  List<(String, List<PlanModel>)> get groupedList => uniqueParents.map((e) => (e, childs(e))).toList();
}
