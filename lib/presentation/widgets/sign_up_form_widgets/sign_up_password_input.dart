import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/colors.dart';
import '../../cubits/sign_up_cubit/sign_up_cubit.dart';

class SignUpPasswordInput extends StatefulWidget {
  const SignUpPasswordInput({super.key});

  @override
  State<SignUpPasswordInput> createState() => _SignUpPasswordInputState();
}

class _SignUpPasswordInputState extends State<SignUpPasswordInput> {
  bool _showPassword = false;

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
              onChanged: (password) =>
                  context.read<SignUpCubit>().passwordChanged(password),
              obscureText: !_showPassword,
              decoration: InputDecoration(
                labelText: 'Пароль',
                errorText: state.password.displayError != null
                    ? 'invalid password'
                    : null,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  child: const Icon(
                    Icons.visibility,
                    color: UIColors.blue,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
