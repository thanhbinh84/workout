import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout/core/model/plan.dart';
import 'package:workout/core/util/text_styles.dart';
import 'package:workout/core/util/utils.dart';
import 'package:workout/core/widget/base_screen.dart';
import 'package:workout/dashboard/dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        title: 'Dashboard',
        controller: controller,
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_planView, _exercisesView(context)],
          ),
        ));
  }

  get _planView {
    return Obx(() {
      Plan plan = controller.plan.value;
      return RichText(
          text: TextSpan(
              text: 'Training Plan | ${plan.name}\n\n',
              style: TextStyles.headline,
              children: [
            const TextSpan(text: 'Duration: ', style: TextStyles.body),
            TextSpan(text: '${plan.duration}\n\n', style: TextStyles.bodyBold),
            const TextSpan(text: 'Category: ', style: TextStyles.body),
            TextSpan(text: plan.category, style: TextStyles.bodyBold),
            const TextSpan(
                text: '\n\n-----------------------\n\nPlease choose one of exercises below:\n\n',
                style: TextStyles.body),
          ]));
    });
  }

  Widget _exercisesView(BuildContext context) {
    return Obx(() {
      final exercises = controller.plan.value.exercises;
      return Expanded(
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: exercises.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('Exercise ${exercises[index].name}'),
              onTap: () => Utils.toast('selected'),
            );
          },

          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      );
    });
  }
}
