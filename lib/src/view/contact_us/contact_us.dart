import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widget/other/app_bar.dart';
import '../../widget/other/custom_back.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

TextEditingController textController = TextEditingController();
TextEditingController subjectController = TextEditingController();

final String _url =
    'mailto:info@encodework.com?subject=${Uri.encodeFull(textController.text)}&body=${Uri.encodeFull(subjectController.text)}';

String? title;
String? subject;

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          size: MediaQuery.of(context).size,
          text: "Contact Us",
          centerTitleValue: true,
          leading: Row(
            children: const [
              CustomBack(),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8CC270),
                    ),
                  ),
                ),
                TextFormField(
                  cursorColor: const Color(0xff8CC270),
                  controller: textController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff8CC270),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xff8CC270),
                      ),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter your Title',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8CC270),
                    ),
                  ),
                ),
                TextFormField(  
                  cursorColor: const Color(0xff8CC270),
                  controller: subjectController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff8CC270),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xff8CC270),
                      ),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter your description',
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff8CC270),
                    ),
                    onPressed: () {
                      _launchUrl(
                        textController: textController.text,
                        subjectController: subjectController.text,
                      );
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(
      {required String textController,
      required String subjectController}) async {
    launch(_url);
  }
}
