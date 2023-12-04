import 'package:custom_editable_dropdown_menu/app_colors.dart';
import 'package:flutter/material.dart';

import 'editable_drop_down.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widget Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Custom Widget Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listAnimalOriginal = <String>['Dog', 'Cat', 'Tiger', 'Lion', 'Cat', 'Tiger', 'Lion', 'Cat', 'Tiger', 'Lion', 'Cat', 'Tiger', 'Lion', 'Cat', 'Tiger', 'Lion', 'Cat', 'Tiger', 'Lion', 'Cat', 'Tiger', 'Lion', 'Cat', 'Tiger', 'Lion'];
  var listAnimalFiltered = <String>['Dog', 'Cat', 'Tiger', 'Lion'];
  ScrollController? scrollController;
  TextEditingController fullNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: EditableDropdownMenu<String>(
          labelText: "Animals",
          hintText: "Please select animal from here",
          controller: fullNameTextController,
          focusBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.doctorPrimaryColor),
          ),
          onSelected: (doctorInfo) {
            // referralDoctorCubit.onSelectDoctor(doctorInfo);
            setState(() {
              // if (doctorInfo?.profileImage != null) {
              //   filePresentInitially = true;
              //   profileImageUrl = doctorInfo?.profileImage;
              //   fileList.add(File(doctorInfo!.profileImage!));
              //   if (fileList.isNotEmpty) {
              //     referralDoctorCubit.filePath =
              //         fileName.value = fileList[0].path;
              //   }
              // }
            });
          },
          onChange: (value) {
            if(value?.isNotEmpty ?? false){
              listAnimalFiltered = listAnimalOriginal
                  .where((element) => element.toLowerCase().contains(value.toString().toLowerCase()))
                  .toList();
            }else{
              listAnimalFiltered = listAnimalOriginal;
            }
            setState(() {

            });
          },
          dropdownMenuEntries: listAnimalFiltered
                  ?.map((e) => DropdownMenuEntry<String>(
                        value: e,
                        label: e,
                      ))
                  .toList() ??
              [],
          menuHeight: 300,
          onScroll: (controller) {
            if (controller.position.extentAfter <= 0) {}
          },
          scrollController: scrollController,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
