import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../domain/meal_photo.dart';

class PhotoRedactionDialog extends StatefulWidget {
  const PhotoRedactionDialog({super.key, required this.photo});
  final MealPhoto photo;

  @override
  State<PhotoRedactionDialog> createState() => _PhotoRedactionDialogState();
}

class _PhotoRedactionDialogState extends State<PhotoRedactionDialog> {
  Offset? _start;
  Offset? _end;

  Offset _relative(Offset position, BoxConstraints box) => Offset(
    (position.dx / box.maxWidth).clamp(0.0, 1.0),
    (position.dy / box.maxHeight).clamp(0.0, 1.0),
  );

  @override
  Widget build(BuildContext context) {
    final rect = _start == null || _end == null
        ? null
        : Rect.fromPoints(_start!, _end!);
    return AlertDialog(
      title: AppText(context.tr(LocaleKeys.mealPhoto_redact)),
      content: SizedBox(
        width: 340,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(context.tr(LocaleKeys.mealPhoto_redactInstruction)),
              AspectRatio(
                aspectRatio: widget.photo.width / widget.photo.height,
                child: LayoutBuilder(
                  builder: (context, bounds) => GestureDetector(
                    onPanStart: (details) => setState(() {
                      _start = _relative(details.localPosition, bounds);
                      _end = _start;
                    }),
                    onPanUpdate: (details) => setState(() {
                      _end = _relative(details.localPosition, bounds);
                    }),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          File(widget.photo.localPath),
                          fit: BoxFit.fill,
                        ),
                        if (rect != null)
                          Positioned(
                            left: rect.left * bounds.maxWidth,
                            top: rect.top * bounds.maxHeight,
                            width: rect.width * bounds.maxWidth,
                            height: rect.height * bounds.maxHeight,
                            child: const ColoredBox(color: Colors.black),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: AppText(context.tr(LocaleKeys.common_cancel)),
        ),
        FilledButton(
          onPressed: rect == null || rect.width < 0.01 || rect.height < 0.01
              ? null
              : () => Navigator.pop(
                  context,
                  PhotoMask(rect.left, rect.top, rect.right, rect.bottom),
                ),
          child: AppText(context.tr(LocaleKeys.common_apply)),
        ),
      ],
    );
  }
}
