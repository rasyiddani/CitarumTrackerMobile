import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_getx_template/data/model/chart_data_model.dart';
import 'package:flutter_getx_template/data/model/list_node_model.dart';
import 'package:flutter_getx_template/data/network.dart';
import 'package:flutter_getx_template/data/respository/repository.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl({required this.networkCore});

  NetworkCore networkCore;

  @override
  Future<ChartDataModel?> getChartData({required String nodes, required int limit}) async {
    late Response<dynamic>? response;
    try {
      response = await networkCore.getRequest<ChartDataModel>('/api/nodes?node=$nodes&limit=$limit',
          // queryParameters: {
          //   'node': nodes,
          //   'limit': limit
          // },
          decoder: ChartDataModel.fromJson,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          });
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return response?.body;
  }

  @override
  Future<ListNodeModel?> getListNodeData() async {
    late Response<dynamic>? response;
    try {
      response = await networkCore.getRequest<ListNodeModel>('/api/nodes/list',
          decoder: ListNodeModel.fromJson,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          });
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return response?.body;
  }
}
