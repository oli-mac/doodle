import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTodo extends ConsumerStatefulWidget {
  const AddTodo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoState();
}

class _AddTodoState extends ConsumerState<AddTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Container(),
    );
  }
}
