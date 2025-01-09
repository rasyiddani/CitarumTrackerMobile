import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/feature/details/nodes_controller.dart';
import 'package:flutter_getx_template/feature/node_detail/node_detail_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class NodesScreen extends StatefulWidget {
  const NodesScreen({super.key});

  @override
  State<NodesScreen> createState() => _NodesScreenState();
}

class _NodesScreenState extends State<NodesScreen> {
  late final NodesController controller = Get.find<NodesController>();

  @override
  void initState() {
    super.initState();
    Get.put<NodesController>(NodesController());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: const Color(0xffF7F9FE),
          appBar: AppBar(
            title: Text(
              'Node ${controller.nodeNumber}',
              style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: const Color(0xff212529)),
            ),
            backgroundColor: const Color(0xffF7F9FE),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(56.h),
              child: SizedBox(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: CupertinoSlidingSegmentedControl<InfoDetail>(
                    backgroundColor: const Color(0xffEAECF0),
                    thumbColor:
                        controller.segmentedColors[controller.selectedSegment]!,
                    groupValue: controller.selectedSegment,
                    onValueChanged: (InfoDetail? value) {
                      if (value != null) {
                        setState(() {
                          controller.selectedSegment = value;
                        });
                        controller.update();
                      }
                    },
                    children: <InfoDetail, Widget>{
                      InfoDetail.info: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Text(
                          'Info',
                          style: GoogleFonts.interTight(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: const Color(0xff6B73FF)),
                        ),
                      ),
                      InfoDetail.detail: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Detail',
                          style: GoogleFonts.interTight(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: const Color(0xff6B73FF)),
                        ),
                      ),
                    },
                  ),
                ),
              ),
            ),
          ),
          body: controller.selectedSegment == InfoDetail.info
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(color: Color(0x40000000))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'IMPEDANCE',
                                  style: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      color: const Color(0xff212529)),
                                ),
                              ),
                              ListTile(
                                title: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffF7F7F7),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: const Color(0xffBFBFBF))),
                                  child: Center(
                                    child: Text(
                                      controller.chartDataModel?.data?.list?.first
                                              .impedance
                                              ?.toString() ??
                                          '-',
                                      style: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 24.sp,
                                          color: const Color(0xff212529)),
                                    ),
                                  ),
                                ),
                                trailing: Text(
                                  'Ohm',
                                  style: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13.sp,
                                      color: const Color(0xB2212529)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(color: Color(0x40000000))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'SENSOR NODE ${controller.nodeNumber}',
                                  style: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      color: const Color(0xff212529)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: RepaintBoundary(
                                  child: Visibility(
                                    visible: controller.chartData.isNotEmpty,
                                    replacement: const Center(
                                      child:
                                          CircularProgressIndicator.adaptive(),
                                    ),
                                    child: SizedBox(
                                      height: 200.h,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: LineChart(LineChartData(
                                          maxY: (controller.chartDataModel?.data?.max
                                                  ?.toDouble() ?? 1) +1,
                                          minY: (controller.chartDataModel?.data?.min
                                              ?.toDouble() ?? 0) != 0 ? (controller.chartDataModel?.data?.min
                                                  ?.toDouble() ?? 1) -1 : (controller.chartDataModel?.data?.min
                                              ?.toDouble() ?? 0),
                                          gridData: FlGridData(
                                            getDrawingHorizontalLine: (value) =>
                                                const FlLine(
                                              color: Color(0xffE4E5EB),
                                              strokeWidth: 1,
                                            ),
                                            getDrawingVerticalLine: (value) =>
                                                const FlLine(
                                              color: Color(0xffE4E5EB),
                                              strokeWidth: 1,
                                            ),
                                          ),
                                          titlesData: FlTitlesData(
                                            topTitles: const AxisTitles(),
                                            rightTitles: const AxisTitles(),
                                            bottomTitles: AxisTitles(
                                              sideTitles: SideTitles(
                                                showTitles: true,
                                                getTitlesWidget: (value, meta) =>
                                                    Text(
                                                  controller
                                                          .chartData[controller
                                                                  .chartData
                                                                  .length -
                                                              1]
                                                          ?.date
                                                          .toString() ??
                                                      '-',
                                                  style: GoogleFonts.interTight(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 10.sp,
                                                      color: const Color(
                                                          0xff6B73FF)),
                                                ),
                                                reservedSize: 32.w,
                                                interval: 2,
                                              ),
                                            ),
                                            leftTitles: AxisTitles(
                                                sideTitles: SideTitles(
                                              showTitles: true,
                                              getTitlesWidget: (value, meta) =>
                                                  Text(
                                                value
                                                    .toString()
                                                    .replaceAll('.0', ''),
                                                style: GoogleFonts.interTight(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10.sp,
                                                    color:
                                                        const Color(0xff6B73FF)),
                                              ),
                                              reservedSize: 32.w,
                                              interval: 1,
                                            )),
                                          ),
                                          lineBarsData: [
                                            LineChartBarData(
                                              spots: controller.getSpots(),
                                              isCurved: true,
                                              color: const Color(0xff6B73FF),
                                              curveSmoothness: 0.33,
                                              belowBarData: BarAreaData(
                                                  spotsLine: BarAreaSpotsLine(
                                                checkToShowSpotLine: (spot) =>
                                                    spot.y > 0,
                                              )),
                                            )
                                          ],
                                        )),
                                      ),
                                    ),


                                    // child: SfCartesianChart(
                                    //   primaryXAxis: const DateTimeAxis(),
                                    //   series: [
                                    //     SplineSeries<GraphModel?, DateTime>(
                                    //       dataSource: controller.chartData,
                                    //       xValueMapper: (graphModel, _) =>
                                    //           DateFormat('HH:mm')
                                    //               .parse(graphModel?.date.toString() ?? '00:00'),
                                    //       dataLabelSettings: DataLabelSettings(
                                    //           isVisible: true,
                                    //           overflowMode: OverflowMode.shift,
                                    //           useSeriesColor: true,
                                    //           connectorLineSettings: const ConnectorLineSettings(
                                    //                   type: ConnectorType.curve, length: '20%'),
                                    //           labelPosition:
                                    //               ChartDataLabelPosition.outside,
                                    //           builder: (dynamic data,
                                    //               dynamic point,
                                    //               dynamic series,
                                    //               int pointIndex,
                                    //               int seriesIndex) {
                                    //             // debugPrint('point index $pointIndex');
                                    //             // debugPrint('chart last ${controller.chartData.last == data}');
                                    //             if (controller.chartData.last == data) {
                                    //               return FutureBuilder(
                                    //                 future: Future<void>.delayed(const Duration(milliseconds: 100)),
                                    //                 builder: (_, __) {
                                    //                   return Container(
                                    //                     padding: const EdgeInsets.all(4),
                                    //                     decoration: BoxDecoration(
                                    //                       color: Colors.blue,
                                    //                       borderRadius:
                                    //                           BorderRadius.circular(4),
                                    //                     ),
                                    //                     child: Text(
                                    //                       data.impendance.toString(),
                                    //                       style: const TextStyle(
                                    //                           color: Colors.white),
                                    //                     ),
                                    //                   );
                                    //                 }
                                    //               );
                                    //             } else {
                                    //               return Text(
                                    //                 data.impendance.toString(),
                                    //                 style: const TextStyle(
                                    //                     color: Colors.blue),
                                    //               );
                                    //             }
                                    //           }),
                                    //       isVisibleInLegend: false,
                                    //       splineType: SplineType.cardinal,
                                    //       animationDuration: 2000,
                                    //       markerSettings: const MarkerSettings(isVisible: true),
                                    //       onRendererCreated: (chartController) {
                                    //         controller.chartSeriesController = chartController;
                                    //         controller.chartSeriesController?.animate();
                                    //       },
                                    //       yValueMapper: (graphModel, _) =>
                                    //           graphModel?.impendance,
                                    //     )
                                    //   ],
                                    // ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(color: Color(0x40000000))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  'LOKASI NODE ${controller.nodeNumber}',
                                  style: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.sp,
                                      color: const Color(0xff212529)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: SizedBox(
                                  height: 400,
                                  child: FlutterMap(
                                    mapController: controller.mapController,
                                    options: MapOptions(
                                      initialCenter: LatLng(
                                          controller.latitude.value,
                                          controller.longitude.value),
                                      // Center the map over London
                                      initialZoom: 9.2,
                                    ),
                                    children: [
                                      TileLayer(
                                        // Display map tiles from any source
                                        urlTemplate:
                                            'https://cartodb-basemaps-{s}.global.ssl.fastly.net/rastertiles/voyager/{z}/{x}/{y}.png',
                                        subdomains: const ['a', 'b', 'c', 'd'],
                                        userAgentPackageName:
                                            'com.unpad.smartpolutant',
                                        // And many more recommended properties!
                                      ),
                                      MarkerLayer(markers: [
                                        Marker(
                                            point: LatLng(
                                                controller.latitude.value,
                                                controller.longitude.value),
                                            child: const Icon(
                                              Icons.location_on,
                                              color: Colors.red,
                                            ))
                                      ]),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : NodeDetailScreen(
                  data: controller.chartDataModel?.data?.list?.last,
                ),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
