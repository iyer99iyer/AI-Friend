import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../widgets/integration_login_button.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView{
  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        onModelReady: (model) => model.init(emailController,passwordController),
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
                                  AssetImage('assests/images/login.png'),
                              fit: BoxFit.fill
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric( horizontal: 16.0, vertical: 8.0),
                          width: double.infinity,
                          child: Text(
                            "Login",
                            style: GoogleFonts.roboto(
                                fontSize: 32, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 16.0),
                                //email
                                child: TextField(
                                  onChanged:(value)=> model.onChangedEmail(),
                                  controller: emailController,
                                  focusNode: emailFocusNode,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.alternate_email),
                                    hintText: 'Email',
                                    errorText: model.validateEmail(),
                                  ),
                                ),
                              ),
                              // password
                              Container(
                                padding: EdgeInsets.only(bottom: 16.0),
                                child: TextField(
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  onChanged:(value)=> model.onChangedPassword(),
                                  controller: passwordController,
                                  focusNode: passwordFocusNode,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.lock_outlined),
                                    hintText: 'Password',
                                    errorText: model.validatePassword(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            onPressed: () => model.onTapLogin(),
                            elevation: 8.0,
                            child: Text(
                              "Login",
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
                        Text('Or, register with email...',style: GoogleFonts.roboto(color: Colors.black38),),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IntegrationLoginButton(
                                onTap: (name) {
                                  model.doGoogleSignIn();
                                },
                                imagePath: 'assests/images/google.png',
                                name: 'google',
                              ),
                              IntegrationLoginButton(
                                onTap: (name) {
                                  model.getAllMembers();
                                },
                                imagePath: 'assests/images/facebook.png',
                                name: 'facebook',
                              ),
                              IntegrationLoginButton(
                                onTap: (name) {},
                                imagePath: 'assests/images/apple.png',
                                name: 'apple',
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: ()=>model.doSomething(),
                          child: Container(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('New to AI-Friend? '),
                              Text('Register',style: GoogleFonts.roboto(color: Colors.blue),),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
        ),
        viewModelBuilder: () => LoginViewModel());
  }
}
