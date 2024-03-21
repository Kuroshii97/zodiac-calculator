import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:zodiac_recognizer/provider/form_field_viewmodel.dart';
import 'package:zodiac_recognizer/result_view.dart';

class FormFieldView extends StatefulWidget {
  const FormFieldView({super.key});

  @override
  State<FormFieldView> createState() => _FormFieldViewState();
}

class _FormFieldViewState extends State<FormFieldView> {
  late FormFieldViewModel _formFieldViewModelReader;
  final TextEditingController _nameTextEditController = TextEditingController();
  final TextEditingController _dayTextEditController = TextEditingController();
  final TextEditingController _monthTextEditController =
      TextEditingController();
  final TextEditingController _yearTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _formFieldViewModelReader = context.read<FormFieldViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('Name:'),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _nameTextEditController,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Tanggal Lahir:'),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: TextFormField(
                            controller: _dayTextEditController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(2),
                            ],
                          ),
                        ),
                        const Text('/'),
                        Flexible(
                          fit: FlexFit.loose,
                          child: TextFormField(
                            controller: _monthTextEditController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(2),
                            ],
                          ),
                        ),
                        const Text('/'),
                        Flexible(
                          fit: FlexFit.loose,
                          child: TextFormField(
                            controller: _yearTextEditController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: _submitButton, child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }

  void _submitButton() {
    _formFieldViewModelReader.submitNameAndDate(
        _nameTextEditController.text,
        _dayTextEditController.text,
        _monthTextEditController.text,
        _yearTextEditController.text);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const ResultView()));
  }
}
