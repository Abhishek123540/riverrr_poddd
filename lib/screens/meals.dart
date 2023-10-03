import 'package:flutter/material.dart';
import 'package:riverrr_poddd/screens/meal_details.dart';
import 'package:riverrr_poddd/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;

  void selectMeal(Meal meal, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget cont = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      cont = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (con, i) => MealItem(
          meal: meals[i],
          onSelectMeal: (meal) {
            selectMeal(meal, context);
          },
        ),
      );
    }
    if (title == null) {
      return cont;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: cont,
    );
  }
}
