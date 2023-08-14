import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:weather_app/presentation/cubits/login_cubit/login_cubit.dart';

import '../../../ui/colors.dart';
import '../../../ui/font_styles.dart';
import '../../blocs/app_bloc/app_bloc.dart';
import '../../cubits/sign_up_cubit/sign_up_cubit.dart';
import '../../pages/login_page.dart';
import '../../pages/weather_page.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
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
                        onPressed: () {
                          context.read<SignUpCubit>().signUpFormSubmitted();

                        },
                        child: Text(
                          'Зарегистрироваться',
                          style: UIFontStyles.B1medium,
                        ))),
              );
      },
    );
  }
}
