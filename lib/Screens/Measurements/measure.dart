import 'package:flutter/material.dart';
import 'package:outfit/Screens/Measurements/components/labelField.dart';
import 'package:outfit/Screens/Measurements/components/textFeilds.dart';
import 'package:outfit/Screens/Measurements/size.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class measures extends StatelessWidget {
  GlobalKey<FormState> formstate = GlobalKey();

  var weightController = TextEditingController();
  var heightController = TextEditingController();
  var ageController = TextEditingController();

  Future<String?> fetchData(double weight, double height, double age) async {
    try {
        http.Response response = await http.get(
        Uri.parse('http://127.0.0.1:5000/suitable_size?weight=$weight&height=$height&age=$age'),
      );
      return "xxl";
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print('Predicted Size: ${data['predicted_size']}');
        return data['predicted_size'];
      } else {
        print('Failed to get predicted size. Status code: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error during HTTP request: $error');
      return "$error";
    }
  }

// Example usage



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: Container(
        margin: EdgeInsets.only(top: 45),
        child: Center(
          child: SingleChildScrollView(
            // Wrap with SingleChildScrollView
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 12,
                                  ),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 12),
                                  child: labelWidgt('Age :'),
                                ),
                                text(controller: ageController, hint: ' Age ',),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 12),
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
                                  colors: [Colors.purple, Colors.deepPurple],),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent),
                              onPressed: () async {
                                if (formstate.currentState!.validate()) {

                                  String x;
                                  try {
                                    var x = await fetchData(65.5, 160.0, 35.0);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return size(x!);
                                        },
                                      ),
                                    );
                                  } catch (error) {
                                    print('Error: $error');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return size("$error");
                                        },
                                      ),
                                    );
                                    // Handle the error as needed
                                  }
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
