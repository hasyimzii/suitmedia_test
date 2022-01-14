import 'package:flutter/material.dart';

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
                TextInput(
                  formKey: _formKey,
                  controller: _nameController,
                  label: 'Name',
                ),
                const SizedBox(height: 22.12),
                TextInput(
                  formKey: _formKey,
                  controller: _palindromeController,
                  label: 'Palindrome',
                ),
                const SizedBox(height: 45),
                SubmitButton(
                  label: 'CHECK',
                  onPressed: () {},
                ),
                SubmitButton(
                  label: 'NEXT',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
