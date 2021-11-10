import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_0/Bloc/AuthRepository.dart';
import 'package:version_0/Bloc/LoginBloc.dart';
import 'package:version_0/Bloc/LoginState.dart';
import 'package:version_0/LoginEvent.dart';
import 'package:version_0/LoginSubmitionStatus.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            LoginBloc(authRepo: context.read<AuthRepository>()),
        child: _loginForm(),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _userNameField(),
            _passwordField(),
            _loginBtn(),
          ],
        ),
      ),
    );
  }

  Widget _loginBtn() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.loginstatus is LoginFormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  context.read<LoginBloc>().add(LoginSubmitted());
                }
              },
              child: Text("Login"),
            );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.security),
          hintText: 'Password',
        ),
        validator: (value) =>
            state.isValidPassword ? null : 'Password is too short',
        onChanged: (value) => context.read<LoginBloc>().add(
              LoginPasswordChanged(password: value),
            ),
      );
    });
  }

  Widget _userNameField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'UserName',
        ),
        validator: (value) =>
            state.isValidUserName ? null : 'Username is too short',
        onChanged: (value) => context.read<LoginBloc>().add(
              LoginUserChanged(userName: value),
            ),
      );
    });
  }
}
