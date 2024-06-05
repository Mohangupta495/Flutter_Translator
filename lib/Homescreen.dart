import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}
// this is my home screen
class _HomescreenState extends State<Homescreen> {
  var languages = ["Hindi", "English", "French"];
  var originLanguage = "From";
  var destinationLanguage = "To";
  var output = "";
  TextEditingController languageController = TextEditingController();
  void onTranslateButtonPressed(String src, String desc, String input) async {
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: desc);
    setState(() {
      output = translation.text.toString();
    });
    if (src == "--" || desc == "--") {
      setState(() {
        output = "Fail To Translate";
      });
    }
  }

  String getLanguageInitals(String origin) {
    if (origin == "English") {
      return "en";
    } else if (origin == "Hindi") {
      return "hi";
    } else if (origin == "French") {
      return "fr";
    } else {
      return "--";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Mr Translator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    hint: Text(
                      originLanguage,
                      style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        child: Text(dropDownStringItem),
                        value: dropDownStringItem,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        originLanguage = value!;
                      });
                    },
                    // value: languageController,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    hint: Text(
                      destinationLanguage,
                      style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        child: Text(dropDownStringItem),
                        value: dropDownStringItem,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        destinationLanguage = value!;
                      });
                    },
                    // value: languageController,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: "Please Enter Your Text",
                    labelStyle: TextStyle(fontSize: 15, color: Colors.white),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    errorStyle: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  controller: languageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Something To Translate";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    onTranslateButtonPressed(
                        getLanguageInitals(originLanguage),
                        getLanguageInitals(destinationLanguage),
                        languageController.text.toString());
                  },
                  child: Text(
                    "Translate",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff2b3c5a)),
                ),
              ),
              SizedBox(height: 20,),
              Text("\n$output",style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
