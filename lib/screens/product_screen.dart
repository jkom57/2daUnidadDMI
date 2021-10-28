import 'package:flutter/material.dart';

import 'package:dos_uno_dos/widgets/widgets.dart';
import 'package:dos_uno_dos/ui/input_decorations.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ProductImage(),
                Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios_new,
                      size: 40,
                      color: Colors.white,
                    )
                  )
                ),
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    onPressed: () {
                      // TODO: Camara o galería
                    },
                    icon: Icon(Icons.camera_alt_outlined,
                      size: 40,
                      color: Colors.white,
                    )
                  )
                ),
              ],
            ),
            _ProductForm(),
            SizedBox(height: 100,)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: () {
          // TODO: Guardar producto
        },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del producto',
                  labelText: 'Nombre:',
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150',
                  labelText: 'Precio:',
                ),
              ),
              SizedBox(height: 30,),
              SwitchListTile.adaptive(
                value: true,
                title: Text('Disponible'),
                activeColor: Colors.indigo,
                onChanged: (value) {
                  // TODO: pendiente
                }
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(25),
      bottomRight: Radius.circular(25),
    ),
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0, 5),
        blurRadius: 5,
      )
    ]
  );
}