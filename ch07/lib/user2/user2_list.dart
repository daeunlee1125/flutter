
import 'package:ch07/user2/user2_detail.dart';
import 'package:ch07/user2/user2_register.dart';
import 'package:flutter/material.dart';

class User2List extends StatelessWidget {
  const User2List({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User2 CRUD 실습"),),
      body: Padding(
          padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FutureBuilder(
              future: Future.value('_'),
              builder: (context, snapshot) {

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {

                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder:(context) => User2Detail()
                          ));
                      },
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: const Text('리스트타일 제목'),
                        subtitle: Text('부제목'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.edit_note,
                                  color: Colors.green,
                                )
                            ),
                            IconButton(
                                onPressed: (){},
                                icon: Icon(
                                  Icons.delete_forever_outlined,
                                  color: Colors.red,
                                )
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => User2Register(),)
                  );
                },
                child: const Text("사용자 등록")
            )
          ],
        ),
      )
    );
  }

}