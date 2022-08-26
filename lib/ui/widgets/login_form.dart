import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qdesc_test/data/models/dt_status.dart';
import 'package:qdesc_test/ui/bloc/auth_cubit/auth_cubit.dart';
import 'package:qdesc_test/ui/screens/main_screen.dart';

import '../../core/icons/app_icon.dart';
import '../../data/models/dt_status.dart';
import '../../data/models/dt_status.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var cubit = AuthCubit();
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      bloc: cubit,
      listener: (context, state) {
        if (state.status!.isLoaded) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          child: Container(
            height: MediaQuery.of(context).size.height / 2.1,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.green,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        controller: emailController,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 5, 0, 0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: 'Enter your email',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can\'t be empty";
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: _isObscure,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field can\'t be empty";
                          }
                        },
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: _isObscure
                                ? const Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 13, 0),
                                    child: Icon(
                                      AppIcon.eye,
                                      size: 11,
                                    ),
                                  )
                                : const Icon(Icons.remove_red_eye_outlined),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 5, 0, 0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(color: Colors.white38),
                          ),
                          hintText: 'Enter your password',
                        ),
                      ),
                    ),
                    state.status!.isError
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Text(
                              state.status!.errorMessage.toString(),
                              style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : const SizedBox(
                            height: 18,
                          ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: FittedBox(
                        child: Row(
                          children: [
                            Checkbox(
                              visualDensity: VisualDensity.compact,
                              value: false,
                              onChanged: (value) {
                                //TODO: make checkbox for remember credentials
                              },
                            ),
                            const Text('Remember for 30 days'),
                            const SizedBox(
                              width: 40,
                            ),
                            TextButton(
                              style:
                                  TextButton.styleFrom(primary: Colors.green),
                              onPressed: () {
                                //TODO: add link to restore
                              },
                              child: const Text('RESTORE PASSWORD'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        submit(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        fixedSize: const Size(350, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    cubit.login(emailController.text, passwordController.text);
  }
}
