import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/controller.dart';

class AddEditNoteScreen extends StatelessWidget {
   final int index;
   AddEditNoteScreen({super.key,  required this.index});
   final controller=Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(builder: (__) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.orange,

          title: Text(__.addNewNote == true ? 'Add New Note' : 'Edit Note'),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Color(0xff795548)),
                )),
            TextButton(
                onPressed: () {
                  __.addNewNote==true
                      ?__.addNote()
                      :__.editNote(__.data[index], __.titleController.text, __.descriptionController.text);
                },
                child: Text(
                  __.addNewNote == true ? 'Save' : 'Edit',
                  style: const TextStyle(color: Colors.white),
                )),
          ],
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: Get.width * .01,
            vertical: Get.height * .01,
          ),
          child: ListView(
            children: [
              TextFormField(
                textCapitalization: TextCapitalization.sentences,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                controller: __.titleController,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Add Title",
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    fillColor: Colors.grey.withOpacity(.2),
                    filled: true),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                textCapitalization: TextCapitalization.sentences,
                style: TextStyle(
                  fontSize: 20
                ),
                controller: __.descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: 40,
                minLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Add Note',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
