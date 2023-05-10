package com.example.festo.data.API

import com.example.festo.data.req.RegiBoothRequest
import com.example.festo.data.req.RegiFestivalRequest
import com.example.festo.data.req.RegisterBoothReq
import com.example.festo.data.res.BoothOrderListCompleteRes
import com.example.festo.data.res.BoothOrderListRes
import com.example.festo.data.res.RegisterBoothRes
import com.example.festo.data.res.TestUser
import okhttp3.MultipartBody
import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.Headers
import retrofit2.http.Multipart
import retrofit2.http.POST
import retrofit2.http.Part
import retrofit2.http.Path

interface BoothAPI {

    // 부스 등록하기
    @Multipart
    @Headers("Authorization: Bearer eyJ0eXAiOiJKV1QiLCJyZWdEYXRlIjoxNjgzNjkzNDUxLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2ODg4Nzc0NTEsInN1YiI6IjEiLCJpc3MiOiJPdG16IiwiaWF0IjoxNjgzNjkzNDUxfQ.SYVxlhNtpJ7dJZILRo4IK-PKejaocbVciEk6Fo6raI4")
    @POST("festivals/{festival_id}/booths")
    fun registerBooth(@Path("festival_id") festival_id:String, @Part ("request") request: RegiBoothRequest,  @Part boothImg: MultipartBody.Part): Call<Long>

    // 부스 신규,준비중 주문내역 불러오기
    @Headers("Authorization: Bearer eyJ0eXAiOiJKV1QiLCJyZWdEYXRlIjoxNjgzNjkzNDUxLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2ODg4Nzc0NTEsInN1YiI6IjEiLCJpc3MiOiJPdG16IiwiaWF0IjoxNjgzNjkzNDUxfQ.SYVxlhNtpJ7dJZILRo4IK-PKejaocbVciEk6Fo6raI4")
    @GET("booths/{booth_id}/orders?completed=false")
    fun getBoothOrderList(@Path("booth_id") booth_id:String): Call<List<BoothOrderListRes>>

    // 부스 완료된 주문내역 불러오기
    @Headers("Authorization: Bearer eyJ0eXAiOiJKV1QiLCJyZWdEYXRlIjoxNjgzNjkzNDUxLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2ODg4Nzc0NTEsInN1YiI6IjEiLCJpc3MiOiJPdG16IiwiaWF0IjoxNjgzNjkzNDUxfQ.SYVxlhNtpJ7dJZILRo4IK-PKejaocbVciEk6Fo6raI4")
    @GET("booths/{booth_id}/orders?completed=true")
    fun getBoothOrderListComplete(@Path("booth_id") booth_id:String): Call<List<BoothOrderListCompleteRes>>

}