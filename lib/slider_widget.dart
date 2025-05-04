import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/app_colors.dart';

class SliderWidget extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;

  const SliderWidget({super.key, required this.value, required this.onChanged, required this.min, required this.max});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${min.toInt()}", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                Expanded(child: Slider(
                  value: value, 
                  onChanged: onChanged, 
                  min:min,
                  max: max, 
                  activeColor: AppColors.primaryColor,)),
                Text("${max.toInt()}", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              ],
            );
  }
}