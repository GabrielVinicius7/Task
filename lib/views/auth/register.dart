
import 'package:flutter/material.dart';

class Register extends StatelessWidget{
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar:AppBar(),
      body: Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Title(
                color: Colors.black,
                child: const Text('Celta',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    )),
              ),

              Container(
                width: 350,
                height: 600,
                decoration: BoxDecoration(
                  border: Border.all(color:const Color.fromARGB(0, 0, 0, 0)),
                  borderRadius:BorderRadius.circular(40)
                ),
                 padding: const EdgeInsets.all(20),
                  child: Column(children: [
                    const SizedBox(height: 40.0),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                        
                      ),
                    ),
                    
                    const SizedBox(height: 30.0),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.password),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.password),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.black),
                          minimumSize:MaterialStatePropertyAll(Size(600,60))
                          ),
                      child: const Text('Register',
                      style:TextStyle(
                        color: Colors.white,
                      )),
                    ),
                    const SizedBox(height: 20),
                     
                  ])),
              
                
          ],
         
        )
        
        ),

    );
  }

}