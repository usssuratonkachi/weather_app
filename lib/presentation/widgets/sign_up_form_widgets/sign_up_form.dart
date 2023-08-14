import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:weather_app/presentation/widgets/sign_up_form_widgets/sign_up_button.dart';
import 'package:weather_app/presentation/widgets/sign_up_form_widgets/sign_up_password_input.dart';

import '../../../ui/font_styles.dart';
import '../../cubits/sign_up_cubit/sign_up_cubit.dart';
import '../../pages/login_page.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
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
                  'Регистрация',
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
                'Введите данные для регистрации',
                style: UIFontStyles.B2,
              ),
            ),
          ),
          _EmailInput(),
          const SignUpPasswordInput(),
          const SignUpButton(),
          TextButton(
            onPressed: () =>
                Navigator.of(context).push<void>(LoginPage.route()),
            child: const Text(
              'у меня есть аккаунт',
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
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
          child: SizedBox(
            width: 327,
            height: 64,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (email) =>
                  context.read<SignUpCubit>().emailChanged(email),
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
