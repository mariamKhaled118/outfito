import 'package:flutter/material.dart';
import 'package:outfit/Screens/Measurements/components/labelField.dart';
import 'package:outfit/Screens/Measurements/components/textFeilds.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../Model/ModelPage.dart';

class measures extends StatelessWidget {
  GlobalKey<FormState> formstate = GlobalKey();

  var weightController = TextEditingController();
  var heightController = TextEditingController();
  var ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Container(
        margin: EdgeInsets.only(top: 45),
        child: Center(
          child: SingleChildScrollView( // Wrap with SingleChildScrollView
            child: Column(
              children: [
                GradientText(
                  'measurements form',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                  colors: [
                    Colors.purple,
                    Colors.deepPurple,
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xFFFBF8F1),
                  ),
                  margin: EdgeInsets.only(top: 15),
                  width: width / 1.1,
                  height: height - (height / 5.5),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Form(
                    key: formstate,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10),
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                  child: labelWidgt('Weight (kg)'),
                                ),
                                text(
                                    controller: weightController,
                                    hint: ' Weight '),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                  child: labelWidgt('Age :'),
                                ),
                                text(controller: ageController, hint: ' Age '),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                                  child: labelWidgt('Height (cm) :'),
                                ),
                                text(
                                  controller: heightController,
                                  hint: ' Height ',
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.deepPurple]),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              onPressed: () {
                                if (formstate.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ImageListScreen();
                                      },
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'submission',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
