import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        // هامش من الجوانب
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          // 🔥 يجعل النصوص على اليمين
          children: [
            SizedBox(height: 40), // مسافة من الأعلى
            Align(
              alignment: Alignment.centerLeft, // 🔥 زر الرجوع يكون على الشمال
              child: MaterialButton(
                minWidth: 20,
                shape: RoundedRectangleBorder(), // يجعل الزر دائريًا
                onPressed: () {
                  Navigator.pushNamed(context, "LoginScreen");
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "نسيت كلمة المرور؟",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك وسنرسل لك رمز التأكيد.",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Text(
              "البريد الإلكتروني",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "أدخل بريدك الإلكتروني",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.black87),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Color(0xFF8B4513)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity, // 🔥 يجعل الزر بعرض الشاشة
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF8B4513),
                  padding: EdgeInsets.symmetric(vertical: 12), // تعديل الارتفاع
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "CheckPassword");
                },
                child: Text(
                  "إرسال",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
