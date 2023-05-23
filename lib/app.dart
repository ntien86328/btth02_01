import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  bool _showPass = false;
  var color_primary = Color(0xFF00cd00);

  void show_hidePass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onClick() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: color_primary,
        // shape: Border(
        //     bottom: BorderSide(
        //   width: 1,
        // )),
        toolbarHeight: 150,
        title: Center(
          child: Text(
            'Sign In',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: StreamBuilder(
                          builder: (context, snapshot) => TextField(
                            controller: _usernameController,
                            focusNode: emailFocusNode,
                            decoration: InputDecoration(
                                labelText: 'Username',
                                hintText: 'Email hoặc số điện thoại',
                                errorText: snapshot.hasError
                                    ? snapshot.error.toString()
                                    : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                )),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            StreamBuilder(
                              builder: (context, snapshot) => TextField(
                                  controller: _passwordController,
                                  focusNode: passFocusNode,
                                  obscureText: !_showPass, // show hide password

                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    hintText: 'Mật khẩu',
                                    errorText: snapshot.hasError
                                        ? snapshot.error.toString()
                                        : null,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: show_hidePass,
                              child: Text(
                                _showPass ? 'Hide' : 'Show',
                                style: TextStyle(
                                    color: color_primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Forgot',
                              style: TextStyle(fontSize: 18),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Username',
                                style: TextStyle(
                                    color: color_primary, fontSize: 18),
                              ),
                            ),
                            Text('/'),
                            TextButton(
                              child: Text(
                                'Password',
                                style: TextStyle(
                                    color: color_primary, fontSize: 18),
                              ),
                              onPressed: null,
                            ),
                            Text('?'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 65,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: color_primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                        ),
                        onPressed: onClick,
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'SIGN UP NOW',
                        style: TextStyle(
                            color: color_primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
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
