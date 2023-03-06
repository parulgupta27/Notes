import 'package:cloud_firestore/cloud_firestore.dart';

class Note{
  String? title;
  String? content;
  String ?time;
  String ?id;
  Note({this.title,this.content,this.id});
  toObj(){
    return {
      "title":title,
      "content":content,
      "time":DateTime.now().toString(),
      "id":this.id,
    };
  }
  fromObj(QueryDocumentSnapshot<Map<String,dynamic>>note){
  title=note.get("title");
  content=note.get("content");
  time=note.get("time");
  id=note.get("id");
  }
}
