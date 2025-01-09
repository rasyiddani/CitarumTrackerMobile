import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/core/base/base_controller.dart';
import 'package:flutter_getx_template/data/model/list_node_model.dart';

class MainController extends BaseController {
  final GlobalKey<ScaffoldState> mainKey = GlobalKey();

  ListNodeModel? listNodeModel;

  // final nodeName = ''.obs;
  // final nodesImpedance = <int?>[];
  // final nodesName = <String?>[];


  @override
  Future<void> onInit() async {
    try {
     final response = await repository.getListNodeData();
     listNodeModel = response;
     response?.data?.list?.map((value) {

     });
    } catch(e) {
      debugPrint(e.toString().replaceAll('Exception:', ''));
    } finally {
      update();
    }
    super.onInit();
  }
}