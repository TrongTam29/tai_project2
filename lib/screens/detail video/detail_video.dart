import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/model/exercise/exercise_controller.dart';
import 'package:my_app/model/exerciseComment/exerciseComment_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVideo extends StatefulWidget {
  DetailVideo({
    required this.id,
    required this.url,
    required this.nameExercise,
    // required this.breaks,
    required this.detail,
    // required this.reps,
    // required this.sets,
  });
  final String id;
  final String url;
  final String nameExercise;
  // final String sets;
  // final String reps;
  // final String breaks;
  final String detail;

  @override
  _DetailVideoState createState() => _DetailVideoState();
}

class _DetailVideoState extends State<DetailVideo> {
  late YoutubePlayerController _controller;
  final TextEditingController commentController = TextEditingController();
  ExerciseController exerciseController = Get.find();
  var user = FirebaseAuth.instance.currentUser;

  var userId;

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
      flags: YoutubePlayerFlags(
        startAt: 10,
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
    Size size = MediaQuery.of(context).size;
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
          var textStyle = TextStyle(fontWeight: FontWeight.w500, fontSize: 20);
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: ClipRRect(
                        child: player,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        widget.nameExercise,
                        style: textStyle,
                      ),
                      trailing: IconButton(
                          onPressed: () async {
                            final box =
                                context.findRenderObject() as RenderBox?;

                            await Share.share(
                              widget.url,
                              sharePositionOrigin:
                                  box!.localToGlobal(Offset.zero) & box.size,
                            );
                          },
                          icon: Icon(
                            Icons.share_rounded,
                            size: 25,
                            color: Colors.black,
                          )),
                      subtitle: Text('Gym guide - Chest'),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Card(
                    //       margin: EdgeInsets.only(top: 15, bottom: 20),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(19)),
                    //       color: Color(0xFFFDF9F9),
                    //       // color: Colors.white,
                    //       elevation: 10,
                    //       child: Container(
                    //         width: size.width * 0.3 - 5,
                    //         height: size.height * 0.11,
                    //         child: Column(
                    //           children: [
                    //             ListTile(
                    //               title: Icon(Icons.access_alarm_outlined),
                    //               trailing: Text(
                    //                 'Reps',
                    //                 style: textStyle,
                    //               ),
                    //             ),
                    //             // Padding(
                    //             //   padding: EdgeInsets.only(top: 20),
                    //             // ),
                    //             Text(
                    //               widget.reps,
                    //               style: textStyle,
                    //               textAlign: TextAlign.center,
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     Card(
                    //       margin: EdgeInsets.only(top: 15, bottom: 20),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(19)),
                    //       color: Color(0xFFFBFBFB),
                    //       elevation: 10,
                    //       child: Container(
                    //         width: size.width * 0.3 - 5,
                    //         height: size.height * 0.11,
                    //         child: Column(
                    //           children: [
                    //             ListTile(
                    //               title: Icon(Icons.fact_check_outlined),
                    //               trailing: Text('Sets', style: textStyle),
                    //             ),
                    //             // Padding(
                    //             //   padding: EdgeInsets.only(top: 20),
                    //             // ),
                    //             Text(
                    //               widget.sets,
                    //               style: textStyle,
                    //               textAlign: TextAlign.center,
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     Card(
                    //       margin: EdgeInsets.only(top: 15, bottom: 20),
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(19)),
                    //       color: Color(0xFFFFF8F8),
                    //       elevation: 10,
                    //       child: Container(
                    //         width: size.width * 0.3 - 5,
                    //         height: size.height * 0.11,
                    //         child: Column(
                    //           children: [
                    //             ListTile(
                    //               title: Icon(
                    //                 Icons.skip_next_outlined,
                    //                 size: 30,
                    //               ),
                    //               trailing: Text(
                    //                 'Break',
                    //                 style: textStyle,
                    //               ),
                    //             ),
                    //             // Padding(
                    //             //   padding: EdgeInsets.only(top: 20),
                    //             // ),
                    //             Text(
                    //               widget.breaks,
                    //               style: TextStyle(
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.w500,
                    //               ),
                    //               textAlign: TextAlign.center,
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        widget.detail,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                    ),
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
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
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
                                                  fontWeight: FontWeight.normal,
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
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
