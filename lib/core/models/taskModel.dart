import 'package:hive_ce/hive_ce.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  // 👈 ضروري جداً إضافة extends HiveObject هنا
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? date;

  @HiveField(4)
  String? startTime;

  @HiveField(5)
  String? endTime;

  @HiveField(6)
  bool? isCompleted;

  TaskModel({
    this.id,
    this.title,
    this.description,
    this.date,
    this.startTime,
    this.endTime,
    this.isCompleted,
  });
  TaskModel copywith({
    String? id,

    String? title,

    String? description,
    String? date,

    String? startTime,
    String? endTime,

    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
