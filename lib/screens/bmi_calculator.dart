import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BMICalc extends StatefulWidget {
  const BMICalc({Key? key}) : super(key: key);

  @override
  State<BMICalc> createState() => _BMICalcState();
}

class _BMICalcState extends State<BMICalc> {
  double heightOfUser = 100.0;
  double weight = 65;
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                width: 200,
                child: SvgPicture.asset(
                  'assets/images/heart.svg',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'BMI Calculator',
                style: TextStyle(
                  color: Colors.red[600],
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'We care about your health',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Height (cm)',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                  min: 80.0,
                  max: 250.0,
                  onChanged: (value) => setState(() {
                    heightOfUser = value;
                  }),
                  value: heightOfUser,
                  divisions: 100,
                  label: '$heightOfUser',
                  activeColor: Colors.red,
                ),
              ),
              Text(
                '$heightOfUser',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Weight (kg)',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Slider(
                    value: weight,
                    activeColor: Colors.red,
                    divisions: 100,
                    label: '$weight',
                    min: 30,
                    max: 120,
                    onChanged: (index) {
                      setState(() {
                        weight = index;
                      });
                    }),
              ),
              Text(
                '$weight',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: FlatButton.icon(
                    color: Colors.pink,
                    minWidth: 270,
                    onPressed: () {
                      double convert = heightOfUser * heightOfUser * 0.0001;
                      setState(() {
                        bmi = weight / convert;
                      });
                      Navigator.pushNamed(context, '/show', arguments: {
                        'bmi': bmi,
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
