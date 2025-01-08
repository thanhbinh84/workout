import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout/core/model/exercise.dart';
import 'package:workout/core/util/text_styles.dart';
import 'package:workout/core/widget/base_screen.dart';
import 'package:workout/exercise/exercise_controller.dart';

class ExerciseScreen extends GetView<ExerciseController> {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        title: 'Exercise',
        controller: controller,
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_exerciseView],
          ),
        ));
  }

  get _exerciseView {
    return Obx(() {
      Exercise exercise = controller.exercise.value;
      return RichText(
          text: TextSpan(
              text: 'Training Plan | ${exercise.name}\n\n',
              style: TextStyles.headline,
              children: [
            const TextSpan(text: 'Sets: ', style: TextStyles.body),
            TextSpan(text: '${exercise.sets}\n\n', style: TextStyles.bodyBold),
            const TextSpan(text: 'Weight: ', style: TextStyles.body),
            TextSpan(text: '${exercise.weight}', style: TextStyles.bodyBold),
            const TextSpan(
                text: '\n\n-----------------------\n\nPlease choose one of exercises below:\n\n',
                style: TextStyles.body),
          ]));
    });
  }
}
