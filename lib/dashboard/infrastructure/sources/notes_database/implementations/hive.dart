import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_book/dashboard/infrastructure/sources/notes_database/export.dart';

class NotesDatabaseHiveImplementation extends NotesDatabase {
  final LazyBox<dynamic> storage;
  final NoteConverter convert;

  NotesDatabaseHiveImplementation({
    required this.storage,
    required this.convert,
  });

  static const String key = 'notes';

  @override
  Future<List<NoteModel>> add({required NoteModel newNote}) async {
    try {
      List<NoteModel> oldStorageData = await fetch(); // get old list of models

      oldStorageData.add(newNote); // add new model to list

      List<Map<dynamic, dynamic>> newStorageData = oldStorageData
          .map(
            (model) => convert.toMap(model),
          )
          .toList(); // convert new list with new model to correct format

      await storage.put(key, newStorageData); // put new list of map`s to hive

      return await fetch(); // get new list from storage
    } catch (error) {
      throw StorageException(error);
    }
  }

  @override
  Future<List<NoteModel>> delete({required int index}) async {
    try {
      List<NoteModel> oldStorageData = await fetch(); // get old list of models

      oldStorageData.removeAt(index); // delete

      await storage.put(
        // put new dato to storage
        key,
        oldStorageData // convert from List of Models to List of  Map
            .map(
              (model) => convert.toMap(model),
            )
            .toList(),
      );

      return await fetch();
    } catch (error) {
      throw StorageException(error);
    }
  }

  @override
  Future<List<NoteModel>> edit(
      {required NoteModel newNote, required int index}) async {
    try {
      List<NoteModel> storageData =
          await delete(index: index); // delete old one

      storageData.insert(index, newNote); // add a new one

      await storage.put(
        key,
        storageData
            .map(
              (model) => convert.toMap(model),
            )
            .toList(),
      ); // saving to storage

      return fetch(); // retrieving from storage
    } catch (error) {
      throw StorageException(error);
    }
  }

  @override
  Future<List<NoteModel>> fetch() async {
    try {
      dynamic responseFromStorage = await storage.get(key); // get storage data

      List<Map<dynamic, dynamic>> dynamicMapList =
          List<Map<dynamic, dynamic>>.from(
        responseFromStorage ?? [],
      ); // if storage is null create list or if exist, convert from dynamic to Map

      List<Map<String, dynamic>> mapStringList = dynamicMapList
          .map(
            (dynamicMap) => Map<String, dynamic>.from(dynamicMap),
          )
          .toList(); // another convertation, this time i convert from Map<dynamic to Map<String>>

      List<NoteModel> modelList = mapStringList
          .map(
            (mapString) => convert.fromMap(mapString),
          )
          .toList(); // the last conversation, Map to my Model
      return modelList;
    } catch (error) {
      throw StorageException(error);
    }
  }
}
