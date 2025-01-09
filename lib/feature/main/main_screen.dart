import 'package:flutter/material.dart';
import 'package:flutter_getx_template/feature/details/nodes_screen.dart';
import 'package:flutter_getx_template/feature/main/main_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MainController(),
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xffF7F9FE),
        key: controller.mainKey,
        appBar: AppBar(
          // title: const Text('Smart Polutant Tracker'),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: ListTile(
                leading: SizedBox(
                    width: ScreenUtil.defaultSize.width * 0.2,
                    child: Image.asset('assets/images/img_twh.png')),
                title: Center(
                  child: Text(
                    'Water Monitoring',
                    style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 17.5.sp,
                        color: const Color(0xff2871AC)),
                    textAlign: TextAlign.center,
                  ),
                ),
                subtitle: Center(
                  child: Text(controller.listNodeModel?.data?.name ?? '-',
                      style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.5.sp,
                          color: const Color(0xff2871AC)),
                      textAlign: TextAlign.center),
                ),
                trailing: SizedBox(
                    width: ScreenUtil.defaultSize.width * 0.2,
                    child: Image.asset('assets/images/img_unpad.webp')),
              )),
        ),
        body: Column(
          children: [
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0x40000000)),
                  borderRadius: BorderRadius.circular(5)),
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  'Polutan Tracker',
                  style: GoogleFonts.interTight(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: const Color(0xff212529)),
                ),
                trailing: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff2196F3),
                          Color(0xff1343EF),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      Icons.download_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: controller.listNodeModel?.data?.list?.isNotEmpty ?? false,
              replacement: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: controller.listNodeModel?.data?.list?.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0x40000000)),
                      borderRadius: BorderRadius.circular(5)),
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    onTap: () {
                      Get.to<dynamic>(NodesScreen.new, arguments: {
                        'node_number': controller.listNodeModel?.data?.list?[index].node?.replaceAll('node', ''),
                        'node_name': controller.listNodeModel?.data?.list?[index].node,
                      });
                    },
                    leading: Image.asset('assets/icons/ic_node.png'),
                    title: Text(
                      'NODE ${controller.listNodeModel?.data?.list?[index].node?.replaceAll('node', '')}',
                      style: GoogleFonts.interTight(
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                          color: const Color(0xB2212529)),
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: controller.listNodeModel?.data?.list?[index].impedance.toString(),
                            style: GoogleFonts.interTight(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp,
                              color: const Color(0xff212529),
                            ),
                          ),
                          TextSpan(
                            text: ' Ohm',
                            style: GoogleFonts.interTight(
                              fontWeight: FontWeight.w700,
                              fontSize: 10.sp,
                              color: const Color(0xff212529),
                            ),
                          )
                        ],
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8),
          child: Text('Powered By: Universitas Padjadjaran',
              style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: const Color(0xff2871AC)),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
