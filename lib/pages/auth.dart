import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  DecorationImage _buildBackgroundWidget() {
    return DecorationImage(
        image: AssetImage('assets/background.jpg'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5), BlendMode.hardLight));
  }

  Widget _buildEmailTextfield() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'E-Mail', fillColor: Colors.white, filled: true),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _emailValue = value;
        });
      },
    );
  }

  Widget _buildPasswordTextfield() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', fillColor: Colors.white, filled: true),
      obscureText: true,
      onChanged: (String value) {
        setState(() {
          _passwordValue = value;
        });
      },
    );
  }

  Widget _buildAcceptSwitchTile() {
    return SwitchListTile(
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
      title: Text(
        'Accept Terms',
        style: TextStyle(
            fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  void _submitForm() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('EasyList'),
        ),
        body: Container(
            decoration: BoxDecoration(image: _buildBackgroundWidget()),
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: SingleChildScrollView(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: <Widget>[
                            _buildEmailTextfield(),
                            SizedBox(
                              height: 10,
                            ),
                            _buildPasswordTextfield(),
                            _buildAcceptSwitchTile(),
                            RaisedButton(
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              child: Text('Login'),
                              onPressed: _submitForm,
                            )
                          ],
                        ))))));
  }
}
