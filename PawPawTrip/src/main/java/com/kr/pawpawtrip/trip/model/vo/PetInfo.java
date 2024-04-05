package com.kr.pawpawtrip.trip.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetInfo
{
    private int    petinfoContentid;  //콘텐츠아이디  
    private String tourInfo;          //반려견관광정보
    private String acmpyTypeCd;       //동반구분      
    private String relaPosesFclty;    //관련구비시설  
    private String relaFrnshPrdlst;   //관련비치품목  
    private String relaPurcPrdlst;    //관련구매품목  
    private String relaRntlPrdlst;    //관련렌탈품목  
    private String acmpyPsblCpam;     //동반가능동물  
    private String etcAcmpyInfo;      //기타동반정보  
    private String acmpyNeedMtr;      //동반시필요사항
}
