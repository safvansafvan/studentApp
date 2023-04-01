import 'package:flutter/material.dart';

snackBarWidget({required ctx, required title, required Color clr}) {
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      width: 200,
      backgroundColor: clr,
      behavior: SnackBarBehavior.floating,
      content: Center(child: Text(title)),
    ),
  );
}
