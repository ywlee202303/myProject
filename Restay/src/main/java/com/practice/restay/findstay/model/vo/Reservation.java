package com.practice.restay.findstay.model.vo;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reservation
{
    private String    resCode;      /* 예매코드     */
    private LocalDate resCheckin;   /* 체크인       */
    private LocalDate resCheckout;  /* 체크아웃     */
    private String    resState;     /* 결제상태     */
    private int       resNop;       /* 예약인원수   */
    private int       totalPrice;   /* 결제예정금액 */
    private LocalDate resDate;      /* 예약날짜     */
    private int       memberNo;     /* 회원번호     */
}
