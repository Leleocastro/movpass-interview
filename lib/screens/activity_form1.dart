import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movpass_interview/constants.dart';
import 'package:movpass_interview/size_config.dart';
import 'package:movpass_interview/utils/appRoutes.dart';
import 'package:movpass_interview/widgets/adaptativeDropdown.dart';

class ActivityForm extends StatefulWidget {
  @override
  _ActivityFormState createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  List exercList = [];
  String exercChosed;

  @override
  void initState() {
    _exerPicker();
    super.initState();
  }

  Future _exerPicker() async {
    final exercicios =
        await FirebaseFirestore.instance.collection('exercicios').get();

    setState(() {
      for (int i = 0; i < exercicios.docs.length; i++) {
        exercList.add(exercicios.docs[i]['name']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, bottom: 20, right: 20),
            alignment: Alignment.topCenter,
            color: Color(0xFFF0F0F0),
            height: MediaQuery.of(context).size.height - 100,
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
                    SvgPicture.asset(
                      'assets/icons/running_blue.svg',
                      height: SizeConfig.blockSizeHorizontal * 10,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Atividade',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: CustomColors.kPrimaryColor,
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
                        ],
                      ),
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
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.87,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 0.5,
                                    color: Color(0XFF263064),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Selecione sua Atividade',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: CustomColors.kPrimaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          exercList == []
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10,
                                    top: 10,
                                    left: 10,
                                    right: 50,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Carregando exercícios...'),
                                      SizedBox(
                                        child: CircularProgressIndicator(),
                                        height: 20,
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                )
                              : AdaptativeDropdown(
                                  list: exercList,
                                  labelText: 'Atividade',
                                  onChanged: (value) {
                                    if (value == 'Aeróbico') {
                                      exercChosed = 'aerobico';
                                    }
                                    if (value == 'Personal Trainer') {
                                      exercChosed = 'personal';
                                    }
                                    if (value == 'Yoga') {
                                      exercChosed = 'yoga';
                                    }
                                  },
                                  onSaved: (value) {
                                    if (value == 'Aeróbico') {
                                      exercChosed = 'aerobico';
                                    }
                                    if (value == 'Personal Trainer') {
                                      exercChosed = 'personal';
                                    }
                                    if (value == 'Yoga') {
                                      exercChosed = 'yoga';
                                    }
                                  },
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Favor selecionar a Atividade!';
                                    }
                                    return null;
                                  },
                                ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Cancelar',
                                      style: TextStyle(
                                        color: CustomColors.kPrimaryColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      side:
                                          MaterialStateProperty.all<BorderSide>(
                                        BorderSide(
                                          width: 1,
                                          color: CustomColors.kPrimaryColor,
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        Colors.white,
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      minimumSize:
                                          MaterialStateProperty.all<Size>(
                                        Size(
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                            50),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                        AppRoutes.ACTIVITYFORM2,
                                        arguments: exercChosed,
                                      );
                                    },
                                    child: Text(
                                      'Seguir',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        CustomColors.kPrimaryColor,
                                      ),
                                      minimumSize:
                                          MaterialStateProperty.all<Size>(
                                        Size(
                                          MediaQuery.of(context).size.width *
                                              0.4,
                                          50,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
