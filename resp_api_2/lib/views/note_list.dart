import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:resp_api_2/models/api_response.dart';
import 'package:resp_api_2/models/note_for_listing.dart';
import 'package:resp_api_2/services/notes_service.dart';
import 'package:resp_api_2/views/note_delete.dart';
import 'package:resp_api_2/views/note_modify.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NotesService get service => GetIt.I<NotesService>();
  bool _isLoading = false;

   late APIResponse<List<NoteForListing>> _apiResponse;

  String formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getNotesListe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => NoteModify()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("List de note"),
        ),
        body: Builder(
          builder: (_) {
            if (_isLoading) {
              return CircularProgressIndicator();
            }
            if (_apiResponse.error) {
              return Center(
                child: Text(_apiResponse.errorMessage.toString(),
              ));
            }
            return ListView.separated(
              itemCount: _apiResponse.data!.length,
              separatorBuilder: (cxt, index) => Divider(
                height: 1,
              ),
              itemBuilder: (_, index) {
                return Dismissible(
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: Icon(Icons.delete, color: Colors.white, size: 35),
                  ),
                  key: ValueKey(_apiResponse.data![index].noteID),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                        context: context, builder: (_) => NoteDelete());
                    return result;
                  },
                  child: ListTile(
                    title: Text(
                      _apiResponse.data![index].noteTitle,
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                    ),
                    subtitle: Text(
                      "Dernière modification le ${formatDateTime(_apiResponse.data![index].latestEditDateTime)}",
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => NoteModify(
                              noteID: _apiResponse.data![index].noteID)));
                    },
                  ),
                );
              },
            );
          },
        ));
  }
}
