import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ElectricItem(
  context, {
  required String imagoff,
  String? imagon,
  required String nam,
  required bool value,
  required Function fun,
}) {
  return Container(
    width: MediaQuery.of(context).size.width / 2.2,
    height: MediaQuery.of(context).size.width / 2,
    decoration: BoxDecoration(
      // gradient: LinearGradient(
      //   begin: Alignment.bottomCenter,
      //   end: Alignment.bottomLeft ,
      //   colors: [
      //     Color.fromARGB(255, 34, 135, 218),
      //     Color.fromARGB(255, 101, 200, 213)
      //   ]
      // ),
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          value == false
              ? Center(
                  child: Image(
                  image: AssetImage("${imagoff}"),
                  width: 100,
                ))
              : Center(
                  child: Image(
                  image: AssetImage("${imagon}"),
                  width: 100,
                )),
          SizedBox(
            height: MediaQuery.of(context).size.height / 70,
          ),
          Row(
            children: [
              Text(
                '${nam}',
                style: GoogleFonts.lora(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width / 20,
                    fontWeight: FontWeight.bold
                    ),
              ),
              Spacer(),
              Center(
                child: Switch(
                  value: value,
                  onChanged: (value) async {
                    fun();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget SafteyItem(
  context, {
  required String text,
  required bool value,
  required Function fun,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        fun();
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Container(
          child: Center(
            child: Text(
              '${text}',
              style: GoogleFonts.lora(
                fontSize: MediaQuery.of(context).size.width / 20,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class MyTheme {
  static final ThemeData ligttheme = ThemeData(
    brightness: Brightness.light,
  );
  static final ThemeData darktheme = ThemeData(brightness: Brightness.dark);
}

Widget defaultFormField({
  @required controller,
  required String label,
  @required type,
  Function? onTape,
  IconData? suffixIcon,
  bool visibility = false,
}) =>
    TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'email address must not be empty';
        }

        return null;
      },
      controller: controller,
      keyboardType: type,
      obscureText: visibility,
      decoration: InputDecoration(
          isDense: false,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15.0,
            ),
          ),
          label: Text(
            "${label}",
            style: GoogleFonts.lora(),
          ),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: () {
              onTape!();
            },
          )),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget defaultButton({
  double wid = double.infinity,
  double r = 10.0,
  @required String? text,
  bool isUpper = true,
  Color back = Colors.blue,
  @required Function? function,
}) =>
    Container(
      width: wid,
      decoration: BoxDecoration(
        color: back,
        borderRadius: BorderRadius.circular(
          r,
        ),
      ),
      child: MaterialButton(
        onPressed: () {
          function!();
        },
        child: Text(isUpper ? text!.toUpperCase() : text!,
            style: GoogleFonts.lora(color: Colors.white)),
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

// UserModel? usermodel;

var uid;
