// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
validInput(String val ,int max,int min,String type){

  if(type == "username"){
      
      if(!GetUtils.isUsername(val)){
        return "40".tr;
      }
  }

  if(type == "email"){
      
      if(!GetUtils.isEmail(val)){
        return "41".tr;
      }
  }
  if(type == "phone"){
      
      if(!GetUtils.isPhoneNumber(val)){
        return "42".tr;
      }
  }
  // if(type == "password"){
      
  //     if(!GetUtils.is(val)){
  //       return "not valid phone";
  //     }
  // }
  if(val.length < min){
    return "${"43".tr}$min";
  }

  if(val.length > max){
    return "${"44".tr}$min";
  }

  if(val.isEmpty){
    return "45".tr;
  }



  
}