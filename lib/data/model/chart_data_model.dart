class ChartDataModel {
  ChartDataModel({
      this.statuscode, 
      this.message, 
      this.data,});

  ChartDataModel.fromJson(dynamic json) {
    statuscode = json['statuscode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? statuscode;
  String? message;
  Data? data;
ChartDataModel copyWith({  int? statuscode,
  String? message,
  Data? data,
}) => ChartDataModel(  statuscode: statuscode ?? this.statuscode,
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
      this.max, 
      this.min, 
      this.list,});

  Data.fromJson(dynamic json) {
    max = json['max'];
    min = json['min'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((dynamic v) {
        list?.add(List2.fromJson(v));
      });
    }
  }
  int? max;
  int? min;
  List<List2>? list;
Data copyWith({  int? max,
  int? min,
  List<List2>? list,
}) => Data(  max: max ?? this.max,
  min: min ?? this.min,
  list: list ?? this.list,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['max'] = max;
    map['min'] = min;
    if (list != null) {
      map['list'] = list?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class List2 {
  List2({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.node, 
      this.fasa, 
      this.imaginer, 
      this.latitude, 
      this.longitude, 
      this.magnitude, 
      this.real, 
      this.impedance, 
      this.time,});

  List2.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    node = json['node'];
    fasa = json['fasa'];
    imaginer = json['imaginer'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    magnitude = json['magnitude'];
    real = json['real'];
    impedance = json['impedance'];
    time = json['time'];
  }
  int? id;
  String? createdAt;
  dynamic updatedAt;
  String? node;
  String? fasa;
  String? imaginer;
  String? latitude;
  String? longitude;
  dynamic magnitude;
  String? real;
  String? impedance;
  dynamic time;
List2 copyWith({  int? id,
  String? createdAt,
  dynamic updatedAt,
  String? node,
  String? fasa,
  String? imaginer,
  String? latitude,
  String? longitude,
  dynamic magnitude,
  String? real,
  String? impedance,
  dynamic time,
}) => List2(  id: id ?? this.id,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  node: node ?? this.node,
  fasa: fasa ?? this.fasa,
  imaginer: imaginer ?? this.imaginer,
  latitude: latitude ?? this.latitude,
  longitude: longitude ?? this.longitude,
  magnitude: magnitude ?? this.magnitude,
  real: real ?? this.real,
  impedance: impedance ?? this.impedance,
  time: time ?? this.time,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['node'] = node;
    map['fasa'] = fasa;
    map['imaginer'] = imaginer;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['magnitude'] = magnitude;
    map['real'] = real;
    map['impedance'] = impedance;
    map['time'] = time;
    return map;
  }

}