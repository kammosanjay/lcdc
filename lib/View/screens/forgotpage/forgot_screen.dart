import 'package:flutter/material.dart';
import 'package:lcdc_mobile_app/constant/customWidget.dart';


class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(onTap: () {
      FocusScope.of(context).unfocus();
    },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('ForgotScreen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Container(
                  child: Text(
                    "Forgot Password!",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              CustomWidgets.customTextFeild(
                context: context,
                name: 'email',
                hint: 'Email',
                // focusNode: FocusNode(),
                icon: Icon(Icons.email),
                iconColor: Colors.blue,
                // width: w*0.43,
                isPassword: false,
                action: TextInputAction.next,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  // Left Divider
                  Expanded(
                    child: Divider(
                      height: 0,
                      indent: 20,
                      thickness: 1,
                      color: Colors.blue,
                    ),
                  ),
                  // Text in the center
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "or",
                      style:
                          TextStyle(color: Colors.blue), // Customize text style
                    ),
                  ),
                  // Right Divider
                  Expanded(
                    child: Divider(
                      endIndent: 20,
                      height: 0,
                      thickness: 1,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomWidgets.customTextFeild(
                context: context,
                name: 'phone',
                hint: 'Phone',
                // focusNode: FocusNode(),
                icon: Icon(Icons.phone),
                iconColor: Colors.blue,
                // width: w*0.43,
                isPassword: false,
                action: TextInputAction.next,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Get.toNamed(MyPageNames.home);
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(w, 50), // Width: 200, Height: 50
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Set border radius
                    ), // Button color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
