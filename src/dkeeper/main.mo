import List "mo:base/List";
import Debug "mo:base/Debug";
actor DKeeper{
  public type Note = {
    title: Text;
    content: Text;
  };

  var Notes: List.List<Note> =  List.nil<Note>();
  
  public func createNote(titleText: Text, contentText:Text){
      let newNote: Note = {
          title = titleText;
          content = contentText;
      };

     Notes := List.push(newNote,Notes);
     Debug.print(debug_show(Notes));
  };

  public query func readNotes(): async [Note]{
    return List.toArray(Notes);
  };

  public func removeNote(id:Nat){
     var Note: List.List<Note> =  List.nil<Note>();
     Note := List.take(Notes,id);
     Notes := List.drop(Notes,id + 1);
     Notes := List.append(Note,Notes);
  };
}


