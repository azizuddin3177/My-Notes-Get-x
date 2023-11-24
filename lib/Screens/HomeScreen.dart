import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'AddEditNoteScreen.dart';
import '../Controllers/controller.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(Controller());
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        },
        child: Scaffold(
          backgroundColor: const Color(0xffF5F5F5),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.orange,
            centerTitle: true,
            title: const Text("My Notes"),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * .01,
              vertical: Get.height * .01,
            ),
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.titleController.text =
                        controller.data[index].title.toString();
                    controller.descriptionController.text =
                        controller.data[index].description.toString();
                    Get.to(
                        AddEditNoteScreen(
                          index: index.toInt(),
                        ),
                        transition: Transition.downToUp);
                    controller.addNewNote = false;
                    controller.update();
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              controller.monthColors[DateTime.now().month - 1],
                          child: ListView(
                            children: [
                              Center(
                                  child: Text(
                                controller.monthAbbreviations[
                                    DateTime.now().month - 1],
                                style: const TextStyle(fontSize: 8),
                              )),
                              Center(
                                child: Text(
                                    DateTime.now().toString().substring(8, 10)),
                              ),
                              Center(
                                child: Text(
                                  DateTime.now().year.toString(),
                                  style: const TextStyle(fontSize: 8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        title: Text(
                          controller.data[index].title,
                          style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: SizedBox(
                          width: double.infinity,
                          child: Text(
                            controller.data[index].description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            Get.back();
                            controller
                                .openDeleteDailogue(controller.data[index]);
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.to(
                  AddEditNoteScreen(
                    index: 0,
                  ),
                  transition: Transition.downToUp);
              controller.addNewNote = true;
              controller.update();
              controller.titleController.clear();
              controller.descriptionController.clear();
              print(DateTime.now().month.toString());
            },
            label: const Text('Add Note'),
            icon: const Icon(Icons.add),
            backgroundColor: Colors.orangeAccent,
            foregroundColor: Colors.black,
          ),
        ),
      );
    });
  }
}
