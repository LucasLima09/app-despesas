import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  late DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0){
      return; 
    }

    widget.onSubmit(title, value, _selectedDate);

    Navigator.of(context).pop();
  }

  _showDatePicker(){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now()
      ).then((pickedDate){
        if(pickedDate == null){
          return;
        }

        setState(() {
          _selectedDate = pickedDate;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                onSubmitted: (value) => _submitForm(),
                decoration: InputDecoration(labelText: 'Título'),
              ),
              TextField(
                keyboardType: TextInputType.numberWithOptions(),
                onSubmitted: (value) => _submitForm(),
                controller: _valueController,
                decoration: InputDecoration(labelText: 'Valor R\$'),
              ),
              Container(
                height: 70,
      
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Data selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}'),
                    ),
                    TextButton(
                      onPressed: _showDatePicker,
                      style: TextButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: Text(
                        'Selecionar data',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        )
                    ),
                ],),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero
                      )
                    ),
                    child: Text(
                      'Nova transação',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
