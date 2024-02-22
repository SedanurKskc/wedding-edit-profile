import 'package:flutter/material.dart';
import 'package:wedding/core/base/state/base_state.dart';
import '../../../modules/plan/plan_model.dart';

class ParentItem extends BaseStateless {
  final String parent;
  final List<PlanModel> plans;
  final Function(PlanModel plan, bool? value) onPressed;

  ParentItem(this.parent, this.plans, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: sizes.s10),
        Text(parent, style: textTheme(context).headlineMedium?.copyWith(color: colorScheme(context).primary)),
        SizedBox(height: sizes.s4),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: plans.length,
          itemBuilder: (context, childIndex) => _checkItem(context, plans[childIndex]),
        ),
      ],
    );
  }

  Widget _checkItem(BuildContext context, PlanModel plan) {
    return Padding(
      padding: paddings.v(sizes.s4),
      child: CheckboxListTile(
        contentPadding: paddings.h(sizes.s10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(sizes.s8)),
        checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(sizes.s4)),
        tileColor: colorScheme(context).surface,
        activeColor: colorScheme(context).primary,
        value: plan.value,
        onChanged: (value) => onPressed(plan, value),
        title: Text(plan.header!, style: textTheme(context).titleMedium?.copyWith(color: colorScheme(context).onBackground)),
      ),
    );
  }
}
