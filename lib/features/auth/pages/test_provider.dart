import 'package:doodle/common/utils/constants.dart';
import 'package:doodle/common/widgets/appstyle.dart';
import 'package:doodle/common/widgets/reusable_text.dart';
import 'package:doodle/features/auth/controllers/code_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Test extends ConsumerWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String code = ref.watch(codeStateProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          ReusableText(
              text: code,
              style: appstyle(38, AppConstants.appLight, FontWeight.bold)),
          TextButton(
              onPressed: () {
                ref.read(codeStateProvider.notifier).setStart('Debussy');
              },
              child: const Text('press me')),
        ],
      )),
    );
  }
}
