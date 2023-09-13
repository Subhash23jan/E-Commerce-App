import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

Container addressBox()
{
  return Container(
    padding: const EdgeInsets.only(top: 5,bottom: 8,left: 2,right: 2),
    decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Icon(Icons.location_on),
        Flexible(
          child: Text(" Delivery to : Subhash Uttarahalli Bcm Hostel,Bengaluru 560061,karnataka",style:TextStyle(fontSize: 14.6,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 1,),
        ),
        Icon(Icons.arrow_drop_down)
      ],
    ),
  );
}
