import 'package:flutter/material.dart';
import 'package:grad_project_last_v/componentes/custom_text_field.dart';
import 'package:grad_project_last_v/screens/login_screen.dart';
import 'package:grad_project_last_v/services/change_passowrd.dart';
import 'package:grad_project_last_v/services/test_new_login_logic.dart';

class ChangePassword extends StatelessWidget {
  static const String routeName = 'change password';
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController oldPass = TextEditingController();
    TextEditingController newPass = TextEditingController();
    TextEditingController confirmNewPass =
        TextEditingController();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            backgroundColor: const Color(0xff0D63A7),
          )),
      body: SingleChildScrollView(
        child: Container(
          height: height * 0.5,
          padding: const EdgeInsetsDirectional.all(5),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xff1F9CFC),
              borderRadius: BorderRadius.circular(12)),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Change Password',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                TextFormComponenet(
                  prefexIcon: const Icon(Icons.lock),
                  labelText: 'Old Password',
                  controller: oldPass,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter password';
                    }
                    if (text.length < 6) {
                      return 'password must have at least 6 chars';
                    }
                  },
                ),
                TextFormComponenet(
                  isPassword: true,
                  prefexIcon: const Icon(Icons.lock),
                  labelText: 'New Password',
                  controller: newPass,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter New password';
                    }
                    if (text.length < 6) {
                      return 'password must have at least 6 chars';
                    }
                  },
                ),
                TextFormComponenet(
                  isPassword: true,
                  prefexIcon: const Icon(Icons.lock),
                  labelText: 'Confirm Password',
                  controller: confirmNewPass,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'please enter password';
                    }
                    if (text.length < 6) {
                      return 'password must have at least 6 chars';
                    }
                  },
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: const Color(0xff3495DF)),
                    onPressed: ()  async{
                      if (formKey.currentState?.validate() == false) return;
                      await ChangePasswordService.changePassword(
                          LoginServiceAfterTesting.parentData['data']
                              ['Parent ID'],
                          oldPass.text,
                          newPass.text,
                          confirmNewPass.text,
                          LoginServiceAfterTesting.parentData['data']['token']);
                       ChangePasswordService.flag==true?
                      showDialog(
                          context: context,
                          builder: (_) {

                            return AlertDialog(
                              content: const Text('successfully'),
                              actions: [
                                TextButton(

                                  onPressed:(){
                                    Navigator.of(context).pop;
                                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          }):  showDialog(
                           context: context,
                           builder: (_) {
                             return AlertDialog(
                               content: const Text('check yor entry data'),
                               actions: [
                                 TextButton(
                                   onPressed: Navigator.of(context).pop,
                                   child: const Text('Ok'),
                                 ),
                               ],
                             );
                           });
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
