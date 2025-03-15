import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "القراءن الكريم ",
            style: TextStyle(
                color: Color(0xFF8B4513) // بني شوكولاتة جميل
                ,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: "Noto Kufi Arabic"),
          ),
          Text(
            textAlign: TextAlign.center,
            maxLines: 2,
            softWrap: true,
            "قم بتسجيل الدخول او انشاء حساب جديد لحفظ تقدمك",
            style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontFamily: "Noto Kufi Arabic"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "تسجيل الدخول",
                  )),
              TextButton(onPressed: () {}, child: Text("انشاء حساب"))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "البريد الالكتروني",
                      textAlign: TextAlign.right,
                    ),
                  ),SizedBox(height: 20,),

                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        hintText: "ادخل بريدك الالكتروني",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black87),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Color(0xFF8B4513)),
                        )),
                  ),
                  SizedBox(height: 20,),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "كلمة المرور",
                      textAlign: TextAlign.right,
                    ),
                  ),SizedBox(height: 20,),

                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        hintText: "ادخل كلمة المرور",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.black87),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Color(0xFF8B4513)),
                        )),
                  ),TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, "ForgetPassword");
                      },child: Text(textAlign: TextAlign.left,"نسيت كلمة المرور؟")),
                ],
              ),
            ),
          ),
          TextButton(onPressed: (){}, child:Text("تسجيل الدخول")),
          Text("خيارات تسجيل الدخول الاخري"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             IconButton(onPressed: (){}, icon: Icon(Icons.facebook,color: Colors.blue,size: 30,)),
              MaterialButton(onPressed: (){},child: Image(image: AssetImage("images/google.png"),width: 30,height: 30,),),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.apple, color: Colors.black, size: 30),
                onPressed: () {

                },
              )

            ],
          )

        ],
      ),
    );
  }
}
