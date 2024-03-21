import 'package:auth_app_firebase/cubits/login_cubit/login_cubit.dart';
import 'package:auth_app_firebase/view/register_view.dart';
import 'package:auth_app_firebase/widgets/custom_formfield.dart';
import 'package:auth_app_firebase/widgets/snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            showSnakBar(context, 'Login Success', Colors.green);
          } else if (state is LoginErrorgState) {
            if (state.error == 'user-not-found') {
              showSnakBar(context, 'User Not Found', Colors.red);
            } else if (state.error == 'wrong-password') {
              showSnakBar(context, 'Wrong Password', Colors.red);
            } else {
              showSnakBar(context, 'Login Error', Colors.red);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        const Text(
                          "Welcome Back!",
                          style: TextStyle(
                              color: Color(0xff141A33),
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "sign in to access your account",
                          style: TextStyle(
                              color: Color(0xff505673),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(
                            color: Color(0xff2B2D31),
                            fontSize: 16,
                            // fontWeight: FontWeight.w600
                          ),
                        ),
                        CustomFormField(
                          controller: emailController,
                          hintText: 'Enter Your email',
                          suffixicon: const Icon(Icons.email),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "password",
                          style: TextStyle(
                            color: Color(0xff2B2D31),
                            fontSize: 16,
                            // fontWeight: FontWeight.w600
                          ),
                        ),
                        CustomFormField(
                          controller: passwordController,
                          suffixicon: const Icon(Icons.lock),
                          hintText: 'password',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forget Password?',
                                  style: TextStyle(
                                    color: Color(0xff1003CE),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xff1003CE),
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              LoginCubit.get(context).loginUser(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            // width: 300,
                            decoration: BoxDecoration(
                              color: const Color(0xff1003CE),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffF5F6FA),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  weight: 6,
                                  size: 18,
                                  color: Color(0xffF5F6FA),
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "don't have an account?",
                              style: TextStyle(
                                color: Color(0xff141A33),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterView(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Register now",
                                style: TextStyle(
                                  color: Color(0xff1003CE),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
