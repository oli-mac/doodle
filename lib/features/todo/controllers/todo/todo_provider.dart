import 'package:doodle/common/helper/db_helper.dart';
import 'package:doodle/common/models/task_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState {
  @override
  List<TaskModel> build() {
    return [];
  }

  void refresh() async {
    final data = await DbHelper.getItems();

    state = data.map((e) => TaskModel.fromJson(e)).toList();
  }

  void addItem(TaskModel task) async {
    await DbHelper.createItems(task);

    refresh();
  }

  void updateItem(int id, String title, String description, String date,
      String startTime, String endTime, int reminder, int isComplted) async {
    await DbHelper.updateItem(
        id, title, description, date, startTime, endTime, reminder, isComplted);

    refresh();
  }

  Future<void> deleteItem(int id) async {
    await DbHelper.deleteItem(id);

    refresh();
  }

  void markAsComplete(int id, String title, String description, String date,
      String startTime, String endTime, int reminder, int isComplted) async {
    await DbHelper.updateItem(
        id, title, description, date, startTime, endTime, reminder, 1);

    refresh();
  }

  //! get today
  String getToday() {
    DateTime today = DateTime.now();

    return today.toString().substring(0, 10);
  }

  //! get tomorrow
  String getTomorrow() {
    DateTime today = DateTime.now();
    DateTime tomorrow = today.add(const Duration(days: 1));

    return tomorrow.toString().substring(0, 10);
  }

  //! GET THE last 30 days
  List<String> getLast30Days() {
    DateTime today = DateTime.now();
    DateTime oneMonthAgo = today.subtract(const Duration(days: 30));

    List<String> last30Days = [];

    for (int i = 0; i < 30; i++) {
      DateTime day = oneMonthAgo.add(Duration(days: i));
      last30Days.add(day.toString().substring(0, 10));
    }

    return last30Days;
  }

  bool getStatus(TaskModel task) {
    bool? isCompleted;

    if (task.isComplited == 0) {
      isCompleted = false;
    } else {
      isCompleted = true;
    }

    return isCompleted;
  }
}
