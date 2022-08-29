/*
import 'package:flutter/material.dart';

class Validator extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    List<Widget> _buildFields(int length) {
      // Clear the TextEditingControllers lists
      nameFieldsController.clear();
      ageFieldsController.clear();

      for (int i = 0; i < length; i++) {
        final name = bloc.nameFields.value[i].value;
        final age = bloc.ageFields.value[i].value;

        nameFieldsController.add(TextEditingController(text: name));
        ageFieldsController.add(TextEditingController(text: age));
      }

      return List<Widget>.generate(
        length,
            (i) => FieldsWidget(
          index: i,
          nameController: nameFieldsController[i],
          ageController: ageFieldsController[i],
        ),
      );
    }

    return ListView(
      children: <Widget>[
        Container(
          height: 16.0,
        ),
        ValueBuilder<List<StreamedValue<String>>>(
          streamed: bloc.nameFields,
          builder: (context, snapshot) {
            return Column(
              children: _buildFields(snapshot.data.length),
            );
          },
          noDataChild: const Text('NO DATA'),
        ),
        Container(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              color: Colors.green,
              child: const Text('Add more fields', style: buttonText),
              onPressed: bloc.newFields,
            ),
            StreamBuilder<bool>(
                stream: bloc.isFormValid.outStream,
                builder: (context, snapshot) {
                  return RaisedButton(
                    color: Colors.blue,
                    child: snapshot.hasData
                        ? snapshot.data
                        ? const Text('Submit', style: buttonText)
                        : const Text('Form not valid', style: buttonText)
                        : const Text('Form not valid', style: buttonText),
                    onPressed: snapshot.hasData ? bloc.submit : null,
                  );
                }),
          ],
        ),
      ],
    );
  }
}
*/
