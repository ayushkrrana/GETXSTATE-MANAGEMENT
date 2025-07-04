import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:get/get.dart';
import 'package:getxpractice/about.dart';
import 'controller/app_controller.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController()); // we have to write the class name in which we extend the GetxController, it is dependency injection, we create the instance of the class to access the properties of the class,et.put() registers the instance in GetX's dependency system
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.snackbar(//snack bar is used to provide error messages when some things is missing or when we want to provide error messages to the home screen
                    "Downloading is Completed",
                    "Your Song is Downloaded",
                    borderColor: Colors.red,
                    borderWidth: 2,
                    snackPosition: SnackPosition.TOP,
                  ); // it will show the notification snack message from the top
                },
                child: Text('S N A C K B A R'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(// it provide a pop up message message like a alert when we do some thing or when we want to commit something finally so it is used for that exceptional cases where some important and final things goes done
                    // by this we can easily create the dialogue box
                    title: "ALERT",
                    content: Column(
                      children: [
                        Text(
                          "Do you want to delete the folder?",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  );
                },
                child: Text("DIALOGUE BOX"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to( //to is used to navigate to another page and get x is easy than old school like navigator.push()
                    AboutPage(),
                  ); // through this we can easily navigate to the next page(if we write get.off all then we do not move back to previous page
                },
                child: Text("Go to About Page"),
              ),
              InkWell(//ink well give the ripple effect where as the gesture detector do not
                  onTap: (){
                    appController.increase();
                  },
                  child: Icon(CupertinoIcons.plus, size: 50)),
              //obx is used to make a particular state a stateful widget
              Obx(()=>Text(appController.n.toString(), style: TextStyle(fontSize: 50))),// Obx is used to made a particular widget stateful instead of whole page which takes a lot of time and net to reload the whole page
              InkWell(
                  onTap: (){
                    appController.decrease();
                  },
                  child: Icon(CupertinoIcons.minus, size: 50)),
            ],
          ),
        ),
      ),
    );
  }
}
