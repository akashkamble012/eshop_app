import 'package:eshop/features/order/presentation/pages/PlaceOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

import '../../../../common/Utility/Textform.dart';
import '../../../../core/Helper/styles.dart';
import '../../../../core/popMessage/snackbar_message.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widget/cicular_login_widget.dart';
import '../../../../core/widget/custom_text_button.dart';
import '../../../product/presentation/pages/Product_home_screen.dart';
import '../bloc/auth/signin/auth_signin_bloc.dart';
import 'signUpScreen.dart';

class SignIn extends StatefulWidget {
  static const routeName = '/SignIn';
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? _emailId;
  String? _passwrod;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final radius = mediaQuery.size.height * 0.25;
    final result = ModalRoute.of(context)!.settings.arguments as Map;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            CicularAuthWidget(radius: radius),
            Styles.sizedBoxH15,
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: Styles.edgeInsetsAll15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: const [
                          __SingninEmailInput(),
                          Styles.sizedBoxH10,
                          __SigninPasswordInput(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomTextButton(
                            onPressed: () {
                              print('%%%% $result');
                              print('Hello');
                            },
                            backgroundColor: AppColor.white,
                            textColor: AppColor.black,
                            buttonName: 'Forgot Password.?',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SigninButton(
                    whereToPopUP: result['drawer'] as bool,
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account.?'),
                    TextButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).pushReplacementNamed(SignUp.routeName, arguments: {
                          'drawer': result['drawer'],
                        });
                      },
                      child: const Text('Sign up'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class __SingninEmailInput extends StatelessWidget {
  const __SingninEmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthSigninBloc, AuthSigninState>(
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
                BlocProvider.of<AuthSigninBloc>(context).add(EmailChangeSigninEvent(value));
              },
            ),
          ],
        );
      },
    );
  }
}

class __SigninPasswordInput extends StatelessWidget {
  const __SigninPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthSigninBloc, AuthSigninState>(
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
                BlocProvider.of<AuthSigninBloc>(context).add(PasswordChangeSigninEvent(value));
              },
            ),
          ],
        );
      },
    );
  }
}

class SigninButton extends StatelessWidget {
  final bool whereToPopUP;
  const SigninButton({Key? key, required this.whereToPopUP}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthSigninBloc, AuthSigninState>(
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
            buttonName: 'Sign in',
            size: const Size(100, 40),
            radius: 5,
            backgroundColor: state.formzStatus == FormzStatus.valid ? AppColor.secondaryColor : Colors.grey,
            onPressed: state.formzStatus == FormzStatus.valid
                ? () {
                    BlocProvider.of<AuthSigninBloc>(context).add(const AuthSigninButtonEvent());
                  }
                : null);
      },
    );
  }
}
