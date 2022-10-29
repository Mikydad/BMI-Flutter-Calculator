import 'package:bmi_calculator/ResultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconContent.dart';
import 'reUsableCode.dart';
import 'Constants.dart';
import 'ResultsPage.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender slectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Male Card
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReUsable(
                  onpress: () {
                    setState(() {
                      slectedGender = Gender.male;
                    });
                  },
                  colour: slectedGender == Gender.male
                      ? KActiveCardColor
                      : KInactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'Male',
                  ),
                )),
                //Female Card
                Expanded(
                    child: ReUsable(
                  onpress: () {
                    setState(() {
                      slectedGender = Gender.female;
                    });
                  },
                  colour: slectedGender == Gender.female
                      ? KActiveCardColor
                      : KInactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'Female',
                  ),
                )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: new ReUsable(
                  colour: KActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: KLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            Kheight.toString(),
                            style: KNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: KLabelTextStyle,
                          )
                        ],
                      ),

                      //Our SLider Theme.
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0XFFEB1555),
                            overlayColor: Color(0x29EB1555),
                            activeTrackColor: Colors.white,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 20)),
                        child: Slider(
                            value: Kheight.toDouble(),
                            min: 120,
                            max: 220,
                            inactiveColor: Color(0XFF8DE98),
                            onChanged: (double newValue) {
                              setState(() {
                                Kheight = newValue.round();
                              });
                            }),
                      )
                    ],
                  ),
                ))
              ],
            )),

            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReUsable(
                    colour: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Width',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          KWeight.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    KWeight++;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    KWeight--;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReUsable(
                    colour: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          KAge.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    KAge++;
                                  });
                                }),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    KAge--;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),

            //Bottom Container
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultsPage();
                }));
              },
              child: Container(
                child: Center(
                    child: Text('Calculate', style: KLargeBottomTextStyle)),
                color: KBottomContainerColor,
                padding: EdgeInsets.only(bottom: 15),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: KBottomContainerHeight,
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onpressed});
  final IconData icon;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onpressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0XFF4c3f5E),
    );
  }
}
