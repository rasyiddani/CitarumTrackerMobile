class ListNodeModel {
  ListNodeModel({
      this.statuscode, 
      this.message, 
      this.data,});

  ListNodeModel.fromJson(dynamic json) {
    statuscode = json['statuscode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? statuscode;
  String? message;
  Data? data;
ListNodeModel copyWith({  int? statuscode,
  String? message,
  Data? data,
}) => ListNodeModel(  statuscode: statuscode ?? this.statuscode,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statuscode'] = statuscode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.name, 
      this.list,});

  Data.fromJson(dynamic json) {
    name = json['name'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((dynamic v) {
        list?.add(List3.fromJson(v));
      });
    }
  }
  String? name;
  List<List3>? list;
Data copyWith({  String? name,
  List<List3>? list,
}) => Data(  name: name ?? this.name,
  list: list ?? this.list,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    if (list != null) {
      map['list'] = list?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class List3 {
  List3({
      this.node, 
      this.impedance,});

  List3.fromJson(dynamic json) {
    node = json['node'];
    impedance = json['impedance'];
  }
  String? node;
  int? impedance;
List3 copyWith({  String? node,
  int? impedance,
}) => List3(  node: node ?? this.node,
  impedance: impedance ?? this.impedance,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['node'] = node;
    map['impedance'] = impedance;
    return map;
  }

}