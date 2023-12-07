import 'package:flutter/material.dart';
import 'package:posttest5_096_filipus_manik/pages/Screen.dart';

void main() {
  runApp( const MaterialApp(
    home: SignUpPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String gender = 'Male';
  bool acceptAgreement = false;
  bool showPassword = false;

  void _resetInputs() {
    setState(() {
      nameController.clear();
      passwordController.clear();
      gender = 'Male'; // Atur nilai default gender sesuai kebutuhan
      acceptAgreement = false;
    });
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null; // Validasi berhasil
  }

  bool isDarkModeEnabled = false; 

  void _toggleDarkMode(bool newValue) {
    setState(() {
      isDarkModeEnabled = newValue;
      if (isDarkModeEnabled) {
        // Dark Mode
        ThemeMode.dark;
      } else {
        // Light Mode
        ThemeMode.light;
      }
    });
  }

  
  void _showDialog() {
    if(nameController.text.isEmpty || passwordController.text.isEmpty || gender.isEmpty ){
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Please fill in all fields and accept the agreement.'),
          actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
              ),
            ),
          ],
        );
      }
    );
  } else{
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(          
          title: const Text(
            'Data Sign-Up',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.orange,          
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  height: 290,
                  margin: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.amber,                    
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 220,
                        height : 50,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                            'Name: ${nameController.text}',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                            ),
                        ),
                      ),
                      Container(
                        width: 220,
                        height : 50,
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                            'Password: ${passwordController.text}',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                            ),
                        ),
                      ),
                      Container(
                        width: 220,
                        height : 50,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                            'Gender: $gender',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 220,
                        height : 50,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                            acceptAgreement ? 'Yes' : 'No',
                            style: const TextStyle(                              
                              fontFamily: 'Poppins',
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton( 
              onPressed: () {
                Navigator.of(context).pop();
                _resetInputs();
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                minimumSize: const Size(50, 75),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueGrey,
              ),
              child: const Icon(
                Icons.arrow_back, // Ikon panah ke kanan
                size: 35.0, // Ukuran ikon sesuai kebutuhan
              ),                                
            ),
          ],
        );
      },
    );
  }
}

Widget _iconButton(String imagePath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset(
        imagePath,
        width: 40, 
        height: 40, 
      ),
    );
  }

  void _toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: ElevatedButton.icon(
          onPressed: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => Screen(),
              ),
            );
          }, 
          icon: Icon(
            Icons.arrow_back,
            size: 15,
          ), 
          label: Text(
            'Back',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: const Text(
          'Filipus Adriel Manik',
          style: TextStyle(
              fontFamily: ("Poppins"),
            ),
          ),
        actions: [
          Switch(
            value: isDarkModeEnabled,
            onChanged: _toggleDarkMode,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300,
                height: 600,
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 280  ,
                      height: 50,
                      // color: Colors.red,
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                      child: const Text(
                        "Sign Up",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ),
                    Container(
                      width: 400,
                      height: 476,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 15.0),
                          TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              hintText: 'Enter your name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25.0),
                          TextFormField(                            
                            controller: passwordController,
                            obscureText: !showPassword,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              Checkbox(
                                value: showPassword,
                                onChanged: (value) {
                                  _toggleShowPassword();
                                },
                              ),
                              const Text('Show Password'),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Gender',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              ),
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                value: 'Male',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              const Text('Male'),
                              Radio(
                                value: 'Female',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              const Text('Female'),
                              Radio(
                                value: 'Other',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              const Text('other'),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              Container(
                                width: 120,
                                height: 40,
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: const Text(
                                  'Sign up',
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 30,
                                    ) ,
                                ),
                              ),
                              const SizedBox(width: 67),
                              ElevatedButton( 
                                onPressed: () {
                                  _showDialog();
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  minimumSize: const Size(50, 75),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blueGrey,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward, // Ikon panah ke kanan
                                  size: 35.0, // Ukuran ikon sesuai kebutuhan
                                ),                                
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            width: 250,
                            padding: const EdgeInsets.all(4),
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child:const Column(
                              children: [
                                Text(
                                  '----- or Sign Up with -----',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 250,
                            height: 28,
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(), backgroundColor: Colors.white, 
                                      padding: const EdgeInsets.all(8.0), 
                                    ),
                                    child: Ink.image(
                                      image: const AssetImage('assets/search.png'), 
                                      fit: BoxFit.cover, 
                                      width: 64, 
                                      height: 64, 
                                      child: Container(), 
                                    ),
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(), backgroundColor: Colors.white,
                                      padding: const EdgeInsets.all(8.0), 
                                    ),
                                    child: Ink.image(
                                      image: const AssetImage('assets/facebook.png'), 
                                      fit: BoxFit.cover, 
                                      width: 64, 
                                      height: 64, 
                                      child: Container(), 
                                    ),
                                ),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(), backgroundColor: Colors.white, 
                                      padding: const EdgeInsets.all(8.0), 
                                    ),
                                    child: Ink.image(
                                      image: const AssetImage('assets/meta.png'), 
                                      fit: BoxFit.cover, 
                                      width: 64, 
                                      height: 64, 
                                      child: Container(), 
                                    ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}