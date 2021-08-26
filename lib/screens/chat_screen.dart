import 'package:chatapp/models/message.dart';
import 'package:chatapp/models/user.dart';
import 'package:flutter/material.dart';
class ChatScreen extends StatefulWidget {

  final User user;

  const ChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  _buildMessage(Message message,bool isMe){
    final Container msg= Container(
      padding:const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Colors.yellow[50] : Color(0xFFFFEFEE),
        borderRadius: isMe ? const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        ) : const BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),

      margin: isMe ? const EdgeInsets.only(left: 80.0,top: 8.0,bottom: 8.0) :
      const EdgeInsets.only(top: 8.0,bottom: 8.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message.time,style:const TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),),
          const SizedBox(height: 6.0,),
          Text(message.text,style:const TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),),
        ],
      ),
    );
    if(isMe){
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(onPressed: (){},
            icon: Icon(
              message.isLiked ? Icons.favorite : Icons.favorite_border,
            ),
            iconSize: 30.0,
            color: message.isLiked ? Theme.of(context).primaryColor : Colors.blueGrey,
        ),

      ],
    );
  }

  _buildMessageComposer(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      height: 60.0,
      child: Row(
        children: [
          IconButton(
              color: Theme.of(context).primaryColor,
              onPressed: (){},
            iconSize: 25.0,
              icon: const Icon(Icons.photo),
          ),
          Expanded(child: TextField(
            decoration: InputDecoration.collapsed(hintText: 'Send a message...'),
          )),
          IconButton(
            color: Theme.of(context).primaryColor,
            onPressed: (){},
            iconSize: 25.0,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(widget.user.name,style:const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600
          ),),
          elevation: 0.0,
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){},
                icon:const Icon(
                  Icons.more_horiz,
                )),
          ],
        ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius:BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),),
                ),
                child: ClipRRect(
                  borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),),
                  child: ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.only(top: 10.0),
                      itemCount: chats.length,
                      itemBuilder: (BuildContext context,int index){
                        final Message message=chats[index];
                        bool isMe=message.sender.id==currentUser.id;
                        return _buildMessage(message,isMe);
                      }
                  ),
                ),
              ),
            ),
            _buildMessageComposer()
          ],
        ),
      ),

    );
  }
}
