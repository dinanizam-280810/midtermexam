import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homestay_raya/models/config.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:homestay_raya/views/register.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final bool _passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
  bool _ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Card(
          elevation: 11,
          margin: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: _emailEditingController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) => val!.isEmpty ||
                              !val.contains("@") ||
                              !val.contains(".")
                          ? "Enter a Valid Email"
                          : null,
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(),
                          icon: Icon(Icons.email),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                          ))),
                  TextFormField(
                      textInputAction: TextInputAction.done,
                       validator: (val) => validatePassword(val.toString()),
                      controller: _passwordEditingController,
                      keyboardType: TextInputType.visiblePassword,
                    
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(),
                          icon: const Icon(Icons.lock),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                          ))),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Checkbox(
                          value: _ischecked,
                          onChanged: (bool? value) {
                            //_onRememberMeChanged(value!);

                            setState(() {
                            _ischecked = value!;
                            });
                          }),
                      Flexible(
                        child: GestureDetector(
                          onTap: null,
                          child: const Text('Remember Me',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        minWidth: 112,
                        height: 40,
                        elevation: 7,
                        onPressed: _loginUser,
                        color: Theme.of(context).colorScheme.primary,
                        child: const Text('Log In'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Don't have an account?",
                          style: TextStyle(
                            fontSize: 16.0,
                          )),
                      GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (content) => const RegisterPage()))
                        },
                        child: const Text(
                          "Click here",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Forgot password",
                          style: TextStyle(
                            fontSize: 16.0,
                          )),
                      GestureDetector(
                        onTap: null,
                        child: const Text(
                          "Click here",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                  /*GestureDetector(
                  onTap: _goRegister,
                  child: const Text(
                    "Don't have an account. Register now",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),*/
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  String? validatePassword(String value) {
    String pattern = r'^(?=.*?[A‐Z])(?=.*?[a‐z])(?=.*?[0‐9]).{6,}$';
    RegExp regex = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Wrong password';
      } else {
        return null;
      }
    }
  }


  void _loginUser() {
    if (!_formKey.currentState!.validate()) {
        Fluttertoast.showToast(
            msg: "Please fill in the login credentials",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
             
            fontSize: 14.0);
        return;
      }
    String _email = _emailEditingController.text;
    String _pass = _passwordEditingController.text;
    http.post(Uri.parse("${Config.SERVER}php/login_user.php"),
        body: {"email": _email, "password": _pass}).then((response) {
          print(response.body);
        });
    /*Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage()));*/
  }

  /*void saveremovepref(bool value) async {
    String email = _emailEditingController.text;
    String password = _passwordEditingController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value) {
      //save pref
      if (!_formKey.currentState!.validate()) {
        Fluttertoast.showToast(
            msg: "Please fill in the login credentials",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            fontSize: 14.0);
        _ischecked = false;
        return;
      }
      await prefs.setString('email', email);
      await prefs.setString('pass', password);
      Fluttertoast.showToast(
          msg: "Preference Stored",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
          _ischecked = true;
    } else {
      //delete preference
      await prefs.setString('email', '');
      await prefs.setString('pass', '');
      setState(() {
        _emailEditingController.text = '';
        _passwordEditingController.text = '';
        _ischecked = false;
      });
      Fluttertoast.showToast(
          msg: "Preference Removed",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 14.0);
    }
  }

  void _onRememberMeChanged(bool newValue) => setState(() {
        _ischecked = newValue;
        if (_ischecked) {
          saveremovepref(true);
        } else {
          saveremovepref(false);
        }
      });
  Future<void> loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = (prefs.getString('email')) ?? '';
    String password = (prefs.getString('pass')) ?? '';
    if (email.length > 1) {
      setState(() {
        _emailEditingController.text = email;
        _passwordEditingController.text = password;
        _ischecked = true;
      });
    }
  }*/
}
