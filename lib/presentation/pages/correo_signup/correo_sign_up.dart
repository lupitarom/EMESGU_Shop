import 'package:enseguida_shop/presentation/providers/email_signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class IniciarSesion2 extends StatefulWidget {
  const IniciarSesion2({Key? key}) : super(key: key);

  @override
  State<IniciarSesion2> createState() => _SignUpWidget2State();
}

class _SignUpWidget2State extends State<IniciarSesion2> {
  final _formerKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Image.asset(
                  "assets/images/logo.jpeg",
                  height: 200,
                  width: 200,
                ),
              ),
              buildAuthForm(context),
            ],
          ),
        ),
      );
  Widget buildAuthForm(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);

    return Center(
      child: Card(
        color: const Color(0xFFe8c149),
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formerKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildEmailField(context),
                if (!provider.isLogin) buildUsernameField(context),
                buildPasswordField(context),
                const SizedBox(height: 12),
                buildButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUsernameField(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);

    return TextFormField(
      key: const ValueKey('username'),
      autocorrect: true,
      textCapitalization: TextCapitalization.words,
      enableSuggestions: false,
      validator: (value) {
        if (value!.isEmpty || value.length < 6 || value.contains(' ')) {
          return 'Inserta al menos 6 caracteres sin espacio';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(labelText: 'Usuario'),
      onSaved: (username) => provider.userName = username!,
    );
  }

  Widget buildButton(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);

    if (provider.isLoading) {
      return const CircularProgressIndicator();
    } else {
      return Column(
        children: [
          buildLoginButton(context),
          buildSignupButton(context),
        ],
      );
    }
  }

  Widget buildLoginButton(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);

    return OutlineButton(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      highlightedBorderColor: Colors.black,
      borderSide: const BorderSide(color: Colors.black),
      textColor: Colors.black,
      child: Text(provider.isLogin ? 'Accesa' : 'Registrate'),
      onPressed: () => submit(context),
    );
  }

  Widget buildSignupButton(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);

    return FlatButton(
      textColor: Theme.of(context).primaryColor,
      child: Text(
        provider.isLogin ? 'Crea una nueva cuenta' : 'Ya tengo una cuenta',
      ),
      onPressed: () => provider.isLogin = !provider.isLogin,
    );
  }

  Widget buildEmailField(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);

    return TextFormField(
      key: const ValueKey('email'),
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      enableSuggestions: false,
      validator: (value) {
        const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
        final regExp = RegExp(pattern);

        if (!regExp.hasMatch(value!)) {
          return 'Ingresa un correo valido';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(labelText: 'Correo electronico'),
      onSaved: (email) => provider.userEmail = email!,
    );
  }

  Widget buildPasswordField(BuildContext context) {
    final provider = Provider.of<EmailSignInProvider>(context);

    return TextFormField(
      key: const ValueKey('password'),
      validator: (value) {
        if (value!.isEmpty || value.length < 7) {
          return 'La contraseña debe ser al menos de 7 caracteres';
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(labelText: 'Contraseña'),
      obscureText: true,
      onSaved: (password) => provider.userPassword = password!,
    );
  }

  Future submit(BuildContext context) async {
    final provider = Provider.of<EmailSignInProvider>(context, listen: false);

    final isValid = _formerKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formerKey.currentState!.save();

      final isSuccess = await provider.login();

      if (isSuccess!) {
        Navigator.of(context).pop();
      } else {
        const message = 'Upps, hubo un error checa tus credenciales!';

        _scaffoldKey.currentState?.showSnackBar(
          SnackBar(
            content: const Text(message),
            backgroundColor: Theme.of(context).errorColor,
          ),
        );
      }
    }
  }
}
