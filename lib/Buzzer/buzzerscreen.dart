import 'package:cart_page/Buzzer/controllers/BuzzerController.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BuzzerController extends GetxController {
  final teamcontroller = TextEditingController();
}

class BuzzerScreen extends StatefulWidget {
  BuzzerScreen({Key? key}) : super(key: key);

  @override
  State<BuzzerScreen> createState() => _BuzzerScreenState();
}

class _BuzzerScreenState extends State<BuzzerScreen> {
  var db = FirebaseFirestore.instance;

  final BuzzerController buzzerController = Get.put(BuzzerController());
  final QuestionController questionController = Get.put(QuestionController());
  final CountDownController _controller = CountDownController();
  late Stream<QuerySnapshot> buzzerStream;
  List<Map<String, dynamic>> results = [];

  Map<String, dynamic> sendData(bool val) {
    return {
      "questionId": questionController.quesId.value,
      "teamName": buzzerController.teamcontroller.text,
      "startTime": DateTime.now().millisecondsSinceEpoch,
      "answer": val
    };
  }

  @override
  void dispose() {
    _cancelBuzzerStreamSubscription();
    super.dispose();
  }

  void _subscribeToBuzzerStream() {
    print(questionController.quesId.value);
    buzzerStream =
        _getBuzzerStreamForQuestionId(questionController.quesId.value);
    buzzerStream.listen((snapshot) {
      for (var change in snapshot.docChanges) {
        if (change.type == DocumentChangeType.added) {
          var data = change.doc.data() as Map<String, dynamic>;
          if (data['answer'] == true) {
            updateResultsTable(data);
          }
        }
      }
    });
  }

  void _cancelBuzzerStreamSubscription() {
    buzzerStream.drain();
  }

  Stream<QuerySnapshot> _getBuzzerStreamForQuestionId(int id) {
    print(id);
    return db.collection("question $id").snapshots();
  }

  Future<void> deleteDocumentsByTeamName(String teamName) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("question ${questionController.quesId.value}")
          .where('teamName', isEqualTo: teamName)
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        await documentSnapshot.reference.delete();
      }
    } catch (error) {
      print('Error deleting documents: $error');
    }
  }

  void updateResultsTable(Map<String, dynamic> data) async {
    if (!mounted) return;

    String teamName = data['teamName'];
    int startTimeTrue = data['startTime'];
    int timeDifference = 0;

    var querySnapshot = await FirebaseFirestore.instance
        .collection("question ${questionController.quesId.value}")
        .where('teamName', isEqualTo: teamName)
        .where('questionId', isEqualTo: questionController.quesId.value)
        .where('answer', isEqualTo: false)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      int startTimeFalse = querySnapshot.docs.first['startTime'];

      timeDifference = startTimeTrue - startTimeFalse;
    }

    if (!mounted) return;

    setState(() {
      results.add({
        'teamName': teamName,
        'timeDifference': timeDifference,
      });

      results
          .sort((a, b) => a['timeDifference'].compareTo(b['timeDifference']));

      if (results.length > 4) {
        results.removeLast();
      }
    });
  }

  Future<void> calculateTimeDifferenceForOtherTeams(
      String userTeamName, int questionId) async {
    List<Map<String, dynamic>> otherTeamResults = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collectionGroup('question $questionId')
          .where('teamName', isNotEqualTo: userTeamName)
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        if (documentSnapshot.exists) {
          bool isAnswerTrue = documentSnapshot['answer'] == true;
          int startTime = documentSnapshot['startTime'];

          QuerySnapshot oppositeAnswerQuerySnapshot = await FirebaseFirestore
              .instance
              .collection('question $questionId')
              .where('teamName', isEqualTo: documentSnapshot['teamName'])
              .where('answer', isEqualTo: !isAnswerTrue)
              .get();

          if (oppositeAnswerQuerySnapshot.docs.isNotEmpty) {
            int oppositeAnswerStartTime =
                oppositeAnswerQuerySnapshot.docs.first['startTime'];
            int timeDifference = isAnswerTrue
                ? startTime - oppositeAnswerStartTime
                : oppositeAnswerStartTime - startTime;

            otherTeamResults.add({
              'teamName': documentSnapshot['teamName'],
              'timeDifference': timeDifference,
            });
          }
        }
      }
      setState(() {
        results.addAll(otherTeamResults);
        results
            .sort((a, b) => a['timeDifference'].compareTo(b['timeDifference']));
      });
      print(results.toString());
    } catch (error) {
      print('Error calculating time difference for other teams: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Quiz Showdown",
          style: GoogleFonts.mukta(
            color: Colors.white,
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              deleteDocumentsByTeamName(buzzerController.teamcontroller.text);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            opacity: 1,
            fit: BoxFit.cover,
            image: AssetImage('assets/bgimg/13.jpg'),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              Text(
                "Team : ${buzzerController.teamcontroller.text}",
                style: GoogleFonts.mukta(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.003),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircularCountDownTimer(
                    controller: _controller,
                    backgroundColor: Color(0xff7FC7D9),
                    initialDuration: 30,
                    autoStart: false,
                    width: MediaQuery.of(context).size.height * 0.1,
                    height: MediaQuery.of(context).size.height * 0.1,
                    duration: 30,
                    fillColor: Color.fromARGB(255, 108, 155, 212),
                    ringColor: Color.fromARGB(255, 212, 246, 255),
                    onComplete: () async {
                      // calculateTimeDifferenceForOtherTeams(
                      //     buzzerController.teamcontroller.text,
                      //     questionController.quesId.value);
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 161, 207, 205)),
                    ),
                    onPressed: () {
                      db
                          .collection(
                              "question ${questionController.quesId.value}")
                          .add(sendData(false))
                          .then((DocumentReference ref) => print(ref.id));
                      _controller.restart();
                    },
                    child: Text(
                      "Start",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 161, 207, 205)),
                    ),
                    onPressed: () {
                      _controller.reset();
                    },
                    child: Text(
                      "Reset",
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              ElevatedButton(
                onPressed: () {
                  db
                      .collection("question ${questionController.quesId.value}")
                      .add(sendData(true))
                      .then((DocumentReference ref) => print(ref.id));
                  _subscribeToBuzzerStream();
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  shadowColor: Colors.black,
                  elevation: 25,
                  padding: const EdgeInsets.all(80),
                  backgroundColor: Color.fromARGB(255, 89, 180, 175),
                ),
                child: Text(
                  'BUZZER',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.004,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Question :  ${questionController.quesId.value}",
                    style: const TextStyle(fontSize: 20, fontFamily: "berky"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await deleteDocumentsByTeamName(
                          buzzerController.teamcontroller.text);
                      setState(() {
                        questionController.quesId.value++;
                      });
                      results.clear();
                    },
                    child: const Text(
                      "Next Question",
                      style:
                          TextStyle(fontFamily: "berky", color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Results : ",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'berky',
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              DataTable(
                columns: [
                  const DataColumn(
                      label: Text(
                    'Team Name',
                    style: TextStyle(
                      fontFamily: "berky",
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  )),
                  const DataColumn(
                      label: Text(
                    'Time Difference',
                    style: TextStyle(
                      fontFamily: "berky",
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  )),
                ],
                rows: results.map((result) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Text(
                          result['teamName'],
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      DataCell(
                        Text(
                          '${result['timeDifference'] / 1000} s',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
