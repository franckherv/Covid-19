import 'package:resp_api_2/models/api_response.dart';
import 'package:resp_api_2/models/note_for_listing.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotesService {
  var url = Uri.parse('https://tq-notes-api-jkrgrdggbq-el.a.run.app');
  var header = {
    "apiKey": "6c678901-ae6b-4c1f-b341-0a8f24c76ba9",
  };

  Future<APIResponse<List<NoteForListing>>> getNotesListe() {
    return http.get(url,headers: header).then((data) {
      if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);
        
        final notes = <NoteForListing>[];

        for (var item in jsonData) {
          final note = NoteForListing(
              noteID: item["noteID"],
              noteTitle: item["noteTitle"],
              createDateTime: DateTime.parse(item["createDateTime"]),
              latestEditDateTime: DateTime.parse(item["latestEditDateTime"]));
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: "une erreur s'est produite");
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: "une erreur s'est produite"));
  }
}
