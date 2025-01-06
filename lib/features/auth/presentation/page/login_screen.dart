import 'package:auto_route/auto_route.dart';
import 'package:beep_shop/features/auth/data/model/auth_model.dart';
import 'package:beep_shop/features/auth/logic/bloc/auth_bloc.dart';
import 'package:beep_shop/router/router.gr.dart';
import 'package:beep_shop/shared/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _userNameController;

  late final TextEditingController _passwordController;

  @override
  void initState() {
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthIsSucces) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Connexion reussie !',
                  style: TextStyle(color: Colors.white)),
              duration: const Duration(seconds: 5), // Durée d'affichage
              action: SnackBarAction(
                backgroundColor: Colors.green,
                label: 'Annuler',
                onPressed: () {
                  // Action du bouton
                  print('Action annulée');
                },
              ),
            ),
          );
          context.router.replaceAll([const HomeRoute()]);
        } else if (state is AuthIsFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Echec pendant la connexion ! : ${state.error}',
                style: const TextStyle(color: Colors.white),
              ),
              duration: const Duration(seconds: 5),
              action: SnackBarAction(
                label: 'Annuler',
                backgroundColor: Colors.red,
                onPressed: () {
                  // Action du bouton
                  print('Action annulée');
                },
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.1),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/icons/launch_icons.jpeg",
                        height: 100,
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.1),
                    Text(
                      "Sign In",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _userNameController,
                            decoration: const InputDecoration(
                              hintText: 'Username',
                              filled: true,
                              fillColor: Color(0xFFF5FCF9),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0 * 1.5, vertical: 16.0),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "veuillez entrer un email";
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                filled: true,
                                fillColor: Color(0xFFF5FCF9),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0 * 1.5, vertical: 16.0),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                              ),
                              validator: (passaword) {
                                if (passaword!.isEmpty) {
                                  return "veuillez entrer un mot de passe ";
                                }
                                return null;
                              },
                            ),
                          ),
                          BlocBuilder<AuthBloc, AuthState>(
                            bloc: getIt.get<AuthBloc>(),
                            builder: (context, state) {
                              return ElevatedButton(
                                onPressed: state is AuthIsLoading
                                    ? null
                                    : () {
                                        if (_formKey.currentState!.validate()) {
                                          getIt.get<AuthBloc>().add(
                                                LoginEvent(
                                                  authLoginModel:
                                                      AuthLoginModel(
                                                    password:
                                                        _passwordController
                                                            .text,
                                                    username:
                                                        _userNameController
                                                            .text,
                                                  ),
                                                ),
                                              );
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(double.infinity, 48),
                                  shape: const StadiumBorder(),
                                ),
                                child: state is AuthIsLoading
                                    ? const SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: CircularProgressIndicator(
                                          color: Colors.green,
                                        ))
                                    : const Text("Sign in"),
                              );
                            },
                          ),
                          const SizedBox(height: 16.0),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(0.64),
                                  ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text.rich(
                              TextSpan(
                                text: "Don’t have an account? ",
                                children: [
                                  TextSpan(
                                    text: "Sign Up",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                ],
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color!
                                        .withOpacity(0.64),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
