import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viva_sport/controllers/person_controller.dart';
import 'package:viva_sport/costansts/matches_api.dart';
import 'package:viva_sport/db/token.dart';

class Person extends GetView<PersonController> {
  Person({super.key});
  final GlobalKey<FormState> _key = GlobalKey();
  TextEditingController textEditingController = TextEditingController();

  @override
 // var controller = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
           // key: _key,
            child: SingleChildScrollView(
              child: GetBuilder<PersonController>(
                init:PersonController() ,
                builder: (controller) {
               return   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "VIVA SPORT",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      apiToken != "${storage.read("token")}"
                          ? const Text(
                        "Is not token",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 255, 36, 7),
                        ),
                      )
                          : const Text(
                        "token succeeded",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 7, 255, 61),
                        ),
                      ),
                      Text(
                        textEditingController.text,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 154, 197, 0),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(

                          // validator: (value) {
                          //   if(value!.isEmpty){
                          //
                          //     return "token is empty";
                          //
                          //   }
                          //   return 'null';
                          // },

                          controller: textEditingController,
                          cursorColor: Colors.amber,
                          decoration: InputDecoration(
                            focusColor: Colors.amber,
                            enabledBorder: outlineInputBorder(),
                            border: outlineInputBorder(),
                            focusedBorder: outlineInputBorder(),
                            disabledBorder: outlineInputBorder(),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.redAccent,
                                ),
                                borderRadius: BorderRadius.circular(22)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 90,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        width: double.infinity,
                        height: 50,
                        child: GetBuilder<PersonController>(
                          init: PersonController(),
                          builder: (controller) {
                            return ElevatedButton(
                                onPressed: () {
                                  // if(_key.currentState!.validate()){
                                  //
                                  //
                                  // }


                                  controller.changeToken(
                                      textEditingController.text);


                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber[900]),
                                child: const Text("اضافة"));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        width: double.infinity,
                        height: 50,
                        child: GetBuilder<PersonController>(
                          init: PersonController(),
                          builder: (_) {
                            return ElevatedButton(
                                onPressed: () {
                                  controller.removeToken();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    const Color.fromARGB(255, 255, 0, 21)),
                                child: const Text("حذف"));
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "BAHAA ALI",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
              },)
            ),
          ),

    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.amber,
        ),
        borderRadius: BorderRadius.circular(22));
  }
}
