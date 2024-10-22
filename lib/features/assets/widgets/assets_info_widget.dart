import 'package:flutter/cupertino.dart';

class AssetsInfoWidget  extends StatelessWidget {
  final Size size;
  final String label;
  final String dec;

   AssetsInfoWidget({super.key, required this.label, required this.dec , required this.size});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0), // Adjust this to your needs
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.05,
        padding: EdgeInsets.symmetric(horizontal: size.height * 0.01),
        decoration: BoxDecoration(
          color: Color(0xffF8F3FB),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dec,
              style:  TextStyle(fontSize: size.height * 0.02),
              textAlign: TextAlign.center, // Align the text to the right for Arabic
            ),
            Text(
              label,
              style:  TextStyle(fontSize: size.height * 0.02),
              textAlign: TextAlign.center, // Align the text to the right for Arabic
            ),
          ],
        ),
      ),
    );
  }

}
