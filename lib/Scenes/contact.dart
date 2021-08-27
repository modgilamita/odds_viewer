import 'package:flutter/material.dart';
import 'package:odds_viewer/Helper/constants.dart';
import 'package:odds_viewer/Helper/models.dart';
import 'package:odds_viewer/Helper/network.dart';

class ContactUs extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final phoneController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final _textStyle = TextStyle(
    color: OVColor.textColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
          style: TextStyle(
              color: OVColor.textColor,
              fontWeight: FontWeight.bold,
              fontSize: 24.0),
        ),
        iconTheme: IconThemeData(color: OVColor.textColor),
        backgroundColor: OVColor.themeColor,
      ),
      body: Center(
          child: Form(
              key: widget._formKey,
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: ListView(
                    children: [
                      Text(
                        "Contact Us",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: OVColor.textColor,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: nameController,
                            cursorColor: OVColor.textColor,
                            style: _textStyle,
                            decoration: InputDecoration(
                                labelText: "Your Name",
                                labelStyle: _textStyle,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: mailController,
                            cursorColor: OVColor.textColor,
                            style: _textStyle,
                            decoration: InputDecoration(
                                labelText: "Your Email",
                                labelStyle: _textStyle),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter your email address";
                              } else if (!value.isValidEmail()) {
                                return "Entered email is not valid";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            controller: phoneController,
                            cursorColor: OVColor.textColor,
                            style: _textStyle,
                            decoration: InputDecoration(
                                labelText: "Your Phone",
                                labelStyle: _textStyle),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your pone";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                          ),
                          TextFormField(
                            controller: subjectController,
                            cursorColor: OVColor.textColor,
                            style: _textStyle,
                            decoration: InputDecoration(
                                labelText: "Subject",
                                labelStyle: _textStyle),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please write your subject";
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: messageController,
                            cursorColor: OVColor.textColor,
                            style: _textStyle,
                            decoration: InputDecoration(
                                labelText: "Your Message",
                                labelStyle: _textStyle),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your message";
                              }
                              return null;
                            },
                          ),
                          Padding(padding: EdgeInsets.all(25)),
                          widget._isLoading
                              ? Row(
                                  children: [CircularProgressIndicator(
                                    color: OVColor.textColor,
                                  )],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    if (widget._formKey.currentState!
                                        .validate()) {
                                      submitRequest(context);
                                    }
                                  },
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: OVColor.themeColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: OVColor.textColor),
                                )
                        ],
                      )
                    ],
                  )
              )
          )
      ),
    );
  }

  void submitRequest(BuildContext context) {
    var params = {
      "name": nameController.text,
      "email": mailController.text,
      "subject": subjectController.text,
      "message": messageController.text,
      "phone": phoneController.text
    };
    widget._isLoading = true;
    Network.shared.submitContact(params).then((Result result) {
      if (result.success) {
        resetTheInputFields();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.message)));
      }
      setState(() {
        widget._isLoading = false;
      });
    });
  }

  void resetTheInputFields() {
    mailController.text = "";
    nameController.text = "";
    phoneController.text = "";
    subjectController.text = "";
    messageController.text = "";
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
