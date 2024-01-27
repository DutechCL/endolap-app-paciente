import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:endolap_paciente_app/src/controllers/ProcedureListController.dart';
import 'package:endolap_paciente_app/src/widgets/procedures/procedure_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProcedureScreen extends StatelessWidget {
  ProcedureScreen({super.key});
  final ProcedureListController controller = Get.put(ProcedureListController());

  @override
  Widget build(BuildContext context) {
    controller.fetchProcedureList();

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Mis procedimientos'),
            ),
            body: DefaultTabController(
                length: 2,
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: SegmentedTabControl(
                        indicatorColor: Color(0xff00d6d6),
                        backgroundColor: Color(0xfff5f5f5),
                        tabTextColor: Color(0xff777777),
                        tabs: [
                          SegmentTab(
                            label: 'Pendientes',
                          ),
                          SegmentTab(
                            label: 'Realizados',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          ProcedureListWidget(
                              controller: controller,
                              list: controller.procedureList.value
                                  .where((element) =>
                                      element.status == 'complete' ||
                                      element.status == 'incomplete')
                                  .toList()),
                          ProcedureListWidget(
                              controller: controller,
                              list: controller.procedureList.value
                                  .where((element) =>
                                      element.status == 'done' ||
                                      element.status == 'cancelled')
                                  .toList()),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
