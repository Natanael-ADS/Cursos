import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  static const String cEmail = 'natanael@gmail.com';
  static const String cPassword = '123';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  fEmail(),
                  fEspaco(10),
                  fpassword(),
                  fEspaco(25),
                  fEntrar()
                ],
              ),
            )),
      ),
    );
  }

  fEmail() {
    return TextField(
      onChanged: (value) => email = value,
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'E-mail'),
    );
  }

  fpassword() {
    return TextField(
      onChanged: (value) => password = value,
      keyboardType: TextInputType.number,
      obscureText: true,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'Password'),
    );
  }

  fEspaco(double size) {
    return SizedBox(
      height: size,
    );
  }

  fEntrar() {
    return RaisedButton(
      onPressed: () {
        if ((email == cEmail) && (password == cPassword)) {
          print('Correto');
        } else {
          print('Senha ou email inválido!');
          print(password);
          print(email);
        }
      },
      child: Text('Entrar'),
    );
  }
}
