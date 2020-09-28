import 'package:everpobre/Scenes/notebooks_scene.dart';
import 'package:everpobre/Scenes/notes_scene.dart';
import 'package:everpobre/domain/notebook.dart';
import 'package:everpobre/domain/note.dart';
import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/text_resources.dart';
import 'package:flutter/material.dart';

final Notebooks model = Notebooks.testDataBuilder();

void main() {
  runApp(TreeBuilder());
}

class TreeBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MainWidget.routeName: (context) => MainWidget(),
        NotesWidget.routeName: (context) => NotesWidget(),
      },
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF388E3C),
        accentColor: const Color(0xFFFFC107),
      ),
      initialRoute: MainWidget.routeName,
    );
  }
}

class MainWidget extends StatelessWidget {
  static const routeName = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextResources.appName),
      ),
      body: NotebooksListView(model),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.add(Notebook("Nuevo Notebook"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NotesWidget extends StatelessWidget {
  static const routeName = "/notes";
  @override
  Widget build(BuildContext context) {
    final Notebook model =
        ModalRoute.of(context).settings.arguments as Notebook;
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: NotesListView(model),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          model.add(Note("Una nueva nota"));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
