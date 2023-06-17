import 'package:flutter/material.dart';
import './task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> origintasks = [
    TaskModel(title: 'Flutter'),
    TaskModel(title: 'API'),
    TaskModel(title: 'PROVIDER'),
    TaskModel(title: 'HTTP', subTitle: "SUB http"),
  ];

  var tasks;
  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final subTitle = TextEditingController();

    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Task"))),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        width: 50,
                        height: 300,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              TextField(
                                controller: title,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: subTitle,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      setState(() {
                                        tasks.add(TaskModel(
                                            title: title.text,
                                            subTitle: subTitle.text));
                                        Navigator.pop(context);
                                      });
                                    },
                                    color: Colors.green,
                                    child: const Row(
                                      children: [
                                        Text(
                                          'ADD',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(Icons.add)
                                      ],
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    color: Colors.green,
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }),
        body: DefaultTabController(
            length: 2,
            child: Column(children: [
              const TabBar(
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: 'Done',
                    ),
                    Tab(
                      text: 'WAITING',
                    ),
                  ]),
              Expanded(
                  child: TabBarView(children: [
                ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return tasks[index].isDone == true
                          ? ListTile(
                              title: Text(tasks[index].title),
                              subtitle: Text(tasks[index].subTitle ?? ''),
                              trailing: Checkbox(
                                  value: tasks[index].isDone,
                                  onChanged: (value) {
                                    setState(() {
                                      tasks[index].isDone =
                                          !tasks[index].isDone;
                                    });

                                    showAlertDialog(BuildContext context) {
                                      Widget DelteteButton = TextButton(
                                        child: Text("Delete"),
                                        onPressed: () {},
                                      );
                                      Widget continueButton = TextButton(
                                        child: Text("Continue"),
                                        onPressed: () {},
                                      );
                                      AlertDialog alert = AlertDialog(
                                        title: Text("AlertDialog"),
                                        content: Text(
                                            "are you sure you want to delete this task ?"),
                                        actions: [
                                          DelteteButton,
                                          continueButton,
                                        ],
                                      );
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return alert;
                                        },
                                      );
                                    }
                                  }),
                            )
                          : Container();
                    }),

                ///
                ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return tasks[index].isDone == false
                          ? ListTile(
                              title: Text(tasks[index].title),
                              subtitle: Text(tasks[index].subTitle ?? ''),
                              trailing: Checkbox(
                                  value: tasks[index].isDone,
                                  onChanged: (value) {
                                    setState(() {
                                      tasks[index].isDone =
                                          !tasks[index].isDone;
                                    });
                                  }),
                            )
                          : Container();
                    }),
              ]))
            ])));
  }
}
