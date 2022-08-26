import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memory_notebook/Screens/LoginPage/LoginScreen.dart';
import 'package:memory_notebook/service/AuthService.dart';
import '../../HomePage/MyHomePage.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  var txtPhoneNumber = TextEditingController();
  var txtName = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPassword = TextEditingController();
  var authService = AuthService();

  final ImagePicker pickerImage = ImagePicker();
  dynamic pickImage;
  PickedFile? profileImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFD1C4E9),
                Color(0xFFB39DDB),
                Color(0xFF9575CD),
                Color(0xFF7E57C2),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                buildName(),
                const SizedBox(height: 30),
                buildPhoneNumber(),
                const SizedBox(height: 30),
                buildEmail(),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Şifre",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    buildPassword(),
                    const SizedBox(height: 30),
                    registerButton(),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: const <Widget>[
                          Text(
                            '- OR -',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            'Sign up with',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    socialIcons(),
                    const SizedBox(height: 20),
                    buildLoginButton(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "E-mail",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color(0xFFB388FF),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: txtEmail,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: "E-mail :",
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "İsminiz",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color(0xFFB388FF),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: txtName,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: "İsmim :",
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPhoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Telefon Numaranız?",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color(0xFFB388FF),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: txtPhoneNumber,
            maxLength: 11,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.settings_phone,
                color: Colors.white,
              ),
              hintText: "Numaram :",
              hintStyle: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: const Color(0xFFB388FF),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      height: 60,
      child: TextField(
        controller: txtPassword,
        obscureText: true,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(
            Icons.password,
            color: Colors.white,
          ),
          hintText: "Şifre :",
          hintStyle: TextStyle(
            color: Colors.white54,
          ),
        ),
      ),
    );
  }

  Widget socialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        googleButton(),
      ],
    );
  }

  Widget googleButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        primary: Color(0xFF7C4DFF),
        padding: const EdgeInsets.all(2),
      ),
      onPressed: () {
        authService.signInWithGoggle().then((value) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        }).whenComplete(() => null);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                "assets/icons/google-icon-logo.png",
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text("Google ile Kayıt ol")
          ],
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Zaten hesabın var mı ?  ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: "Giriş Yapın",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget registerButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Color(0xFF7C4DFF),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kayıt Ol",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Icon(Icons.login),
          ],
        ),
        onPressed: () {
          if (txtName.text.isEmpty) {
            nameError();
          } else if (txtEmail.text.isEmpty) {
            emailError();
          } else if (txtPhoneNumber.text.isEmpty) {
            phoneNumberError();
          } else if (txtPassword.text.isEmpty) {
            passwordError();
          } else {
            authService
                .createPerson(
              txtName.text,
              txtEmail.text,
              txtPassword.text,
              txtPhoneNumber.text,
            )
                .then((value) {
              return Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            });
          }
        },
      ),
    );
  }

  void nameError() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),

            backgroundColor: Colors.red,
            title: Text(
              "Lütfen Kullanıcı Adı Ekleyiniz!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
            actions: [
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)
                          )
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text("Geri Dön"),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void emailError() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),

            backgroundColor: Colors.red,
            title: Text("Lütfen E-mail alanını doldurunuz!",style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic),),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)
                          )
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text("Geri Dön"),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void passwordError() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),

            backgroundColor: Colors.red,
            title: Text("Lütfen şifrenizi belirleyiniz!",style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic),),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)
                          )
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text("Geri Dön"),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void phoneNumberError() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32.0),
              ),
            ),

            backgroundColor: Colors.red,
            title: Text("Lütfen telefon numaranızı ekleyiniz!",style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic),),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)
                          )
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text("Geri Dön"),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
