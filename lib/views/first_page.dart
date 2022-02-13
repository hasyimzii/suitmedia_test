import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/name_provider.dart';
import '../providers/palindrome_provider.dart';

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
                      Consumer<PalindromeProvider>(
                        builder: (
                          BuildContext context,
                          PalindromeProvider palindrome,
                          Widget? child,
                        ) {
                          return SubmitButton(
                            label: 'CHECK',
                            onPressed: () {
                              // validate form
                              if (_formKey.currentState!.validate()) {
                                // run palindrome check
                                palindrome.check(_palindromeController.text);

                                // set dialog snackbar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: const Duration(seconds: 2),
                                    content: Text(palindrome.result),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                      Consumer<NameProvider>(
                        builder: (
                          BuildContext context,
                          NameProvider name,
                          Widget? child,
                        ) {
                          return SubmitButton(
                            label: 'NEXT',
                            onPressed: () {
                              // validate form
                              if (_formKey.currentState!.validate()) {
                                name.setName(_nameController.text);
                                Navigator.pushNamed(
                                  context,
                                  '/second_page',
                                );
                              }
                            },
                          );
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
