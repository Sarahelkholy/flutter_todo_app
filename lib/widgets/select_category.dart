import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:todolist/utils/Task_category.dart';
import 'package:todolist/utils/extentions.dart';
import 'package:gap/gap.dart';
import 'package:todolist/widgets/circle_container.dart';
import 'package:todolist/provider/categoryProvider.dart';

class SelectCategory extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedcategory = ref.watch(categoryProvider);
    final category = TaskCategories.values.toList();
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            'Category ',
            style: context.textTheme.titleLarge,
          ),
          Gap(10),
          Expanded(
            child: ListView.separated(
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  final categories = category[index];
                  return InkWell(
                    onTap: () {
                      ref.read(categoryProvider.notifier).state = categories;
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: CircleContainer(
                        color: categories.color.withOpacity(0.3),
                        child: Icon(
                          categories.icon,
                          color: categories == selectedcategory
                              ? context.colorScheme.primary
                              : categories.color,
                        )),
                  );
                },
                separatorBuilder: (ctx, index) => const Gap(8),
                itemCount: category.length),
          )
        ],
      ),
    );
  }
}
