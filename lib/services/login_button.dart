import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:http/http.dart' as http;
// import 'package:kawi_go/models/user_test.dart';
// import 'package:kawi_go/state/auth_state.dart';
import 'package:kawi_go/state/verfy.dart';
// import 'package:kawi_go/utilities/constants/constants.dart';
import 'package:provider/provider.dart';

class LoginButtons extends StatefulWidget {
  const LoginButtons({required this.email, required this.password});
  final TextEditingController email;
  final TextEditingController password;

  @override
  State<LoginButtons> createState() => _LoginButtonsState();
}

class _LoginButtonsState extends State<LoginButtons> {
  bool _loading = false;
@override
  Widget build(BuildContext context) {
    return Consumer<VerifyAuthProvider>(
      builder: (context, verifyAuthProvider, child) {
        return SizedBox(
          width: double.infinity,
          height: 48,
          child: FilledButton(
            onPressed: //_loading ? null : () => verifyAuthProvider.,
            () async {
              print("=============START ======");
              print("============= ${verifyAuthProvider.loading}");
              // if (verifyAuthProvider.loading) {
                final emailVal = widget.email.text.trim();
                final passwordVal = widget.password.text.trim();

                // validate inputs

                if (emailVal.isEmpty || passwordVal.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Enter email/phone and password'),
                    ),
                  );
                  return;
                }else{
                 await  verifyAuthProvider.login(emailVal, passwordVal);
                }
                //
                if (verifyAuthProvider.isLoggedIn) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/dashboard',
                    (r) => false,
                  );
                }
              
              print("=============> ${verifyAuthProvider.loading}");
              print("=============END ======");
            },
            child: verifyAuthProvider.loading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text('Login'),
          ),
        );
      },
    );