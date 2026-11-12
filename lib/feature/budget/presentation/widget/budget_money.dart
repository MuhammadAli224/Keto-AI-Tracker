import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

String formatBudgetMoney(BuildContext context, int fils) =>
    NumberFormat.simpleCurrency(
      name: 'JOD',
      locale: context.locale.toString(),
      decimalDigits: 3,
    ).format(fils / 1000);
