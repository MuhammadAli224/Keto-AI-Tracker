import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/jod.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../../nutrition/nutrition_barrel.dart';
import '../../domain/budget.dart';
import '../cubit/budget/budget_cubit.dart';
import 'budget_text_dialog.dart';
import 'budget_money.dart';

class BudgetPricesTab extends StatelessWidget {
  const BudgetPricesTab({super.key, required this.prices});

  final List<FoodPrice> prices;

  @override
  Widget build(BuildContext context) {
    final catalog = context.watch<CatalogCubit>().state;
    final cubit = context.watch<BudgetCubit>();
    if (catalog is CatalogLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (catalog is! CatalogReady) {
      return Center(
        child: TextButton(
          onPressed: context.read<CatalogCubit>().load,
          child: AppText(context.tr(LocaleKeys.common_retry)),
        ),
      );
    }
    final costs = {for (final price in prices) price.foodId: price.filsPer100g};
    final foods = catalog.foods.toList()
      ..sort((a, b) {
        final aPrice = costs[a.id];
        final bPrice = costs[b.id];
        if (aPrice == null) {
          return bPrice == null ? a.name.compareTo(b.name) : 1;
        }
        if (bPrice == null) return -1;
        return aPrice.compareTo(bPrice);
      });
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        AppText(context.tr(LocaleKeys.budget_pricesHelp)),
        for (final food in foods)
          ListTile(
            title: AppText(foodDisplayName(context, food)),
            subtitle: AppText(
              costs[food.id] == null
                  ? context.tr(LocaleKeys.nutrition_unknown)
                  : context.tr(
                      LocaleKeys.budget_priced,
                      args: [formatBudgetMoney(context, costs[food.id]!)],
                    ),
            ),
            trailing: const Icon(Icons.edit_outlined),
            onTap: cubit.state.busy
                ? null
                : () async {
                    final cost = costs[food.id];
                    final result = await showDialog<String>(
                      context: context,
                      builder: (context) => BudgetTextDialog(
                        title: foodDisplayName(context, food),
                        initial: cost == null ? '' : jodDecimal(cost),
                        isPrice: true,
                      ),
                    );
                    if (context.mounted && result != null) {
                      await cubit.savePrice(food.id, parseJodFils(result));
                    }
                  },
          ),
      ],
    );
  }
}
