import 'dart:async';

import 'package:flutter_getx_template/data/model/chart_data_model.dart';
import 'package:flutter_getx_template/data/model/list_node_model.dart';

abstract interface class Repository {
  Future<ChartDataModel?> getChartData({required String nodes, required int limit});
  Future<ListNodeModel?> getListNodeData();
}
