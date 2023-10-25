import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'jason_file.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Todo> todolist = [];
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  //to the text field
  TextEditingController todoContoller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BottomSheet(
                      onClosing: () {},
                      builder: (context) {
                        return SizedBox(
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                ("Add a task "),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                              //Text field here
                              TextField(
                                controller: todoContoller,
                                decoration: InputDecoration(
                                  hintText: "Write the task name here",
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.black),
                                  ),
                                ),
                              ),

                              ElevatedButton(
                                  onPressed: () {
                                    //when i press the button i want the message to be
                                    //sent to the jason snd sasved with the other messages.
                                    //controller:todocontroller=>to send data
                                    setData();
                                  },
                                  child: Text("Add"))
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
              icon: Icon(Icons.mark_unread_chat_alt_outlined))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Todo").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final List<dynamic> todos = snapshot.data!.docs;
            return todos.length == 0
                ? Center(child: Text("No Tasks",style: TextStyle(fontSize: 30),))
                : ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(todos[index]["title"]),
                            leading: IconButton(
                              onPressed: () {
                                //deleteData(todolist[index].id);
                                FirebaseFirestore.instance
                                    .collection("Todo")
                                    .doc(todos[index].id).update({"isCompleted":!todos[index]["isCompleted"]});
                              },
                              icon: Icon(
                                Icons.circle,
                                color: todos[index]["isCompleted"]
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection("Todo")
                                    .doc(todos[index].id)
                                    .delete();
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        ],
                      );
                    },
                  );
          }else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  void getData() async {
    http.Response response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/todos/"));
    todolist = todoFromJson(response.body);
    loading = false;
    setState(() {
      http.post(Uri.parse("https://jsonplaceholder.typicode.com/todos/")
          // ,body:
          );
    });
  }

/*
  void deleteData(int id) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Column(
                children: [
                  Text("Are you sure that you want to delete it ?"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("cancle"),
                          )),
                      TextButton(
                        onPressed: () async {
                          http.Response response = await http.delete(
                            Uri.parse(
                                "https://jsonplaceholder.typicode.com/todos/$id"),
                          );
                          if (response.statusCode == 204)
                            Navigator.pop(context);
                          else
                            Text("Can't delete the item");
                        },
                        child: Text("Yes", style: TextStyle(color: Colors.red)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
    http.delete(
      Uri.parse("https://jsonplaceholder.typicode.com/todos/$id"),
    );
  }
*/
  /*
  void setData() async {
    http.Response response = await http
        .post(Uri.parse("https://jsonplaceholder.typicode.com/todos/"), body: {
      //those i take them from jason file
      "userId": 1,
      //"id":1,
      //the title is the same value that added to the text field.
      "title": todoContoller.text,
      "completed": false,
    });
    if (response.statusCode == 201) {
      //to clear the text feild again
      todoContoller.clear();
      //to clear the sized box.
      Navigator.pop(context);
    } else {
      print("error!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    }
  }*/
  void setData() {
    FirebaseFirestore.instance.collection("Todo").doc().set({
      "title": todoContoller.text,
      "isCompleted": false,
    });
    todoContoller.clear();
    Navigator.pop(context);
  }
}
