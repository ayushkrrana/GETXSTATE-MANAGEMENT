import 'package:get/get.dart';

class AppController extends GetxController{
  // we can declare the variable in getX by this RxDatatype variable name= value.obs
   RxInt n= 0.obs; //we can write final also in place of RxInt / obs - observable variable
  // RxBool isset= true.obs;
   //RxString name="Ayush kumar".obs;
   //RxDouble result=0.0.obs;
void increase(){
   n++;
   print(n);
}

void decrease(){
   n--;
   print(n);
}
}