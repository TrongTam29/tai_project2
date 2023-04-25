import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_app/model/exercise/exercise_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../constants.dart';
import '../../model/exerciseComment/exerciseComment_model.dart';

class DetailCardio extends StatefulWidget {
  DetailCardio(
      {required this.id,
      required this.url,
      required this.nameCarido,
      required this.breakTime,
      required this.duration,
      required this.exerTime,
      required this.focus});

  final String id;
  final String url;
  final String nameCarido;
  final String duration;
  final String exerTime;
  final String breakTime;
  final String focus;

  @override
  _DetailCardioState createState() => _DetailCardioState();
}

class _DetailCardioState extends State<DetailCardio> {
  late YoutubePlayerController _controller;
  ExerciseController exerciseController = Get.put(ExerciseController());
  TextEditingController commentController = TextEditingController();
  var user = FirebaseAuth.instance.currentUser;

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void initState() {
    runYoutubePlayer();
    exerciseController.getExercisesComment(widget.id);
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) {
        Size size = MediaQuery.of(context).size;
        var textStyle = TextStyle(fontFamily: 'Poppins-SemiBold', fontSize: 24);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    child: player,
                  ),
                  ListTile(
                    title: Text(
                      widget.nameCarido,
                      style: textStyle,
                    ),
                    subtitle: Text(
                      'Cardio and Lose weight',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: size.height * 0.1 - 80,
                      ),
                      Divider(thickness: 1, color: kPrimaryColor),
                      Row(
                        children: [
                          TextInfo(
                            nameInfo: 'Duration',
                            info: '10 mins',
                          ),
                          TextInfo(
                            nameInfo: 'An Exercise',
                            info: '45 sec',
                          ),
                          TextInfo(
                            nameInfo: 'Break',
                            info: '15 sec',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextInfo(
                            nameInfo: 'Calorie Burn',
                            info: '200 - 300',
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          TextInfo(
                            nameInfo: 'Body Focus',
                            info: 'Total Body',
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Color(0xFFE68F839C),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // TimerApp(),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10, left: 10),
                            height: 40,
                            width: size.width * 0.8,
                            child: TextField(
                              controller: commentController,
                              decoration: InputDecoration(
                                hintText: ' Write a comment...',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                contentPadding:
                                    EdgeInsets.only(bottom: 1, left: 8),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10, left: 10),
                            child: IconButton(
                                onPressed: () {
                                  var comment = ExerciseComment(
                                    exerciseId: widget.id,
                                    comment: commentController.text,
                                    name: user?.displayName ?? 'Người dùng',
                                    image: user?.photoURL ?? '',
                                  );
                                  exerciseController.comment(comment);
                                  commentController.clear();
                                  FocusScope.of(context).unfocus();
                                },
                                icon: Icon(
                                  Icons.send_rounded,
                                  size: 30,
                                )),
                          ),
                        ],
                      ),
                      Obx(
                        () => Wrap(
                          children: List.generate(
                            exerciseController.exerciseCommentList.length,
                            (index) {
                              var comment =
                                  exerciseController.exerciseCommentList[index];
                              return Column(
                                children: [
                                  ListTile(
                                    minLeadingWidth: 2,
                                    leading: CircleAvatar(
                                        radius: 20,
                                        backgroundImage: NetworkImage(
                                          comment.image ??
                                              'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                                        )),
                                    title: Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.grey[200]),
                                      child: RichText(
                                        text: TextSpan(
                                            text: '${comment.name}\n',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: 'Poppins-SemiBold',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            children: [
                                              TextSpan(
                                                text: comment.comment,
                                                style: TextStyle(
                                                    height: 1.5,
                                                    fontSize: 17,
                                                    fontFamily:
                                                        'PragatiNarrow-Regular',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Colors.black),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TextInfo extends StatelessWidget {
  const TextInfo({required this.nameInfo, required this.info});
  final String nameInfo;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 15, bottom: 15),
      child: RichText(
        text: TextSpan(
            text: nameInfo + '\n',
            style: TextStyle(fontSize: 18, color: kPrimaryColor),
            children: [
              TextSpan(
                  text: info,
                  style: TextStyle(fontSize: 22, color: Colors.black)),
            ]),
      ),
    );
  }
}
