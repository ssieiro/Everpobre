import 'package:everpobre/domain/notebooks.dart';
import 'package:everpobre/main.dart';
import 'package:flutter/material.dart';

class NotebooksListView extends StatefulWidget {
  final Notebooks _model;

  const NotebooksListView(Notebooks model) : _model = model;

  @override
  _NotebooksListViewState createState() => _NotebooksListViewState();
}

class _NotebooksListViewState extends State<NotebooksListView> {
  void modelDidChange() {
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    widget._model.addListener(modelDidChange);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    widget._model.removeListener(modelDidChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget._model.length,
      itemBuilder: (context, index) {
        return NotebookSliver(widget._model, index);
      },
    );
  }
}

class NotebookSliver extends StatefulWidget {
  final Notebooks notebooks;
  final int index;

  const NotebookSliver(Notebooks notebooks, int index)
      : notebooks = notebooks,
        index = index;

  @override
  _NotebooksSliverState createState() => _NotebooksSliverState();
}

class _NotebooksSliverState extends State<NotebookSliver> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        widget.notebooks.removeAt(widget.index);
        Scaffold.of(context).showSnackBar(
          const SnackBar(
            content: Text("Notebook has been deleted!"),
          ),
        );
        setState(() {});
      },
      background: Container(
        color: Colors.red,
      ),
      child: Card(
        child: GestureDetector(
          child: ListTile(
            leading: const Icon(Icons.library_books),
            title: Text(widget.notebooks[widget.index].title),
            onTap: () {
              Navigator.pushNamed(context, NotesWidget.routeName,
                  arguments: widget.notebooks[widget.index]);
            },
          ),
        ),
      ),
    );
  }
}
