import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../ui/colors.dart';
import '../../../ui/font_styles.dart';
import '../../cubits/login_cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const CircularProgressIndicator()
            : Container(
                padding: const EdgeInsets.only(top: 24),
                child: SizedBox(
                    width: 327,
                    height: 48,
                    child: MaterialButton(
                      color: UIColors.blue,
                      shape: StadiumBorder(),
                      onPressed: () =>
                          context.read<LoginCubit>().logInWithCredentials(),
                      child: Text(
                        'Войти',
                        style: UIFontStyles.B1medium,
                      ),
                    )),
              );
      },
    );
  }
}
