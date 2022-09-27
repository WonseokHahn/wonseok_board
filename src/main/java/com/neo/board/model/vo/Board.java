package com.neo.board.model.vo;


import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor 
@Getter @Setter @ToString
public class Board {
	private int boardNo; 
	private String boardTitle; 
	private String boardWriter; 
	private String boardContent; 
	private Date regDate;
	private int viewCnt;
	
	
}
