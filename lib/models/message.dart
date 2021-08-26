
import 'package:chatapp/models/user.dart';

class Message {
 final User sender;
 final String time;
 final String text;
 final bool isLiked;
 final bool isViewed;

  Message(this.sender, this.time, this.text, this.isLiked, this.isViewed);



}
final User currentUser = User(0,'currentUser','assets/images/men.jpg');
final User grege = User(1,'grege','assets/images/men4.jpg');
final User georgia = User(2,'georgia','assets/images/women1.jpg');
final User john = User(3,'john','assets/images/men3.jpg');
final User steven = User(4,'steven','assets/images/women3.jpg');
final User letti = User(5,'letti','assets/images/men2.jpg');

final List<User> favourites=[grege,georgia,letti,john,steven];

final List<Message> chats=[

 Message(grege, '12:55', 'Hello how Are You', false, true),
 Message(georgia, '12:55', 'Hello', true, false),
 Message(steven, '12:55', 'Are You Alright', false, false),

 Message(letti, '12:55', 'Are You Alright', false, false),
 Message(john, '12:55', 'Meet me Urgent', true, true),
 Message(currentUser, '12:55', 'see u bye', false, false),

];