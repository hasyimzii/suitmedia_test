import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/name/name_cubit.dart';
import '../blocs/palindrome/palindrome_cubit.dart';

import '../widgets/text_input.dart';
import '../widgets/submit_button.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _palindromeController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/btn_add_photo.png',
                  width: 116,
                  height: 116,
                ),
                const SizedBox(height: 58.12),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextInput(
                        controller: _nameController,
                        label: 'Name',
                      ),
                      const SizedBox(height: 22.12),
                      TextInput(
                        controller: _palindromeController,
                        label: 'Palindrome',
                      ),
                      const SizedBox(height: 45),
                      BlocListener<PalindromeCubit, PalindromeState>(
                        listener: (context, state) {
                          if (state is PalindromeResult) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 2),
                                content: Text(state.message),
                              ),
                            );
                          }
                        },
                        child: SubmitButton(
                          label: 'CHECK',
                          onPressed: () {
                            // validate form
                            if (_formKey.currentState!.validate()) {
                              // run palindrome check
                              PalindromeCubit _cubit =
                                  context.read<PalindromeCubit>();
                              _cubit.checkPalindrome(
                                _palindromeController.text,
                              );
                            }
                          },
                        ),
                      ),
                      SubmitButton(
                        label: 'NEXT',
                        onPressed: () {
                          // validate form
                          NameCubit _nameCubit = context.read<NameCubit>();
                          if (_formKey.currentState!.validate()) {
                            _nameCubit.setName(_nameController.text);
                            Navigator.pushNamed(
                              context,
                              '/second_page',
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
