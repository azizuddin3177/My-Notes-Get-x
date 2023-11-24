import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Boxes/Boxes.dart';
import '../Models/NotesModel.dart';

class Controller extends GetxController{

  final titleController = TextEditingController(text: 'Add  Title');
  final descriptionController = TextEditingController();
  bool addNewNote = true;
  bool readOnly = true;
  var data = <NotesModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    final box = Boxes.getData();
    data.assignAll(box.values.toList().cast<NotesModel>());
  }

  void addNote() {
    var title = titleController.text;
    final description = descriptionController.text;

    if (description.isEmpty) {
      Get.back();
      return;
    }
    if (title.isEmpty) {
      titleController.text = "Add title";
      title = "Add title";
      update();
    }
    final note = NotesModel(
      title: title,
      description: description,
    );

    final box = Boxes.getData();
    box.add(note);
    note.save();
    data.add(note);
    titleController.clear();
    descriptionController.clear();
    Get.back(); // Close the dialog
  }

  void delete(NotesModel notesModel) {
    notesModel.delete();
    data.remove(notesModel);
    update();
    Get.back();
  }

  void editNote(NotesModel existingNote, String newTitle, String newDescription) {
    existingNote.title = newTitle;
    existingNote.description = newDescription;

    if(newDescription.isEmpty){
      Get.back();
      return;
    }
    if(newTitle.isEmpty){
      existingNote.title = "Add Title";
      newTitle = "Add title";
      update();
    }

    existingNote.save();

    final index = data.indexWhere((note) => note.key == existingNote.key);
    if (index != -1) {
      data[index] = existingNote;
    }
    update();
    Get.back();
  }

  void openDeleteDailogue(NotesModel notesModel) {
    Get.defaultDialog(
      title: 'Are You Sure?',
      content: const Text(''),
      confirm: TextButton(
        onPressed: (){
          delete(notesModel);
        },
        child: const Text("Yes",style: TextStyle(color: Colors.red),),
      ),
      cancel: TextButton(
        onPressed: Get.back,
        child: const Text("No",style: TextStyle(color: Colors.green),),
      ),
    );
  }

  List<String> monthAbbreviations = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  List<Color> monthColors = [
    const Color(0xFF007BA7),  // January - Cerulean Blue
    const Color(0xFFFF6B81),  // February - Rose Pink
    const Color(0xFF50C878),  // March - Emerald Green
    const Color(0xFFFFD700),  // April - Golden Yellow
    const Color(0xFFFFA500),  // May - Tangerine Orange
    const Color(0xFF808000),  // June - Olive Green
    const Color(0xFF0D98BA),  // July - Sapphire Blue
    const Color(0xFF996515),  // August - Amber Brown
    const Color(0xFF40E0D0),  // September - Turquoise
    const Color(0xFF800000),  // October - Maroon
    const Color(0xFF708090),  // November - Slate Gray
    const Color(0xFFFFFFFF),  // December - Snow White
  ];

}