import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movpass_interview/constants.dart';
import 'package:movpass_interview/utils/appRoutes.dart';

class ActivityForm2 extends StatefulWidget {
  @override
  _ActivityForm2State createState() => _ActivityForm2State();
}

class _ActivityForm2State extends State<ActivityForm2> {
  // final _user = FirebaseAuth.instance.currentUser.uid;
  // String groupId;
  // List _listId = [];
  // List _otherUser = [];
  // List _modifiedAtGroup = [];

  @override
  Widget build(BuildContext context) {
    String exercChosed = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            alignment: Alignment.topCenter,
            color: Color(0xFFF0F0F0),
            height: MediaQuery.of(context).size.height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: CustomColors.kPrimaryColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Row(
                  children: [
                    Icon(
                      Icons.people,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Professores',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF263064),
                            fontSize: 22,
                          ),
                          children: [
                            TextSpan(
                              text: '',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('exercicios')
                    .doc(exercChosed)
                    .collection('professores')
                    .orderBy('name')
                    .get(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final profData = snapshot.data.docs;
                  print(profData);

                  return ListView.builder(
                    itemCount: profData.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 5),
                          padding: EdgeInsets.all(10),
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFF9F9FB),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.only(
                              left: 40,
                              top: 5,
                              bottom: 5,
                            ),
                            title: Text(
                              profData[i]['name'],
                              style: TextStyle(fontSize: 18),
                            ),
                            subtitle: Text('Professor'),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                AppRoutes.ACTIVITYFORM3,
                                arguments: profData[i],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
