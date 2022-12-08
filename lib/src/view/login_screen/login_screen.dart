import 'package:demo/src/view/login_screen/login_provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../utilities/color/color_utils.dart';
import '../../../utilities/font/font_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    // print("🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂🙂");
    final provider = Provider.of<LoginProvider>(context, listen: false);
    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    // final provider = Provider.of<LoginProvider>(context, listen: false);
    // provider.LoginProvider(context: context, postId: '224');
    // });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // SvgPicture.asset("assets/svg/login_screen.svg"),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // child: Image.asset("assets/png/login_screen.png"),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/png/login_screen.png"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Log In",
                      style: FontUtils.h24(
                        fontColor: ColorUtils.themeColor.oxff2F3A4B,
                        fontWeight: FWT.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "It’s easier to log in Now",
                      style: FontUtils.h14(
                        fontColor: ColorUtils.themeColor.oxff666666,
                        fontWeight: FWT.medium,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorUtils.themeColor.oxffD2E7C7,
                        ),
                        onPressed: () {
                          _handleSignIn();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/svg/google.svg"),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Continue with Google",
                              style: FontUtils.h14(
                                fontColor: ColorUtils.themeColor.oxff2F3A4B,
                                fontWeight: FWT.medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 50,
                    // ),
                    // const Text("Don’t have an account? Register"),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
            // SvgPicture.asset("assets/svg/Gyaanbook.svg"),
          ],
        ),
      ),
    );
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final googleAuth = await googleSignInAccount!.authentication;

      await _googleSignIn.signIn().then((value) async {
        final accessToken = await value!.authentication;
        print("🙂🙂🙂🙂🙂🙂🙂🙂${accessToken.accessToken.toString()}");
      });
    } catch (error) {
      print(error);
    }
  }
}
