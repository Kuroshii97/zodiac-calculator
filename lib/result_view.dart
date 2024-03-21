import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zodiac_recognizer/provider/form_field_viewmodel.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  late FormFieldViewModel _formFieldViewModelWatcher;

  @override
  Widget build(BuildContext context) {
    _formFieldViewModelWatcher = context.watch<FormFieldViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Hallo ${_formFieldViewModelWatcher.name}'),
              const SizedBox(height: 10,),
              const Text('Usia anda saat ini adalah :'),
              const SizedBox(height: 10,),
              Text('${_formFieldViewModelWatcher.currentYear} Tahun'),
              const SizedBox(height: 10,),
              Text('${_formFieldViewModelWatcher.currentMonth} Bulan'),
              const SizedBox(height: 10,),
              Text('${_formFieldViewModelWatcher.currentDay} Hari'),
              const SizedBox(height: 20,),
              Text('Bintang anda adalah ${_formFieldViewModelWatcher.zodiac}'),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
