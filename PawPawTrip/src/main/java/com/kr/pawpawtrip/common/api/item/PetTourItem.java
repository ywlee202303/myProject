package com.kr.pawpawtrip.common.api.item;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PetTourItem {
    @JsonProperty("contentid")
	private String petinfoContentid; //콘텐츠아이디
    @JsonProperty("petTursmInfo")    
	private String tourInfo;         //반려견관광정보         
	private String acmpyTypeCd;      //동반구분   
	private String relaPosesFclty;   //관련구비시설 
	private String relaFrnshPrdlst;  //관련비치품목 
	private String relaPurcPrdlst;   //관련구매품목 
	private String relaRntlPrdlst;   //관련렌탈품목 
	private String acmpyPsblCpam;    //동반가능동물 
	private String etcAcmpyInfo;     //기타동반정보 
	private String acmpyNeedMtr;     //동반시필요사항
	private String relaAcdntRiskMtr; //관련사고대비사항
    private String dbExistYn;
    private String dbAcmpyTypeCd;
}
