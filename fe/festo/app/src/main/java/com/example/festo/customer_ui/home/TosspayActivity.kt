package com.example.festo.customer_ui.home

import android.annotation.SuppressLint
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.widget.Button
import androidx.activity.result.ActivityResultLauncher
import androidx.appcompat.app.AppCompatActivity
import com.example.festo.R
import com.tosspayments.paymentsdk.PaymentWidget
import com.tosspayments.paymentsdk.model.TossPaymentResult
import com.tosspayments.paymentsdk.view.PaymentMethodWidget


class TosspayActivity : AppCompatActivity() {
    private lateinit var paymentWidget: PaymentWidget

    @SuppressLint("MissingInflatedId")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_tosspay)

        paymentWidget = PaymentWidget(
            activity = this,
            clientKey = "test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq",
            customerKey = "testtest"
        )
        val methodWidget = findViewById<PaymentMethodWidget>(R.id.payment_widget)

        paymentWidget.setMethodWidget(methodWidget)

        paymentWidget.renderPaymentMethodWidget(
            amount = 1000,
            orderId = "toss106923984729847289"
        )

        val paymentButton = findViewById<Button>(R.id.requestPay) // 결제 버튼 찾기
        paymentButton.setOnClickListener {
            paymentWidget.requestPayment(
                paymentResultLauncher = tossPaymentActivityResult,
                orderId = "toss106923984729847289",
                orderName = "tester"
            )
        }

    }
//    sealed class TossPaymentResult{
//        class Success(paymentKey: String, orderId: String, amount: Number, additionalParameters: Map<String, String>): TossPaymentResult()
//        class Fail(errorCode: String, errorMessage: String, orderId: String): TossPaymentResult()
//    }


    // 성공 및 실패 시 처리 함수
    private val tossPaymentActivityResult: ActivityResultLauncher<Intent> =
        PaymentWidget.getPaymentResultLauncher(
            this,
            { success ->
                handlePaymentSuccessResult(success)
            },
            { fail ->
                handlePaymentFailResult(fail)
            })

    private fun handlePaymentSuccessResult(success: TossPaymentResult.Success) {
//        val paymentType: String? = success.additionalParameters["paymentType"]
//        if ("BRANDPAY".equals(paymentType, true)) {
//            // 브랜드페이 승인
//        } else {
//            // 일반결제 승인 -> 추후 일반결제/브랜드페이 승인으로 Migration 예정되어있음
//        }

        startActivity(
            PaymentResultActivity.getIntent(
                this@TosspayActivity,
                true,
                arrayListOf(
                    "PaymentKey|${success.paymentKey}",
                    "OrderId|${success.orderId}",
                    "Amount|${success.amount}",
                )
            )
        )
    }


    private fun handlePaymentFailResult(fail: TossPaymentResult.Fail) {
        startActivity(
            PaymentResultActivity.getIntent(
                this@TosspayActivity,
                false,
                arrayListOf(
                    "ErrorCode|${fail.errorCode}",
                    "ErrorMessage|${fail.errorMessage}",
                    "OrderId|${fail.orderId}"
                )
            )
        )
    }


}