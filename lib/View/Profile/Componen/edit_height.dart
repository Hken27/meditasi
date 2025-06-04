import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import '../../Api/user_api.dart';
import '../../Navbar/componen/appbar_widget.dart';

class EditHeight extends StatefulWidget {
  const EditHeight({Key? key}) : super(key: key);

  @override
  State<EditHeight> createState() {
    return EditHeightState();
  }
}

class EditHeightState extends State<EditHeight> {
  final _formKey = GlobalKey<FormState>();
  final heightController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    heightController.dispose();
    super.dispose();
  }

  void updateUserValue(String height) {
    user.weight = height;
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
                      "How Much Do You Height?",
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
                              return 'Please enter your height';
                            } else if (isAlpha(value)) {
                              return 'Only Numbers Please';
                            }
                            return null;
                          },
                          controller: heightController,
                          decoration: const InputDecoration(
                            labelText: 'Your Heiht',
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
                                  isNumeric(heightController.text)) {
                                updateUserValue(heightController.text);
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
