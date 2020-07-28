import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final String name = 'foo';

  final databaseURL = "https://hackathon-group-6-c879e.firebaseio.com/";

  final FirebaseOptions options = const FirebaseOptions(
    googleAppID: '1:276049660980:android:a0c0af67af7a82b7050e61',
    gcmSenderID: '276049660980',
    apiKey: 'AIzaSyBBmhieyLMwtQzgZZNEhKBN3r0rxOUkSXA',
  );

  FirebaseDatabase database;

  Future<void> start() async {
    final FirebaseApp app = await FirebaseApp.configure(
      name: name,
      options: options,
    );
    assert(app != null);

    database = FirebaseDatabase(app: app, databaseURL: databaseURL);

    //var databaseReference = database.reference();
    //var nameRef = databaseReference.child("name");
    //final onValue = nameRef.onValue;
    //onValue.listen((event) {
    //  print(event.snapshot.value);
    //});
  }

  Query get testQuery => database.reference().child("messages");

  static final FirebaseService _firebaseService = FirebaseService._internal();

  factory FirebaseService() {
    return _firebaseService;
  }

  FirebaseService._internal();
}
