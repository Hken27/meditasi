import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../../Api/user_api.dart';
import '../../Navbar/componen/appbar_widget.dart';

class EditWeight extends StatefulWidget {
  const EditWeight({Key? key}) : super(key: key);

  @override
  State<EditWeight> createState() {
    return EditWeightState();
  }
}

class EditWeightState extends State<EditWeight> {
  final _formKey = GlobalKey<FormState>();
  final weightController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    weightController.dispose();
    super.dispose();
  }

  void updateUserValue(String weight) {
    user.weight = weight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                    width: 320,
                    child: Text(
                      "How Much Do You Weight?",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                        height: 100,
                        width: 320,
                        child: TextFormField(
                          // Handles Form Validation
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your weight';
                            } else if (isAlpha(value)) {
                              return 'Only Numbers Please';
                            }
                            return null;
                          },
                          controller: weightController,
                          decoration: const InputDecoration(
                            labelText: 'Your Weight',
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 320,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate() &&
                                  isNumeric(weightController.text)) {
                                updateUserValue(weightController.text);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )))
              ]),
        ));
  }
}
