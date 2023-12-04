import 'package:flutter/material.dart';

class CreateCagnottePage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créer une cagnotte'),
        backgroundColor: Color.fromARGB(255, 65, 5, 5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Formulaire de création de cagnotte'),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom de la cagnotte'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un nom';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Montant à collecter'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer un montant';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Do something with the form data
                    // For example, you can send it to an API or process it
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Cagnotte créée avec succès!')),
                    );
                  }
                },
                child: Text('Créer la cagnotte'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
