import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bmi_practice_app/services/bmi.dart';

class ViewBMI extends StatefulWidget {
  ViewBMI({Key? key}) : super(key: key);

  @override
  State<ViewBMI> createState() => _ViewBMIState();
}

class _ViewBMIState extends State<ViewBMI> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    double result = data['bmi'];
    print(result);

    String textResult = '';
    String bgImage = '';
    String textComment = '';

    setState(() {
      if (result < 18.5) {
        textResult = 'You are underweight';
        bgImage = 'smileysdissapoint.svg';
        textComment = 'Sadly!! Your BMI is not Normal..';
      } else if (result >= 18.5 && result < 24.9) {
        textResult = 'You are Healthy';
        bgImage = 'smileyface.svg';
        textComment = 'Hurray!! Your BMI is Normal';
      } else if (result >= 25 && result < 29.9) {
        textResult = 'You are overweight';
        bgImage = 'smileysad.svg';
        textComment = 'Hurray!! Your BMI is Normal';
      } else if (result >= 30) {
        textResult = 'You are obesed ';
        bgImage = 'smileynervous.svg';
        textComment = 'Sadly!! Your BMI is not Normal..';
      }
    });

    print(textResult);
    print(bgImage);
    print(textComment);

    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: SvgPicture.asset('assets/images/$bgImage'),
          ),
          Text(
            'Your BMI is ${result.round()}',
            style: TextStyle(
              color: Colors.red[600],
              fontSize: 34,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '$textResult',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '$textComment',
            style: TextStyle(
              color: Colors.red[600],
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ButtonTheme(
            buttonColor: Colors.pink,
            minWidth: 300,
            height: 50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: FlatButton.icon(
                color: Colors.pink,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 30,
                ),
                label: Text(
                  'Lets calculate again',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
          ),
        ],
      ),
    ));
  }
}
