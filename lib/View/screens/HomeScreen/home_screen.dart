import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lcdc_mobile_app/constant/customWidget.dart';
import 'package:lcdc_mobile_app/database/dbHelper.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List<Map<String, dynamic>> usersList = [];
  DBHelper? dbHelper;
  // String? selectedView = "List View";
  RxString selectedView = "List View".obs;

  ///TextFeild Controller

  late TextEditingController titleC; // Declare controllers
  late TextEditingController DescC;
  @override
  void initState() {
    super.initState();
    titleC = TextEditingController(); // Initialize controllers
    DescC = TextEditingController();
    dbHelper = DBHelper.instance;
    getUsersList();
  }

  getUsersList() async {
    usersList = await dbHelper!.getAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          titleC.clear();
          DescC.clear();
          await modalBottomSheet();
        },
        child: const Icon(Icons.add),
      ),
      appBar: appBar(context),
      body: Column(
        children: [
          Obx(
            () =>
                selectedView.value == "Grid View"
                    ? GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: usersList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            mainAxisExtent: 100,
                          ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            modalBottomSheet(type: "Update Note", index: index);
                          },
                          child: Card(
                            child: Stack(
                              children: [
                                // Main content of the card
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                    left: 5,
                                    right: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        usersList[index][DBHelper
                                            .COLUMN_NOTE_TITLE],
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        usersList[index][DBHelper
                                            .COLUMN_NOTE_DESC],
                                        style: const TextStyle(fontSize: 16),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                // Delete button in the top-right corner
                                Positioned(
                                  top: -18,
                                  right: -10,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Delete Note'),
                                            content: const Text(
                                              'Are you sure you want to delete this note?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                    context,
                                                  ); // Close dialog
                                                },
                                                child: const Text('No'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                    context,
                                                  ); // Close dialog
                                                  dbHelper!.delete(
                                                    usersList[index][DBHelper
                                                        .COLUMN_NOTE_SNO],
                                                  );
                                                  getUsersList(); // Refresh the list
                                                },
                                                child: const Text('Yes'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                    : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: usersList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            modalBottomSheet(type: "Update Note", index: index);
                          },
                          child: Card(
                            margin: EdgeInsets.all(8),
                            child: ListTile(
                              title: Text(
                                usersList[index][DBHelper.COLUMN_NOTE_TITLE],
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                ),
                              ),
                              subtitle: Text(
                                usersList[index][DBHelper.COLUMN_NOTE_DESC],
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Delete Note'),
                                        content: Text(
                                          'Are you sure you want to delete this note?',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text('No'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Get.back();
                                              dbHelper!.delete(
                                                usersList[index][DBHelper
                                                    .COLUMN_NOTE_SNO],
                                              );
                                              getUsersList();
                                            },
                                            child: Text('Yes'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  Future modalBottomSheet({String? type = "Add Note", int? index}) {
    if (type == "Update Note") {
      titleC.text = usersList[index!][DBHelper.COLUMN_NOTE_TITLE];
      DescC.text = usersList[index][DBHelper.COLUMN_NOTE_DESC];
    } else {
      titleC.clear();
      DescC.clear();
    }

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    type!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  CustomWidgets.customTextFeild(
                    context: context,
                    controller: titleC,
                    name: 'Title',
                    hint: 'Enter Title',
                    icon: Icon(Icons.title),
                    width: double.infinity,
                  ),
                  SizedBox(height: 20),
                  CustomWidgets.customTextFeild(
                    context: context,
                    controller: DescC,
                    name: 'Description',
                    hint: 'Enter Description',
                    icon: Icon(Icons.description),
                    width: double.infinity,
                  ),
                  SizedBox(height: 20),
                  CustomWidgets.customButton(
                    context: context,
                    buttonName: type,
                    onPressed: () async {
                      if (titleC.text.isNotEmpty && DescC.text.isNotEmpty) {
                        if (type == "Add Note") {
                          // Insert new note
                          var check = await dbHelper!.insert({
                            DBHelper.COLUMN_NOTE_TITLE: titleC.text,
                            DBHelper.COLUMN_NOTE_DESC: DescC.text,
                          });
                          if (check > 0) {
                            getUsersList();
                            Navigator.pop(context);
                          }
                        } else if (type == "Update Note") {
                          // Update existing note
                          var check = await dbHelper!.update({
                            DBHelper.COLUMN_NOTE_TITLE: titleC.text,
                            DBHelper.COLUMN_NOTE_DESC: DescC.text,
                            DBHelper.COLUMN_NOTE_SNO:
                                usersList[index!][DBHelper.COLUMN_NOTE_SNO],
                          });
                          if (check > 0) {
                            getUsersList();
                            Navigator.pop(context);
                          }
                        }
                      } else {
                        print("Fields cannot be empty");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // ignore: unnecessary_null_comparison
            Obx(
              () =>
                  selectedView.value == null
                      ? Text(
                        "Change Layout",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                      : Text(
                        selectedView.value,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
            ),
          ],
        ),
        PopupMenuButton(
          onSelected: (value) {
            selectedView.value = value.toString();
          },
          itemBuilder: (BuildContext context) {
            return ["List View", "Grid View"].map((String choice) {
              return PopupMenuItem(value: choice, child: Text(choice));
            }).toList();
          },
        ),
      ],
      elevation: 0,
      title: const Text('Home Screen'),
    );
  }
}
