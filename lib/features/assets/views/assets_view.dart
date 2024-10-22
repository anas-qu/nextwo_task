import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_two_anas_qunibi/features/assets/widgets/assets_info_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controller/assets_controller.dart';

class AssetsView extends StatefulWidget {
  @override
  _AssetsViewState createState() => _AssetsViewState();
}

class _AssetsViewState extends State<AssetsView> {
  final AssetsController controller = Get.put(AssetsController());

  @override
  void initState() {
    super.initState();
    // Load the live video as soon as the widget is created
    controller.youtubePlayerController.load('jfKfPfyJRdk'); // Live video ID
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Map<String, dynamic>> assetsInfoList = [
      {"label": 'رقم ترخيص فال', "dec": "948448888"},
      {"label": 'رقم عقد الواسطة', "dec": "1877999"},
      {"label": 'رقم الصك', "dec": "1187988"},
      {"label": 'رقم قطعة الارض', "dec": "8"},
      {"label": 'رقم مخطط الارض', "dec": "11987"},
      {"label": 'رقم البنك', "dec": "227"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center, // Center the title
          child: const Text(
            'الاصل 1',
            style: TextStyle(
              fontSize: 20, // Adjust the font size as needed
            ),
          ),
        ),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller.youtubePlayerController,
          showVideoProgressIndicator: true,
          progressColors: const ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.redAccent,
          ),
          onReady: () {
            controller.onPlayerReady();
          },
        ),
        builder: (context, player) {
          return SingleChildScrollView(
            child: Column(
              children: [
                player,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'الوصف',
                        style:  TextStyle(fontSize: size.height * 0.02),
                        textAlign: TextAlign.right, // Align the text to the right for Arabic
                      ),
                      Text(
                        'استمتع بالرفاهية واألناقة في هذه الفيال الحديثة، التي تمتاز بتصميم عصري يجمع بين الفخامة والراحة. '
                            'تضم الفيال مساحات واسعة ومفتوحة، وتشطيبات عالية الجودة، ونوافذ كبيرة تتيح دخول الضوء الطبيعي، مع إطالالت '
                            'خالبة على الحدائق المحيطة. مثالية لمن يبحثون عن أسلوب حياة راقي ومميز . تميز التصميم الداخلي بمزيج متناغم من '
                            'جوا من الراحة واالسترخاء. تحتوي الفيال على مطبخ مجهز بأحدث األلوان الهادئة والخامات الفاخرة، مما يخلق '
                            'األجهزة، وغرف نوم فسيحة، وحمامات بتصميم عصري. باإلضافة إلى ذلك، توفر الفيال مساحة خارجية رائعة تشمل '
                            '. مسبحا خاصا ومنطقة للشواء، مثالية للتجمعات العائلية.',
                        style:  TextStyle(fontSize: size.height * 0.015),
                        textAlign: TextAlign.right, // Align the text to the right for Arabic
                      ),
                      SizedBox(height: size.height * 0.012),
                      Text(
                        'معلومات الاصل',
                        style:  TextStyle(fontSize: size.height * 0.02),
                        textAlign: TextAlign.right,
                      ),
                      Container(
                        width: size.width * 0.9,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0xffE5EBFF),
                          border: Border.all(
                            color: Color(0xff5C7AC4),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'تم تقيم المعلومات من قبل خبراء',
                              style:  TextStyle(fontSize: size.height * 0.02),
                              textAlign: TextAlign.center,
                            ),
                            Icon(
                              Icons.shield_outlined,
                              color: Colors.purple,
                              size: size.height * 0.025,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.015),
                      Text(
                        'معلومات العقار',
                        style:  TextStyle(fontSize: size.height * 0.02),
                        textAlign: TextAlign.right,
                      ),
                      for (int i = 0; i < assetsInfoList.length; i++)
                        AssetsInfoWidget(
                          dec: assetsInfoList[i]['dec'],
                          size: size,
                          label: assetsInfoList[i]['label'],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
