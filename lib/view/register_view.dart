import 'package:auth_app_firebase/cubits/register_cubit/register_cubit.dart';
import 'package:auth_app_firebase/view/login_view.dart';
import 'package:auth_app_firebase/widgets/custom_formfield.dart';
import 'package:auth_app_firebase/widgets/snak_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final phoneController = TextEditingController();

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            showSnakBar(context, 'Register Success', Colors.green);
          } else if (state is RegisterErrorState) {
            showSnakBar(context, state.error, Colors.red);
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
                          height: 45,
                        ),
                        const Text(
                          "Get Started",
                          style: TextStyle(
                              color: Color(0xff141A33),
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "by creating a free account.",
                          style: TextStyle(
                              color: Color(0xff505673),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Full Name",
                          style: TextStyle(
                            color: Color(0xff2B2D31),
                            fontSize: 16,
                            // fontWeight: FontWeight.w600
                          ),
                        ),
                        CustomFormField(
                          controller: emailController,
                          hintText: 'Email',
                          suffixicon: const Icon(Icons.account_circle_outlined),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Password",
                          style: TextStyle(
                            color: Color(0xff2B2D31),
                            fontSize: 16,
                            // fontWeight: FontWeight.w600
                          ),
                        ),
                        CustomFormField(
                          controller: passwordController,
                          suffixicon: const Icon(Icons.lock),
                          hintText: 'Strong password',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Re- Password",
                          style: TextStyle(
                            color: Color(0xff2B2D31),
                            fontSize: 16,
                            // fontWeight: FontWeight.w600
                          ),
                        ),
                        CustomFormField(
                          controller: confirmPasswordController,
                          suffixicon: const Icon(Icons.lock),
                          hintText: 'Re- Password',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Phone number",
                          style: TextStyle(
                            color: Color(0xff2B2D31),
                            fontSize: 16,
                            // fontWeight: FontWeight.w600
                          ),
                        ),
                        CustomFormField(
                          controller: phoneController,
                          suffixicon: const Icon(Icons.phone_android),
                          hintText: 'Your Phone number',
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              RegisterCubit.get(context).registerUser(
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
                              "Already have an account?",
                              style: TextStyle(
                                color: Color(0xff141A33),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginView(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Log In",
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
