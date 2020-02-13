package com.kh.semi.pay.model.service;

import java.sql.Connection;

import com.kh.semi.pay.model.dao.payDao;
import com.kh.semi.pay.model.vo.Pay;
import static com.kh.semi.common.JDBCTemplate.*;
public class payService {
	
	payDao pDao = new payDao();
	
	public Pay PayPrint() {
		Connection con = getConnection();
		
		Pay p = pDao.PayPrint(con);
		return p;
	}

}
