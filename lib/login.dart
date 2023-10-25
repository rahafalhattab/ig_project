import 'package:flutter/material.dart';
import 'constant.dart';
import 'homepage.dart';
import 'sign_up.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

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
                    hintText: "User Name",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forget your password?"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 500,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text("Log In"),
                  ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Divider(
                        thickness: 2,
                        color: Colors.white,
                        indent: 50,
                        endIndent: 5,
                      ),
                    ),
                    Text("OR", style: TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 150,
                      child: Divider(
                        color: Colors.white,
                        thickness: 2,
                        indent: 50,
                        endIndent: 5,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.facebook,
                      color: Colors.white,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Log in with facebook",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    TextButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUp()));
                      },
                      child: Text("Don't You have an account? Create one",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
