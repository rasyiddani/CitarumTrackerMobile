import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/core/base/base_controller.dart';
import 'package:flutter_getx_template/data/model/chart_data_model.dart';
import 'package:flutter_getx_template/data/model/graph_model.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum InfoDetail { info, detail }

class NodesController extends BaseController {
  Map<InfoDetail, Color> segmentedColors = <InfoDetail, Color>{
    InfoDetail.info: Colors.white,
    InfoDetail.detail: Colors.white,
  };

  final limit = 10;
  final String? nodeNumber = Get.arguments['node_number'];
  final String? nodeName = Get.arguments['node_name'];

  List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
  ];

  InfoDetail selectedSegment = InfoDetail.info;

  ChartDataModel? chartDataModel;
  List<GraphModel?> chartData = [];
  final latitude = 0.0.obs;
  final longitude = 0.0.obs;
  final mapController = MapController();
  late Timer timer;

  @override
  Future<void> onInit() async {
    // await fetchChartFromAPI();
    timer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      await fetchChartFromAPI();
    });
    update();
    super.onInit();
  }

  Future<void> fetchChartFromAPI() async {
    try {
      final response =
          await repository.getChartData(nodes: nodeName!, limit: limit);
      chartDataModel = response;
      chartData = response?.data?.list
              ?.map((value) => GraphModel(
                  date: DateFormat('HH:mm').format(
                      DateFormat('yyyy-MM-dd HH:mm:dd')
                          .parse(value.createdAt ?? '1970-01-01 00:00:00')),
                  impendance: int.tryParse(value.impedance ?? '0')))
              .toList() ??
          [];
      latitude.value =
          num.parse(response?.data?.list?.first.latitude?.toString() ?? '0')
              .toDouble();
      longitude.value =
          num.parse(response?.data?.list?.first.longitude?.toString() ?? '0')
              .toDouble();
      debugPrint('Chart length: ${chartData.length}');
      update();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      update();
    }
  }

  List<FlSpot> getSpots() {
    return chartData
        .map((e) => FlSpot(chartData.indexOf(e).toDouble(),
        e!.impendance?.toDouble() ?? 0.0))
        .toList();
  }

  double getMinY() {
    if (chartData.isEmpty) {
      return 0;
    }
    double min = chartData.first?.impendance?.toDouble() ?? 0.0;
    for (final data in chartData) {
      if ((data?.impendance?.toDouble() ?? 0.0) < min) {
        min = data?.impendance?.toDouble() ?? 0.0;
      }
    }
    return min;
  }

  double getMaxY() {
    if (chartData.isEmpty) {
      return 10;
    }
    double max = chartData.first?.impendance?.toDouble() ?? 0.0;
    for (final data in chartData) {
      if ((data!.impendance?.toDouble() ?? 0) > max) {
        max = data.impendance?.toDouble() ?? 0.0;
      }
    }
    return max;
  }

  double getMinX() {
    if (chartData.isEmpty) {
      return 0;
    }
    DateTime min = DateFormat('HH:mm').parse(chartData.first?.date ?? '00:00');
    for (final data in chartData) {
      if (DateFormat('HH:mm').parse(data?.date ?? '00:00').isBefore(min)) {
        min = DateFormat('HH:mm').parse(data?.date ?? '00:00');
      }
    }
    return min.millisecondsSinceEpoch.toDouble();
  }

  double getMaxX() {
    if (chartData.isEmpty) {
      return 10;
    }
    DateTime max = DateFormat('HH:mm').parse(chartData.first?.date ?? '00:00');
    for (final data in chartData) {
      if (DateFormat('HH:mm').parse(data?.date ?? '00:00').isAfter(max)) {
        max = DateFormat('HH:mm').parse(data?.date ?? '00:00');
      }
    }
    return max.millisecondsSinceEpoch.toDouble();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void onReady() {
    fetchChartFromAPI();
    super.onReady();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
