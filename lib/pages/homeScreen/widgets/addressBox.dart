import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

Container addressBox()
{
  return Container(
    height: 30,
    padding: const EdgeInsets.only(bottom: 15,left: 2,right: 2),
    decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient
    ),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Icon(Icons.location_on,size: 18,),
        Flexible(
          child: Text(" Deliver to : Subhash Uttarahalli Bcm Hostel,Bengaluru 560061,karnataka",style:TextStyle(fontSize: 14.6,fontWeight: FontWeight.w400),overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 1,),
        ),
        Icon(Icons.arrow_drop_down)
      ],
    ),
  );
}
