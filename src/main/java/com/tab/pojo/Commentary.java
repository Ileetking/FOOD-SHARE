package com.tab.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.jws.soap.SOAPBinding;
import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Commentary {
  private int cid;
  private String content;
  private String time;
  private int fid;
  private int uid;
  private User user;
}
