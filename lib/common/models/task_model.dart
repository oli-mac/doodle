import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
  int? id;
  String? title;
  String? disc;
  String? isComplited;
  String? date;
  String? startTime;
  String? endTime;
  int? remined;
  String? repeat;

  TaskModel({
    this.id,
    this.title,
    this.disc,
    this.isComplited,
    this.date,
    this.startTime,
    this.endTime,
    this.remined,
    this.repeat,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        disc: json["disc"],
        isComplited: json["isComplited"],
        date: json["date"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        remined: json["remined"],
        repeat: json["repeat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "disc": disc,
        "isComplited": isComplited,
        "date": date,
        "startTime": startTime,
        "endTime": endTime,
        "remined": remined,
        "repeat": repeat,
      };
}
