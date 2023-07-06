// flutter pub run build_runner watch --delete-conflicting-outputs
//git add .
// git commit -m ""
// git push
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/presentation/app_widget.dart';

void main() => runApp(
      ProviderScope(
        child: AppWidget(),
      ),
    );
