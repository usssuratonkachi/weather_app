import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:weather_app/presentation/widgets/login_form_widgets/login_button.dart';

import '../../../ui/font_styles.dart';
import '../../cubits/login_cubit/login_cubit.dart';
import '../../pages/sign_up_page.dart';
import 'login_password_input.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 2),
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.only(top: 60),
              alignment: Alignment.center,
              child: SizedBox(
                width: 327,
                child: Text(
                  'Вход',
                  style: UIFontStyles.H1,
                ),
              )),
          Container(
            padding: const EdgeInsets.only(top: 12),
            alignment: Alignment.center,
            child: SizedBox(
              width: 327,
              height: 22,
              child: Text(
                'Введите данные для входа',
                style: UIFontStyles.B2,
              ),
            ),
          ),
          _EmailInput(),
          const LoginPasswordInput(),
          const LoginButton(),
          TextButton(
            onPressed: () =>
                Navigator.of(context).push<void>(SignUpPage.route()),
            child: Text(
              'создать аккаунт',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
          child: SizedBox(
            width: 327,
            height: 64,
            child: TextField(
              onChanged: (email) =>
                  context.read<LoginCubit>().emailChanged(email),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText:
                    state.email.displayError != null ? 'invalid email' : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
