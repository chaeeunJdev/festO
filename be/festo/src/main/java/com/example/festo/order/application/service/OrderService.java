package com.example.festo.order.application.service;

import com.example.festo.order.adapter.in.web.model.*;
import com.example.festo.order.application.port.in.LoadOrderUseCase;
import com.example.festo.order.application.port.in.OrderStatusChangeUseCase;
import com.example.festo.order.application.port.in.PlaceOrderUseCase;
import com.example.festo.order.application.port.out.*;
import com.example.festo.order.domain.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService implements PlaceOrderUseCase, OrderStatusChangeUseCase, LoadOrderUseCase {

    private final PlaceOrderPort placeOrderPort;

    private final LoadOrderPort loadOrderPort;

    private final UpdateOrderStatusPort updateOrderPort;

    private final LoadProductPort loadProductPort;

    private final LoadBoothInfoPort loadBoothInfoPort;

    private final LoadFestivalInfoPort loadFestivalInfoPort;

    private final OrdererService ordererService;


    @Override
    public void placeOrder(OrderRequest orderRequest) {
        List<OrderLine> orderLines = new ArrayList<>();
        for (OrderProduct orderProduct : orderRequest.getOrderProducts()) {
            Product product = loadProductPort.loadProduct(orderProduct.getProductId());
            orderLines.add(new OrderLine(orderProduct.getProductId(), product.getPrice(), orderProduct.getQuantity()));
        }

        Orderer orderer = ordererService.createOrderer(orderRequest.getOrdererMemberId());
        OrderNo orderNo = OrderNo.of(placeOrderPort.nextOrderNo(orderRequest.getBoothId()));
        BoothInfo boothInfo = loadBoothInfoPort.loadBoothInfo(orderRequest.getBoothId());

        Order order = Order.builder()
                           .orderNo(orderNo)
                           .boothInfo(boothInfo)
                           .orderer(orderer)
                           .orderLines(orderLines)
                           .build();

        placeOrderPort.placeOrder(order);
    }

    @Transactional
    @Override
    public void changeStatus(Long orderId, OrderStatusChangeRequest orderStatusChangeRequest) {
        Order order = loadOrderPort.loadOrder(orderId);
        order.updateStatus(orderStatusChangeRequest);

        updateOrderPort.updateOrderStatus(order);
    }

    @Override
    public OrderDetailResponse loadOrderDetail(Long orderId) {
        Order order = loadOrderPort.loadOrder(orderId);

        List<ProductResponse> menus = new ArrayList<>();
        for (OrderLine orderLine : order.getOrderLines()) {
            Product product = loadProductPort.loadProduct(orderLine.getProductId());
            menus.add(new ProductResponse(product.getName(), orderLine.getQuantity()));
        }

        return new OrderDetailResponse(order.getOrderNo().getNumber(), order.getOrderTime(), order.getTotalAmounts().getValue(), menus);
    }

    @Override
    public List<OrderSummaryResponse> loadOrderSummariesByOrdererId(Long ordererId) {
        List<Order> orders = loadOrderPort.loadOrdersByOrdererId(ordererId);

        List<OrderSummaryResponse> orderSummaries = new ArrayList<>();
        for (Order order : orders) {
            FestivalInfo festivalInfo = loadFestivalInfoPort.loadFestivalInfoByBoothId(order.getBoothInfo().getBoothId());
            Product firstProduct = loadProductPort.loadProduct(order.getOrderLines().get(0).getProductId());

            orderSummaries.add(new OrderSummaryResponse(order, festivalInfo, firstProduct));
        }

        return orderSummaries;
    }

    @Override
    public List<OrderSummaryForBoothOwnerResponse> loadOrderSummariesByBoothId(Long boothId, Long requesterId, boolean completed) {
        List<Order> orders = loadOrderPort.loadOrdersByBoothId(boothId, requesterId, completed);

        List<OrderSummaryForBoothOwnerResponse> orderSummaries = new ArrayList<>();
        for (Order order : orders) {
            Product firstProduct = loadProductPort.loadProduct(order.getOrderLines().get(0).getProductId());
            orderSummaries.add(new OrderSummaryForBoothOwnerResponse(order, firstProduct));
        }

        return orderSummaries;
    }
}