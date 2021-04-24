import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/Product.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.3, left: 20, right: 20),
                  //height: 500,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Color
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Color"),
                              Row(
                                children: [
                                  ColorContainer(
                                    color: Color(0xFF356C95),
                                    isSelected: true,
                                  ),
                                  ColorContainer(color: Color(0xFFF8C078)),
                                  ColorContainer(color: Color(0xFFA29B9B)),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      // Description
                      Text(
                        product.description,
                        style: TextStyle(height: 2),
                      ),
                    ],
                  ),
                ),
                ProductTitleAndImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ColorContainer extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorContainer({
    Key key,
    this.color,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        right: 5,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
          )),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class ProductTitleAndImage extends StatelessWidget {
  const ProductTitleAndImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Price\n",
                        style: TextStyle(color: Colors.black45)),
                    TextSpan(
                        text: "\$${product.price}",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black45, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(child: Image.asset(product.image, fit: BoxFit.fill)),
            ],
          )
        ],
      ),
    );
  }
}
