import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  final _phoneNumberController = TextEditingController();

  LoginPage({super.key});

  Future<void> _signInWithPhone(BuildContext context) async {
    final String phoneNumber = _phoneNumberController.text.trim();

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Otomatik doğrulama tamamlandığında
        // credential ile oturum açma işlemini tamamlayabilirsiniz.
      },
      verificationFailed: (FirebaseAuthException e) {
        // Doğrulama başarısız olduğunda hata durumunu işleyebilirsiniz.
      },
      codeSent: (String verificationId, int? resendToken) {
        // Doğrulama kodu başarıyla gönderildiğinde
        // verificationId ve resendToken ile ilgili işlemleri gerçekleştirebilirsiniz.
        // Örneğin, kodu kullanıcıya girmesi için başka bir sayfaya yönlendirebilirsiniz.
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Kod otomatik olarak alınma süresi dolduğunda işlemleri gerçekleştirebilirsiniz.
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _signInWithPhone(context),
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
