import 'package:eshop/core/Helper/styles.dart';
import 'package:eshop/core/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../common/Utility/Textform.dart';
import '../../../../core/popMessage/snackbar_message.dart';
import '../../../../core/theme/app_color.dart';
import '../../../order/presentation/pages/PlaceOrder.dart';
import '../../../product/presentation/pages/Product_home_screen.dart';
import '../bloc/auth/siginup/auth_signup_bloc.dart';
import '../bloc/auth/signin/auth_signin_bloc.dart';
import 'signInScreen.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/SignUp';
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // bool _isSignIn = true;
  String? userName;
  String? emailId;
  String? passWord;

  Future<void> signUp() async {
    // final authController = Get.find<AuthController>();

    // print('$userName,$emailId,$passWord');
    // if (!isValid) {
    //   return;
    // }
    // _form.currentState!.save();
    // var _isUserCreate = await authController.creatUser(
    //   userName: userName!,
    //   emailId: emailId!,
    //   passWord: passWord!,
    // );

    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('${_isUserCreate['message']}'),
    //   ),
    // );
    // if (_isUserCreate['message'].toString().contains('success')) {
    //   await Future.delayed(const Duration(microseconds: 200));
    //   Navigator.of(context).pop();
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final radius = mediaQuery.size.height * 0.25;
    final result = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Container(
              height: radius,
              width: radius,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(radius)),
                color: Theme.of(context).primaryColor,
              ),
            ),
            Styles.sizedBoxH10,
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: Styles.edgeInsetsAll15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Styles.sizedBoxH15,
                      SizedBox(
                        child: Column(
                          children: const [
                            Styles.sizedBoxH10,
                            __SingnupEmailInput(),
                            Styles.sizedBoxH10,
                            __SignupPasswordInput(),
                            Styles.sizedBoxH10,
                            __SignupPasswordConfirmInput(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                __SignupButton(whereToPopUP: result['drawer'] as bool),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Alread have an account'),
                    TextButton(
                      onPressed: () {
                        print('%%%% $result');

                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pushReplacementNamed(SignIn.routeName, arguments: {
                          'drawer': result['drawer'],
                        });
                      },
                      child: const Text(
                        'Sign in',
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class __SingnupEmailInput extends StatelessWidget {
  const __SingnupEmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthSignupBloc, AuthSignupState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Email Id'),
            Styles.sizedBoxH04,
            InputField(
              hintText: 'Email',
              errorText: state.email.invalid ? state.email.error : null,
              borderRadius: 5,
              prefixIcon: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
              onChanged: (value) {
                BlocProvider.of<AuthSignupBloc>(context).add(EmailChangeSignupEvent(value));
              },
            ),
          ],
        );
      },
    );
  }
}

class __SignupPasswordInput extends StatelessWidget {
  const __SignupPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthSignupBloc, AuthSignupState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Password'),
            Styles.sizedBoxH04,
            InputField(
              hintText: 'Password',
              borderRadius: 5,
              errorText: state.password.invalid ? state.password.error : null,
              prefixIcon: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
              onChanged: (value) {
                BlocProvider.of<AuthSignupBloc>(context).add(PasswordChangeSignupEvent(value));
              },
            ),
          ],
        );
      },
    );
  }
}

class __SignupPasswordConfirmInput extends StatelessWidget {
  const __SignupPasswordConfirmInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthSignupBloc, AuthSignupState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Confirm'),
            Styles.sizedBoxH04,
            InputField(
              hintText: 'Confirm',
              borderRadius: 5,
              prefixIcon: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
              onChanged: (value) {
                BlocProvider.of<AuthSignupBloc>(context).add(ConfirmPasswordChangeSignupEvent(value));
              },
            ),
          ],
        );
      },
    );
  }
}

class __SignupButton extends StatelessWidget {
  final bool whereToPopUP;
  const __SignupButton({
    Key? key,
    required this.whereToPopUP,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSignupBloc, AuthSignupState>(
      listener: (context, state) {
        if (state.formzStatus.isSubmissionFailure || state.formzStatus.isSubmissionSuccess) {
          snackBarMessage(context, message: state.message);
        }
        if (state.formzStatus.isSubmissionSuccess) {
          if (whereToPopUP) {
            Navigator.of(context).popUntil(ModalRoute.withName(ProductHomeScreen.routeName));
          } else if (!whereToPopUP) {
           Navigator.of(context).pushReplacementNamed(PlaceOrders.routeName);
          }
        }
      },
      builder: (context, state) {
        if (state.formzStatus == FormzStatus.submissionInProgress) {
          return const CircularProgressIndicator();
        }
        return CustomTextButton(
            buttonName: 'Sign Up',
            size: const Size(100, 40),
            radius: 5,
            backgroundColor: state.formzStatus == FormzStatus.valid ? AppColor.secondaryColor : Colors.grey,
            onPressed: state.formzStatus == FormzStatus.valid
                ? () {
                    BlocProvider.of<AuthSignupBloc>(context).add(const AuthSignupButtonEvent());
                  }
                : null);
      },
//
    );
  }
}
