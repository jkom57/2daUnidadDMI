import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 450,
        child: const ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25)
          ),
          child: FadeInImage(
            image: NetworkImage('https://via.placeholder.com/400x300/green'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.red,
    borderRadius: const BorderRadius.only(
      topRight: Radius.circular(25),
      topLeft: Radius.circular(25)
    ),
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 10,
        offset: const Offset(0, 5),
      )
    ]
  );
}