import 'package:flutter/material.dart';
import 'package:instagram_clone_flutter/enums.and.constants/language_enum.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone_flutter/screens/home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String selectedLanguage = Language.English.name;
  bool passwordVisible = false;
  final TextEditingController _user = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        padding: EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 10,
          ),
          DropdownButton<String>(
              style: TextStyle(fontSize: 12, color: Colors.black38),
              underline: SizedBox(),
              items: Language.values.map((each) {
                return DropdownMenuItem<String>(
                  value: each.name,
                  child: Text(each.name),
                );
              }).toList(),
              value: selectedLanguage,
              onChanged: (String? value) => {setState(() => selectedLanguage = value!)}),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: SizedBox(),
          ),
          Text(
            'Instagram',
            style: GoogleFonts.lobster(
              textStyle: TextStyle(letterSpacing: .5, fontSize: 36),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _user,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              hintText: 'Username, phone number or email',
              hintStyle: TextStyle(fontSize: 12),
              isDense: true,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            controller: _password,
            obscureText: !passwordVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
              hintText: 'password',
              hintStyle: TextStyle(fontSize: 12),
              isDense: true,
              suffixIcon: IconButton(
                  icon: passwordVisible
                      ? const Icon(Icons.visibility_outlined)
                      : const Icon(Icons.visibility_off_outlined),
                  onPressed: () => setState(() {
                        passwordVisible = !passwordVisible;
                      })),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Home.tag);
                  },
                  child: const Text('Login'))),
        ]),
      ),
    );
  }
}
