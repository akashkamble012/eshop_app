import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonName;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Size size;
  final double radius;
  const CustomTextButton({
    Key? key,
    required this.buttonName,
    this.size = const Size(0.0, 0.0),
    this.textColor = AppColor.white,
    this.radius = 0,
    this.backgroundColor = AppColor.secondaryColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        buttonName,
        style: TextStyle(
          color: textColor,
        ),
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        minimumSize: MaterialStateProperty.all(size),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      onPressed: onPressed,
    );
  }
}



/*

   TextButton(
                  onPressed: () async {
                    BlocProvider.of<PlaceOrderBloc>(context)
                        .add(AddToCart(fruits: data));
                    Navigator.of(context).pushNamed(CartScreen.routeName);x
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(AppColor.secondaryColor),
                    minimumSize: MaterialStateProperty.all(const Size(0.0, 50)),
                  ),
                  child: Text(
                    'BUY NOW',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),




 */