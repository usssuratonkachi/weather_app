import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/colors.dart';
import '../../cubits/login_cubit/login_cubit.dart';

class LoginPasswordInput extends StatefulWidget {
  const LoginPasswordInput({super.key});

  @override
  State<LoginPasswordInput> createState() => _LoginPasswordInputState();
}

class _LoginPasswordInputState extends State<LoginPasswordInput> {
  bool _showPassword = false;

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
              onChanged: (password) =>
                  context.read<LoginCubit>().passwordChanged(password),
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
