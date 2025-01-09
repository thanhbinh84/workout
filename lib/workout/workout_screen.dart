import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout/core/util/text_styles.dart';
import 'package:workout/core/widget/base_screen.dart';
import 'package:workout/workout/workout_controller.dart';

class WorkoutScreen extends GetView<WorkoutController> {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        title: 'Set ${controller.workout.value.setDisplay}',
        controller: controller,
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_weightInputView, _repsInputView, _oneRepMaxView, _breakButton],
          ),
        ));
  }

  get _weightInputView => TextFormField(
        initialValue: controller.workout.value.weight.toString(),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Weight',
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) => controller.updateWeightRepsValue(weight: value),
      );

  get _repsInputView => Padding(
    padding: const EdgeInsets.only(top: 20),
    child: TextFormField(
      initialValue: controller.workout.value.reps.toString(),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Repetitions',
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) => controller.updateWeightRepsValue(reps: value),
    ),
  );

  get _oneRepMaxView {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: RichText(
            text: TextSpan(text: 'Estimated 1-Rep Max: ', style: TextStyles.body, children: [
          TextSpan(text: '${controller.workout.value.oneRepMax}', style: TextStyles.body),
        ])),
      );
    });
  }

  get _breakButton => Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: ElevatedButton(onPressed: () => print('ok'), child: const Text('Break now')),
      );
}
