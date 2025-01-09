import 'package:flutter_getx_template/core/core/base/base_controller.dart';
import 'package:flutter_getx_template/data/model/chart_data_model.dart';
import 'package:get/get.dart';

class NodeDetailController extends BaseController {
  NodeDetailController({required this.data});

  final List2? data;

  final real = 'Loading...'.obs;
  final imaginer = 'Loading...'.obs;
  final magnitude = 'Loading...'.obs;
  final phase = 'Loading...'.obs;
  final rssi = 'Loading...'.obs;
  final snr = 'Loading...'.obs;
  final lat = 'Loading...'.obs;
  final lng = 'Loading...'.obs;

  @override
  Future<void> onInit() async {
    real.value = data?.real ?? '-';
    imaginer.value = data?.imaginer ?? '-';
    magnitude.value = data?.magnitude ?? '-';
    lat.value = data?.latitude ?? '-';
    lng.value = data?.longitude ?? '-';
    update();
    super.onInit();
  }


}
