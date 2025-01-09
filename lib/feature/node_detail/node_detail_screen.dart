import 'package:flutter/material.dart';
import 'package:flutter_getx_template/data/model/chart_data_model.dart';
import 'package:flutter_getx_template/feature/node_detail/node_detail_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NodeDetailScreen extends StatelessWidget {
  const NodeDetailScreen({super.key, required this.data});

  final List2? data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NodeDetailController(data: data),
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xffF7F9FE),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 4,
                  spacing: 4,
                  children: [
                    SizedBox(
                      width: Get.width * 0.45,
                      child: Card(
                        color: const Color(0xffFCDCD3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                            color: Color(0x40000000)
                          )
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'Real',
                                style: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color: const Color(0xff212529)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.w),
                              decoration: BoxDecoration(
                                color: const Color(0x80FCF6F6),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: const Color(0xffBFBFBF)
                                )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                  child: Text(controller.real.value, style: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14.sp,
                                    color: const Color(0xff212529)
                                  ),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.45,
                      child: Card(
                        color: const Color(0xffD7D9FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(
                            color: Color(0x40000000)
                          )
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'Imaginer',
                                style: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color: const Color(0xff212529)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.w),
                              decoration: BoxDecoration(
                                color: const Color(0x80FCF6F6),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: const Color(0xffBFBFBF)
                                )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                  child: Text(controller.imaginer.value, style: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14.sp,
                                    color: const Color(0xff212529)
                                  ),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.45,
                      child: Card(
                        color: const Color(0xffD5ECE0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                                color: Color(0x40000000)
                            )
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'Latitude',
                                style: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color: const Color(0xff212529)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.w),
                              decoration: BoxDecoration(
                                  color: const Color(0x80FCF6F6),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: const Color(0xffBFBFBF)
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                  child: Text(controller.lat.value, style: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 11.5.sp,
                                      color: const Color(0xff212529)
                                  ),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.45,
                      child: Card(
                        color: const Color(0xffCAE2E4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(
                                color: Color(0x40000000)
                            )
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'Longitude',
                                style: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp,
                                    color: const Color(0xff212529)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.w),
                              decoration: BoxDecoration(
                                  color: const Color(0x80FCF6F6),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: const Color(0xffBFBFBF)
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                  child: Text(controller.lng.value, style: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 11.5.sp,
                                      color: const Color(0xff212529)
                                  ),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
