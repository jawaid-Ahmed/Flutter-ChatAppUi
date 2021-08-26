import 'package:chatapp/models/message.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';
class RecentChats extends StatelessWidget {
  const RecentChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(

        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            )
        ),

        child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context,int index){
              final Message chat =chats[index];

              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (_) => ChatScreen(
                      user: chat.sender),),),

                child: Container(

                  margin: EdgeInsets.only(right: 15.0,bottom: 5.0),
                  padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: !chat.isViewed ? Color(0xFFFFEFEF) : Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage(chat.sender.imageUrl),
                          ),
                          SizedBox(width: 15.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(chat.sender.name,style:const TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                              ),
                                  overflow: TextOverflow.ellipsis
                              ),
                              SizedBox(height: 5.0,),
                              Container(

                                child: Text(chat.text,style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blueGrey
                                ),
                                overflow: TextOverflow.ellipsis,),
                              ),

                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(chat.time,style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height: 6.0,),
                          !chat.isViewed ? Container(
                              padding: EdgeInsets.symmetric(horizontal: 6.0,vertical: 4.0),

                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25.0)
                              ),
                              child: Text('New',style: TextStyle(
                                color: Colors.white,
                              ),)) : Text(''),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
