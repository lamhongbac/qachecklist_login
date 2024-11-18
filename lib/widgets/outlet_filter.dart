import 'package:flutter/material.dart';

class OutletFilterForm extends StatelessWidget {
  const OutletFilterForm({super.key, required this.searchText});
final void Function(String text) searchText;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
     String searchContent="";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height:100,
        child: Form(
          key: _formKey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                
                child: TextFormField(
                  // The validator receives the text that the user has entered.
                  // and return error message
                  //
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    searchContent=value.toString();
                    return null;
                  },
                ),
              ),
              const SizedBox(width:30),

              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      searchText(searchContent);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
