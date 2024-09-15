import 'package:flutter/material.dart';
import 'package:speeder_website/Utills/utils.dart';

Widget fillDetailsTypeIII(
    String label, String hintText, TextEditingController controller,
    {double padding = 60,
    int isRequired = 0,
    double width = double.infinity,
    double height = 130}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, padding, 0, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  color: hexToColor('#000000')),
            ),
            if (isRequired == 1)
              const Text(
                " *",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                    color: Colors.red),
              ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(right: 15, left: 15),
          height: height,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: hexToColor("#BCB8B8")),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.text,
            style: const TextStyle(
                fontSize: 15,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500),
            maxLines: null,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 15,
                fontFamily: "Montserrat",
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildButton(
  String title,
  Function onPressed, {
  double leftMargin = 30,
  double rightMargin = 30,
  double topMargin = 0,
  double bottomMargin = 40,
  double borderRadius = 10,
  double fontSize = 20,
  double height = 65,
  double width = double.infinity,
  String backgroundColor = '#C7E5FA',
  String textColor = "#000000",
  var isButtonVisible = true,
  var isProgressBarVisible = false,
}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: width,
        height: height,
        margin: EdgeInsets.fromLTRB(
          leftMargin,
          topMargin,
          rightMargin,
          bottomMargin,
        ),
        child: Visibility(
          visible: isButtonVisible,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: hexToColor(backgroundColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: ElevatedButton(
              onPressed: () {
                onPressed();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Transparent background
                elevation: 1, // No shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              child: FittedBox(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: hexToColor(textColor),
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Visibility(
        visible: isProgressBarVisible,
        child: const CircularProgressIndicator(color: Color(0xFF4F346B)),
      ),
    ],
  );
}

Widget fillDetails(
    String label, String hintText, TextEditingController controller,
    {double padding = 60,
    int i = 0,
    double width = 350,
    int isPassWord = 0,
    int isRequired = 0}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, padding, 0, 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  color: hexToColor('#000000')),
            ),
            if (isRequired == 1)
              const Text(
                " *",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w500,
                    color: Colors.red),
              ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 15, right: 15),
          height: 50,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: hexToColor("#BCB8B8")),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: TextField(
            controller: controller,
            keyboardType: i == 1 ? TextInputType.number : TextInputType.text,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat"),
            obscureText: isPassWord == 1 ? true : false,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero, // To remove default padding
              isCollapsed:
                  true, // To remove the extra space around the TextField
            ),
          ),
        )
      ],
    ),
  );
}

Widget mainMenuButton(String label,
    {double width = 125, double fontSize = 16, required VoidCallback onTap}) {
  return HoverWidget(
    builder: (isHovered) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
                isHovered ? Colors.grey.withOpacity(0.2) : Colors.transparent,
          ),
          child: PhysicalModel(
            color: Colors.transparent,
            elevation: isHovered ? 25 : 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: hexToColor("#002366"),
              ),
              height: 40,
              width: width,
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.white,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

class HoverWidget extends StatefulWidget {
  final Function(bool isHovered) builder;

  const HoverWidget({super.key, required this.builder});
  @override
  State<StatefulWidget> createState() {
    return _HoverWidgetState();
  }
}

class _HoverWidgetState extends State<HoverWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hovered = Matrix4.identity()..translate(0, -4, 0);
    final transform = isHovered ? hovered : Matrix4.identity();
    return MouseRegion(
      onEnter: (_) => onEntered(true),
      onExit: (_) => onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
