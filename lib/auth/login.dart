import 'package:flutter/material.dart';
import 'package:myapp/auth/register.dart';
import 'package:myapp/services/authServices.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Application Heading
            Center(
              child: Text(
                "HRIS Pintar",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),

            // Email
            Text(
              "Email",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Masukkan Email",
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            // Password
            Text(
              "Password",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2453616687.
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Masukkan Password",
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),

            // Already Registered? Login
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Belum Pernah Daftar? ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,),
            ),
            GestureDetector(
                onTap: () {
                  // Navigate to login page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            SizedBox(
              height: 20.0,
            ),
          ]),

            // Register Button
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 60.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      await Authservices().login(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);
                    },
                    child: Text(
                      "Masuk",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
