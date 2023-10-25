import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'upload_image.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: Constant
        // s.height*.03,
        //width: Constants.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(79, 91, 211, 1),
              Color.fromRGBO(160, 47, 182, 1),
              Color.fromRGBO(220, 60, 105, 1),
              Color.fromRGBO(250, 125, 34, 1),
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/text3logo.png",
                  color: Colors.white,
                  width: 300,
                  height: 300,
                ),
              ),
              //Image.network("https://logos-world.net/wp-content/uploads/2020/04/Instagram-Logo-2010-2013.png",color: Colors.white,)

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "User Name",
               // suffixIcon: Icon(Icons.remove_red_eye_outlined),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter a Password",
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              /*Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forget your password?"),
                ),
              ),*/
              TextButton(onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>UploadImage()));
              }, child:Text("Next"),),
            ],
          ),
        ),
      ),
    );
  }
}
