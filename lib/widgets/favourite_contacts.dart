import 'package:chatapp/models/message.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';
class FavouriteContacts extends StatelessWidget {
  const FavouriteContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Favourite Contacts',style:TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),),
                IconButton(
                  icon: Icon(
                  Icons.more_horiz,
                ),
                iconSize: 30.0,
                color: Colors.blueGrey,
                  onPressed: (){},
                ),

              ],
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 10.0),
                scrollDirection: Axis.horizontal,
                itemCount: favourites.length,
                itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (_) => ChatScreen(
                        user: favourites[index],
                        ),
                        ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage: AssetImage(favourites[index].imageUrl),

                          ),
                          SizedBox(height: 6.0,),
                          Text(favourites[index].name,style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),),
                        ],
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
