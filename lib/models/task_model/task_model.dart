class Task{
  int? id;
  late String title;
  late String note;
  late int isCompleted;
  late String date;
  late String startTime;
  late String endTime;
  late int color;
  late int remind;
  late String repeat;

  Task({
   this.id,
  required this.title,
  required this.color,
  required this.date,
  required this.endTime,
  required this.isCompleted,
  required this.note,
  required this.remind,
  required this.repeat,
  required this.startTime
  });

  Task.fromJson(Map<String,dynamic>json){
    id = json['id'];
    title = json['title'];
    note = json['note'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    color = json['color'];
    remind = json['remind'];
    repeat = json['repeat'];
  }

  Map<String,dynamic> toJson()=>{
    'id':id,
    'title':title,
    'note':note,
    'isCompleted':isCompleted,
    'date':date,
    'startTime':startTime,
    'endTime':endTime,
    'color':color,
    'remind':remind,
    'repeat':repeat,
  };

}