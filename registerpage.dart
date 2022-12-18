import 'package:flutter/material.dart';
import 'package:hentaiturk/fonc/auth.dart';
import 'package:hentaiturk/fonc/emailMessage.dart';
import 'package:hentaiturk/pages/mainpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hentaiturk/pages/alertpages.dart';
import 'package:hentaiturk/pages/registerpage.dart';
import 'package:hentaiturk/pages/signin.dart';
import 'package:hentaiturk/pages/userprofilepage.dart';
import 'package:hentaiturk/pages/verifypage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hentaiturk/pages/verifypage.dart';

class registerpages extends StatefulWidget {
  @override
  _registerpages createState() => _registerpages();
}

class _registerpages extends State<registerpages> {
  _registerpages({Key});

  var password;
  var username;
  var email;
  var passwordColor = Colors.red;
  var usernameColor = Colors.red;
  var emailColor = Colors.red;
  var obsureTextValue = true;



  @override
  Widget build(BuildContext context) {
    bool validateStructure(String value) {
      String pattern =
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
      RegExp regExp = RegExp(pattern);
      return regExp.hasMatch(value);
    }

    bool validateStructureUsername(String value) {
      if (value.length > 3) {
        return true;
      } else {
        return false;
      }
    }

    bool validateStructureEmail(String value) {
      List<String> emails = ['@outlook.com', '@gmail.com', '@hotmail.com'];
      String value2 = value.split('').reversed.join('');
      print(value2);
      for (String i in emails) {
        String emailValue = i.split('').reversed.join('');
        print(emailValue);
        bool check2 = true;
        for (int x = 0; x < emailValue.length; x += 1) {
          print(value2[x]);
          print(emailValue[x]);
          if (value2[x] != emailValue[x]) {
            check2 = false;
            break;
          } else {
            check2 = true;
          }
        }
        if (check2) {
          return check2;
        }
      }
      return false;
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(120, 250, 160, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(120, 250, 160, 255),
        toolbarHeight: 50,
        leading: IconButton(
            splashRadius: 30,
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => hentaimainpage()));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Scrollbar(
          child: ListView(
        children: [
          ClipRRect(
            child:
                Image.asset('lib/pictures/logo2.png', width: 300, height: 300),
            borderRadius: BorderRadius.circular(50),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    username = value;
                    if (validateStructureUsername(username)) {
                      setState(() {
                        usernameColor = Colors.green;
                      });
                    } else {
                      setState(() {
                        usernameColor = Colors.red;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                      icon: Icon(
                        Icons.person_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                      hintText: 'Name',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: usernameColor, width: 2)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: usernameColor, width: 2))),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  onChanged: (value) {
                    email = value;
                    if (validateStructureEmail(email)) {
                      setState(() {
                        emailColor = Colors.green;
                      });
                    } else {
                      setState(() {
                        emailColor = Colors.red;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.mail_outline,
                        size: 30,
                        color: Colors.black,
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: emailColor, width: 2)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: emailColor, width: 2))),
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: obsureTextValue,
                  onChanged: (value) {
                    password = value;
                    if (validateStructure(password)) {
                      setState(() {
                        passwordColor = Colors.green;
                      });
                    } else {
                      setState(() {
                        passwordColor = Colors.red;
                      });
                    }
                  },
                  decoration: InputDecoration(
                      icon: Icon(
                        MdiIcons.accountLockOutline,
                        size: 30,
                        color: Colors.black,
                      ),
                      suffixIcon: GestureDetector(
                        onTap:(){
                          setState(() {
                            print(obsureTextValue);
                            if(obsureTextValue){
                              obsureTextValue = false;
                            }
                            else{
                              obsureTextValue = true;
                            }
                          });
                        },
                        child: Icon(
                          obsureTextValue
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: passwordColor, width: 2)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: passwordColor, width: 2))),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(160, 250, 100, 255),
                      ),
                    ),
                    onPressed: () async {
                      if (validateStructure(password) &&
                          validateStructureEmail(email) &&
                          validateStructureUsername(username)) {
                        try {
                          var codevalue = randomNumber();
                          var adress = email;
                          await sendEmail(name: username, email: adress, message: codevalue);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => verifyPages(
                                code: codevalue,
                                mail: adress,
                                password: password,
                              )));
                          //await createUserEmailAndPassword(email, password);
                        } catch (e) {
                          print(e);
                        }
                      } else {
                        print("Yanlıs değer");
                      }
                    },
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(120, 250, 160, 255),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account ?",
                textAlign: TextAlign.center,
                style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => signIn()));
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(fontStyle: FontStyle.normal, fontSize: 12),
                    textAlign: TextAlign.center,
                  ))
            ],
          )
        ],
      )),
    );
  }
}
