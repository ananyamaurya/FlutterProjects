import 'package:mark_it/Widgets/tasktile.dart';

List<String> kTasklist = ['Add Some Task'];
List<bool> kTaskStatus = [false];

List<TaskTile> kTaskListGenerate() {
  List<TaskTile> listTask = [];
  int i = 0;
  if (kTasklist == null) {
    listTask.add(TaskTile(
        task: 'Add Some Task',
        status: false,
      ));
  } else {
    for (var textTask in kTasklist) {
      listTask.add(TaskTile(
        task: textTask,
        status: kTaskStatus[i],
      ));
      i++;
    }
  }
  return listTask;
}

Future<bool> kTaskAdd(String t) async {
  print(t);
  kTasklist.add(t);
  kTaskStatus.add(false);
  return true;
}

kUpdateList(String t){
  int i =0;
  for (String task in kTasklist) {
    if(task == t ){
      print(kTaskStatus[i]);
      kTaskStatus[i] = !kTaskStatus[i]; 
      print(kTaskStatus[i]);
    }
    i++;
  }
}
