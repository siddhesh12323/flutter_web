import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Home(),
            );
          }
          if (snapshot.hasError) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                appBar: AppBar(
                  title: const Text('Firebase App'),
                ),
                body: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              ),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Firebase App'),
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }
}

class Home extends StatelessWidget {
  Home({super.key});
  // auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Email',
          ),
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: 'Password',
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            try {
              _auth.signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeUser()),
              );
            } catch (e) {
              print(e);
            }
          },
          child: Text('Sign In'),
        ),
      ],
    );
  }
}

class HomeUser extends StatelessWidget {
  HomeUser({super.key});
  // firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home User'),
      ),
      body: StreamBuilder(
        stream: _firestore.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data!.docs[index]['name']),
                subtitle: Text(snapshot.data!.docs[index]['email']),
              );
            },
          );
        },
      ),
    );
  }
}
