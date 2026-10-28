import 'package:hive_ce/hive_ce.dart';
import 'package:taskati/core/models/taskModel.dart';
@GenerateAdapters([AdapterSpec<TaskModel>()])
part 'hive_adapters.g.dart';
