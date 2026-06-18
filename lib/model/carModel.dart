import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  String ? carId, carName, carUrlImg, carUserName, carUserId ;
  Timestamp ? carTimesTamp;
  bool ? carLike;
  int ? carLikeCount;
  Car({this.carId,
    this.carName,
    this.carUrlImg,
    this.carUserName,
    this.carTimesTamp,
    this.carLike,
    this.carLikeCount ,
    this.carUserId
  });
}