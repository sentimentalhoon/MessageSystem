package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor // 매개 변수를 입력 받는 생성자 메소드 지정
@NoArgsConstructor // 기본 생성자 메소드 지정
public class Board {
  private String num;
  private String title;
  private String writer;
  private String filename;
  private String content;
  private String b_date;
}
