import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/app/modules/home/views/home_view.dart';
import 'package:property_app/app/contants/app_colors.dart';
import 'package:property_app/app/modules/register/controllers/register_controller.dart';
import 'package:property_app/app/modules/register/views/components/verify_identity.dart';

enum UserType { user, owner }

class UserTypeSelection extends StatefulWidget {
  const UserTypeSelection({Key? key}) : super(key: key);

  @override
  State<UserTypeSelection> createState() => _UserTypeSelectionState();
}

class _UserTypeSelectionState extends State<UserTypeSelection> {
  FocusNode _textFieldFocus = FocusNode();

  UserType? _userType = UserType.user;

  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Select Any One",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: textColorDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                Container(
                  child: Column(
                    children: [
                      RadioListTile<UserType>(
                        title: Text(
                          'User',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,color:Colors.black
                          ),
                        ),
                        autofocus: false,
                        selected: false,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 120),
                        activeColor: Color(0xFF7AA721),
                        value: UserType.user,
                        groupValue: _userType,
                        onChanged: (UserType? value) {
                          setState(() {
                            _userType = value;
                          });
                          controller.userType.value = 'User';
                          // Get.to(HomeView());
                        },
                      ),
                      RadioListTile<UserType>(
                        title: Text(
                          'Owner',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,color:Colors.black
                          ),
                        ),
                        autofocus: false,
                        selected: false,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 120),
                        activeColor: Color(0xFF7AA721),
                        value: UserType.owner,
                        groupValue: _userType,
                        onChanged: (UserType? value) {
                          setState(() {
                            _userType = value;
                          });
                          controller.userType.value = 'Owner';
                        },
                      ),
                      const SizedBox(height: 142),
                      InkWell(
                        onTap: () {
                          Get.to(VerifyUserIdentity());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                              begin: Alignment(1.0, 1.0),
                              end: Alignment(1.0, 0.0),
                              colors: [
                                Color(0xFFB5EB49),
                                Color(0xFF7AA721),
                              ],
                            ),
                          ),
                        ),
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
