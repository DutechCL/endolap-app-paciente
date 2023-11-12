import 'package:endolap_paciente_app/src/controllers/NotificationController.dart';
import 'package:endolap_paciente_app/src/models/notification_model.dart';
import 'package:endolap_paciente_app/src/widgets/notifications/notification_item_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_skeleton/loader_skeleton.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';

class NotificationListWidget extends StatelessWidget {
  final NotificationController controller;
  final List<NotificationModel> list;
  const NotificationListWidget({super.key, required this.controller, required this.list});

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator.adaptive(
      onRefresh: () => controller.fetchNotificationList(),
      child: Obx(() {
          if (controller.isLoading.value) {
            return _shimmerList();
          }

          if (controller.notifications.value.isNotEmpty) {
            return _buildList(list);
          }else{
            return Center(
              child: Lottie.asset('assets/images/noDataNotifications.json'),
            );
          }
        }
      ),
    );
  }

  _shimmerList(){
    return CardListSkeleton(
      isCircularImage: true,
      isBottomLinesActive: true,
      length: 10,
    );
  }

  _buildList(List<NotificationModel> list){
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
                child: Obx(
                  () => NotificationItemListWidget(
                    notification: list[i],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}