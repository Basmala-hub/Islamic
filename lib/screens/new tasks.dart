import 'package:flutter/material.dart';

import '../database task.dart';
import '../models/task model.dart';

class NewTasks extends StatefulWidget {
  const NewTasks({super.key});

  @override
  State<NewTasks> createState() => _NewTasksState();
}

class _NewTasksState extends State<NewTasks> {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    createDatabase().then((_) async {
      print("Database is ready!");
      List<TaskModel> loadedTasks = await getDataBase();
      setState(() {
        tasks = loadedTasks;
      });
    });
  }

  List<TaskModel> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5E6C5),
        appBar: AppBar(
          title: Text(
            "المهام اليومية",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFB87333),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF6D4C41),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            controller: textEditingController1,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Title",
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            controller: textEditingController2,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Describtion",
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        MaterialButton(
                          child: Text("حفظ"),
                          color: Colors.white,
                          onPressed: () async {
                            await insertDataBase(
                              title: textEditingController1.text,
                              describtion: textEditingController2.text,
                            );

                            List<TaskModel> updatedTasks = await getDataBase();
                            setState(() {
                              tasks = updatedTasks;
                            });

                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.add, color: Colors.white, size: 30),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              color: Color(0xFFD7CCC8),
              child: ListTile(
                title: Text(textAlign: TextAlign.right, tasks[index].title),
                subtitle:
                    Text(textAlign: TextAlign.right, tasks[index].describtion),
                leading: IconButton(
                  onPressed: () async {
                    int taskId = tasks[index].id;

                    await deleteTask(id: taskId);

                    List<TaskModel> updatedTasks = await getDataBase();
                    setState(() {
                      tasks = updatedTasks;
                    });
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
              ),
            );
          },
          itemCount: tasks.length,
        ));
  }
}
