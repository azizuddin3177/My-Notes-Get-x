


import 'package:hive/hive.dart';
import 'package:hive_tutorial/Models/NotesModel.dart';

class Boxes{

  static Box<NotesModel> getData()=> Hive.box<NotesModel>('notes');

}