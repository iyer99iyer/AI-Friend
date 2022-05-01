import 'package:ai_friend/ui/signup/signup_view.form.dart';
import 'package:ai_friend/ui/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../startup/widgets/integration_login_button.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'name'),
  FormTextField(name: 'password'),
  FormTextField(name: 'confirmPassword'),
])
class SignupView extends StatelessWidget with $SignupView{
  SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
        onModelReady: (model) => model.init(listenToFormUpdated,emailController,nameController,passwordController,confirmPasswordController),
        builder: (context, model, child) => SafeArea(
          child: Scaffold(
            body: Container(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                          AssetImage('assests/images/undraw_Business.png'),
                          fit: BoxFit.fill
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric( horizontal: 16.0, vertical: 8.0),
                      width: double.infinity,
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.roboto(
                            fontSize: 32, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IntegrationLoginButton(
                            onTap: (name) {
                              print(name);
                              model.doGoogleSignup();
                            },
                            imagePath: 'assests/images/google.png',
                            name: 'google',
                          ),
                          IntegrationLoginButton(
                            onTap: (name) {
                              print(name);
                            },
                            imagePath: 'assests/images/facebook.png',
                            name: 'facebook',
                          ),
                          IntegrationLoginButton(
                            onTap: (name) {
                              print(name);
                            },
                            imagePath: 'assests/images/apple.png',
                            name: 'apple',
                          ),
                        ],
                      ),
                    ),
                    Text('Or, register with email...',style: GoogleFonts.roboto(color: Colors.black38),),
                    Container(
                      padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: TextField(
                              onChanged: (value){
                                model.onChangedEmail();
                              },
                              controller: emailController,
                              focusNode: emailFocusNode,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.alternate_email),
                                hintText: 'Email',
                                errorText: model.validateEmail(),
                              ),
                            ),
                          ),
                          // name
                          Container(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: TextField(
                              onChanged: (value){
                                model.onChangedName();
                              },
                              controller: nameController,
                              focusNode: nameFocusNode,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_outline_outlined),
                                hintText: 'Full Name',
                                errorText: model.validateName(),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: TextField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              onChanged: (value){
                                model.onChangedPassword();
                              },
                              controller: passwordController,
                              focusNode: passwordFocusNode,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outlined),
                                hintText: 'Password',
                                errorText: model.validatePassword(),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: TextField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              onChanged: (value){
                                model.onChangedConfirmPassword();
                              },
                              controller: confirmPasswordController,
                              focusNode: confirmPasswordFocusNode,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outlined),
                                hintText: 'Confirm Password',
                                errorText: model.validateConfirmPassword(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () => model.onTapSignUpButton(),
                        elevation: 8.0,
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        color: Colors.blue,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        height: 50,
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=>model.navigateToLogin(),
                      child: Container(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already a member with AI-Friend? '),
                          Text('Login',style: GoogleFonts.roboto(color: Colors.blue),),
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        viewModelBuilder: () => SignupViewModel());
  }
}