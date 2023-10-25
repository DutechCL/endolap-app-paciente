import 'package:endolap_coordinador_app/src/controllers/ProcedureListController.dart';
import 'package:endolap_coordinador_app/src/models/procedure_list_model.dart';
import 'package:endolap_coordinador_app/src/widgets/procedures/procedure_item_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProcedureListWidget extends StatelessWidget {
  final ProcedureListController controller;
  const ProcedureListWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    var list = controller.procedureList.value;

    return RefreshIndicator.adaptive(
      onRefresh: () => controller.fetchProcedureList(),
      child: Obx(() => controller.isLoading.value ? 
        _shimmerList() : 
        _buildList(list)),
    );
  }

  _shimmerList(){
    return CardListSkeleton(
      isCircularImage: true,
      isBottomLinesActive: true,
      length: 10,
    );
  }

  _buildList(List<ProcedureModel> list){
    return AnimationLimiter(
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: list.length,
        itemBuilder: (context, i) {
          return AnimationConfiguration.staggeredList(
            position: i,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: ProcedureItemListWidget(procedure: list[i]),
              )
            ),
          );
        },
      ),
    );
  }
}