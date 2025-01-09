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
        title: controller.exercise.value.name,
        controller: controller,
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_exerciseView, _startButton],
          ),
        ));
  }

  get _exerciseView {
    return Obx(() {
      Exercise exercise = controller.exercise.value;
      return RichText(
          text: TextSpan(text: 'Exercise Details \n\n', style: TextStyles.headline, children: [
        const TextSpan(text: 'Sets: ', style: TextStyles.body),
        TextSpan(text: '${exercise.sets}\n\n', style: TextStyles.bodyBold),
        const TextSpan(text: 'Weight: ', style: TextStyles.body),
        TextSpan(text: '${exercise.weight}\n\n', style: TextStyles.bodyBold),
        const TextSpan(text: 'Reps: ', style: TextStyles.body),
        TextSpan(text: '${exercise.reps}\n\n', style: TextStyles.bodyBold),
        const TextSpan(text: 'Break: ', style: TextStyles.body),
        TextSpan(text: '${exercise.breakSecond}', style: TextStyles.bodyBold),
      ]));
    });
  }

  get _startButton => Container(
    padding: const EdgeInsets.all(20),
    alignment: Alignment.center,
    child: ElevatedButton(onPressed: () => controller.startWorkout(), child: const Text('Start now')),
  );
}
