import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movpass_interview/constants.dart';
import 'package:movpass_interview/widgets/adaptativeDatePicker.dart';

class ActivityForm3 extends StatefulWidget {
  @override
  _ActivityForm3State createState() => _ActivityForm3State();
}

class _ActivityForm3State extends State<ActivityForm3> {
  // final _user = FirebaseAuth.instance.currentUser.uid;
  // String groupId;
  // List _listId = [];
  // List _otherUser = [];
  // List _modifiedAtGroup = [];
  DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    QueryDocumentSnapshot profChosed =
        ModalRoute.of(context).settings.arguments;

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
                          text: 'Horários de ${profChosed['name']}',
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: AdaptativeDatePicker(
                      isValid: true,
                      selectedDate: dateTime,
                      tipodeData: 'Data Selecionada',
                      onDateChanged: (newDate) {
                        setState(() {
                          dateTime = newDate;
                        });
                      },
                    ),
                  ),
                  dateTime == null ? Text('') : Text('Selecione o Horário'),
                  dateTime == null
                      ? Container()
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: profChosed['horarios'].length,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
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
                                    profChosed['horarios'][i],
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  subtitle: Text('2 horas de exercício'),
                                  onTap: () {
                                    Map<String, dynamic> ativData = {
                                      'alunoId': 'Aluno ID',
                                      'nomeAluno': 'Nome Aluno',
                                      'data': dateTime.toString().split(' ')[0],
                                      'horario': profChosed['horarios'][i],
                                    };

                                    print(profChosed['exercicio']);
                                    print(ativData['horario']);

                                    FirebaseFirestore.instance
                                        .collection('exercicios')
                                        .doc(profChosed['exercicio'])
                                        .collection('professores')
                                        .doc(profChosed['mat'])
                                        .collection('agendado')
                                        .doc(ativData['data'] +
                                            ' ' +
                                            profChosed['horarios'][i])
                                        .set(ativData);

                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Exercício agendado com sucesso!'),
                                        duration: Duration(
                                          seconds: 3,
                                        ),
                                      ),
                                    );
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
