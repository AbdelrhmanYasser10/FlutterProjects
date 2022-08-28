import 'package:get/get.dart';
import '../../models/task_model/task_model.dart';
import '../../shared/database/database_helper.dart';
class TaskController extends GetxController{

  List<Task> taskList = <Task>[].obs;
  Future<int> addTask({required Task task})async{
    return await DBHelper.insert(task: task);
  }

  void getTasks() async{
    List<Map<String , dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((e) => Task.fromJson(e)));
  }

  Future<int> deleteTask({required int id}) async{
    int val =  await DBHelper.delete(id: id);
    getTasks();
    return val;
  }

  Future<int> updateTask({required int id}) async{
    int val = await DBHelper.update(id: id);
    getTasks();
    return val;
  }
}