package com.example.festo.booth.adapter.in.web;

import com.example.festo.booth.adapter.in.web.model.BoothCreationResponse;
import com.example.festo.booth.adapter.in.web.model.BoothRequest;
import com.example.festo.booth.adapter.in.web.model.BoothResponse;
import com.example.festo.booth.adapter.in.web.model.FiestaResponse;
import com.example.festo.booth.adapter.in.web.model.RequestStatus;
import com.example.festo.booth.application.port.in.*;
import com.example.festo.booth.domain.Booth;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
@Slf4j
public class BoothController {
    private final RegisterBoothUseCase registerBoothUseCase;
    private final GetFiestaListUseCase getFiestaListUseCase;
    private final ChangeBoothStatusUseCase changeBoothStatusUseCase;
    private final GetBoothListUseCase getBoothListUseCase;
    private final GetBoothDetailUseCase getBoothDetailUseCase;
    @PostMapping("/festivals/{festival_id}/booths")
    public ResponseEntity<BoothCreationResponse> createBooth(@PathVariable("festival_id") Long festivalId, @Valid @RequestPart("request") BoothRequest request, @RequestPart("boothImg") MultipartFile boothImg) {
        log.info("부스 등록 컨트롤러 시작");
        UserDetails user = (UserDetails) SecurityContextHolder.getContext()
                                                              .getAuthentication()
                                                              .getPrincipal();

        RegisterBoothCommand command = RegisterBoothCommand.builder()
                                                           .boothName(request.getBoothName())
                                                           .location(request.getLocation())
                                                           .description(request.getDescription())
                                                           .openTime(request.getOpenTime())
                                                           .closeTime(request.getCloseTime())
                                                           .festivalId(festivalId)
                                                           .img(boothImg)
                                                           .ownerId(Long.parseLong(user.getUsername()))
                                                           .build();

        Long boothId = registerBoothUseCase.registerBooth(command);

        return new ResponseEntity<>(new BoothCreationResponse(boothId), HttpStatus.OK);
    }

    @GetMapping("festivals/owner")
    public ResponseEntity<?> getFestivalsByOwner(){
        log.info("부스 운영자가 참여한 축제 조회 컨트롤러 시작");

        UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        List<FiestaResponse.Owner> festivalList = getFiestaListUseCase.getFiestaListByOwner(Long.parseLong(user.getUsername()));

        return new ResponseEntity<>(festivalList, HttpStatus.OK);
    }

    @PatchMapping("booths/{booth_id}/status")
    public ResponseEntity<?> changeBoothStatus(@PathVariable("booth_id")Long boothId, @RequestBody RequestStatus status){
        log.info("부스 상태 변경 컨트롤러 시작");
        log.info(status.getStatus());
        if(!(status.getStatus().equals("CLOSE") || status.getStatus().equals("OPEN"))){
            return new ResponseEntity<>("OPEN과 CLOSE만 가능합니다.", HttpStatus.BAD_REQUEST);
        }

        boolean resultResponse = changeBoothStatusUseCase.changeBoothStatus(status.getStatus(),boothId);

        if(resultResponse){
            return new ResponseEntity<>("변경이 완료돠었습니다.", HttpStatus.OK);
        }
        else{
            if(status.getStatus().equals("CLOSE")) return new ResponseEntity<>("이미 마감하였습니다.", HttpStatus.BAD_REQUEST);
            else return new ResponseEntity<>("이미 오픈 중입니다.", HttpStatus.BAD_REQUEST);
        }

    }

    @GetMapping("booths/{booth_id}")
    public ResponseEntity<?> getBoothDetail(@PathVariable("booth_id")Long boothId){
        log.info("부스 상세 정보 조회 컨트롤러 시작");
        Booth domain = getBoothDetailUseCase.getBoothDetail(boothId);

        BoothResponse.Detail detailResponse = BoothResponse.Detail.builder()
                .boothId(domain.getBoothId())
                .name(domain.getName())
                .boothDescription(domain.getBoothDescription())
                .imageUrl(domain.getImageUrl())
                .status(domain.getStatus())
                .openTime(domain.getOpenTime())
                .closeTime(domain.getCloseTime())
                .locationDescription(domain.getLocationDescription())
                .build();

        return new ResponseEntity<>(detailResponse, HttpStatus.OK);
    }

    @GetMapping("festivals/{festival_id}/booths")
    public ResponseEntity<?> getBoothList(@PathVariable("festival_id")Long festivalId){
        log.info("부스 목록 리스트 상세 조회 컨트롤러 시작");
        List<Booth> domainList = getBoothListUseCase.getBoothList(festivalId);
        List<BoothResponse.Booths> boothList = new ArrayList<>();
        for(Booth domain : domainList){
            BoothResponse.Booths boothResponse = BoothResponse.Booths.builder()
                    .boothId(domain.getBoothId())
                    .name(domain.getName())
                    .description(domain.getBoothDescription())
                    .imageUrl(domain.getImageUrl())
                    .build();

            boothList.add(boothResponse);
        }
        return new ResponseEntity<>(boothList, HttpStatus.OK);
    }


    @GetMapping("booths/{owner_id}/owner")
    public ResponseEntity<?> getBoothListByOwner(@PathVariable("owner_id")Long ownerId){
        log.info("부스운영자가 운영 중인 부스 목록 리스트 상세 조회 컨트롤러 시작");
        List<Booth> domainList = getBoothListUseCase.getBoothListByOwner(ownerId);
        List<BoothResponse.BoothsByOwner> boothList = new ArrayList<>();
        for(Booth domain : domainList){
            BoothResponse.BoothsByOwner boothResponse = BoothResponse.BoothsByOwner.builder()
                    .boothId(domain.getBoothId())
                    .name(domain.getName())
                    .description(domain.getBoothDescription())
                    .imageUrl(domain.getImageUrl())
                    .festivalName(domain.getFiesta().getFiestaName())
                    .festivalImageUrl(domain.getFiesta().getFiestaImgUrl())
                    .build();

            boothList.add(boothResponse);
        }
        return new ResponseEntity<>(boothList, HttpStatus.OK);
    }
}
