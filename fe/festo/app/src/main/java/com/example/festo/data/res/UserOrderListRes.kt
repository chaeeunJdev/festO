package com.example.festo.data.res

class UserOrderListRes (
    val festivalName: String,
    val orderNo: orderNo,
    val boothId: String,
    val imageUrl: String,
    val boothName: String,
    val orderId: Int,
    val orderStatus: String,
    val productName: String,
    val etcCount: Int
)

class orderNo (
   val number : Int,
)