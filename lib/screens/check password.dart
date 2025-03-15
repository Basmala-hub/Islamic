import 'package:flutter/material.dart';

class CheckPassword extends StatelessWidget {
  const CheckPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: MaterialButton(
                minWidth: 20,
                shape: RoundedRectangleBorder(),
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
              "رمز التحقق",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                  color: Color(0xFF8B4513),
                  fontFamily: "Noto Kufi Arabic"),
            ),
            SizedBox(height: 10),
            Text(
              "ادخل الرمز الذي ارسلناه الي رقمك",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16, color: Colors.grey,fontFamily: "Noto Kufi Arabic"),
            ),
            Row(children: [
              // TextFormField(
              //
              //   decoration: InputDecoration(
              //     enabledBorder: OutlineInputBorder(
              //        borderRadius: BorderRadius.circular(15)
              //     )
              //   ),
              // )
            ],),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF8B4513),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "WholeSerivce");
                },
                child: Text(
                  "تحقق",
                  style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: "Noto Kufi Arabic"),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(onPressed: () {}, child: Text("اعادة ارسال",style: TextStyle(fontFamily: "Noto Kufi Arabic",color: Color(0xFF8B4513)),)),
                Text("لم تستلم الرمز؟",style: TextStyle(fontFamily: "Noto Kufi Arabic"),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
