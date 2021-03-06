/*
	 *  1. 萬用複合查詢-可由客戶端隨意增減任何想查詢的欄位
	 *  2. 為了避免影響效能:
	 *        所以動態產生萬用SQL的部份,本範例無意採用MetaData的方式,也只針對個別的Table自行視需要而個別製作之
	 * */


package com.prod.model;

import java.util.*;

public class jdbcUtil_CompositeQuery_Prod {

		public static String get_aCondition_For_Oracle(String columnName, String value) {

			String aCondition = null;

			if ("prod_price".equals(columnName) && ("200".equals(value))) // 用於int區間
				aCondition = columnName + ">=200";
			else if ("prod_ani_type_id".equals(columnName) || "prod_type_id".equals(columnName)) // 用於varchar
				aCondition = "'" + value + "'";

			return aCondition + " ";
		}

		public static String get_WhereCondition(Map<String, String[]> map) {
			Set<String> keys = map.keySet();
			StringBuffer whereCondition = new StringBuffer();
			int countCondition = 0;
			
			for (String key : keys) {
				String[] valueArr = map.get(key);
				if (valueArr != null && valueArr.length != 0 && !"action".equals(key)) {
					countCondition++;
					if (countCondition == 1) {
						whereCondition.append(" where ");
					} else if(countCondition > 1) {
						whereCondition.append(" and ");
					}
					int count = 0;
					if ("prod_price".equals(key)) { // 用於int區間
						if("200".equals(valueArr[0].trim()))
							whereCondition.append(" prod_price >= "  + valueArr[0]);
						else
							whereCondition.append(" prod_price between "  + valueArr[0]);
					}
					else {
						whereCondition.append(key+" in (");
						for (String value :valueArr) {
							if (value != null && value.trim().length() != 0) {
								count++;
								System.out.println("key= " + key);
								System.out.println("value= " + value);
								
								String aCondition = get_aCondition_For_Oracle(key, value.trim());
								System.out.println("aCondition= " + aCondition);
			
								whereCondition.append(aCondition);
								if (count<valueArr.length ) {
									whereCondition.append(", ");	
								}
								if (count==valueArr.length) {
									whereCondition.append(") ");
								}
									
			
								System.out.println("有送出查詢資料的欄位數count = " + count);
							}
						}
					}
				}
			}
			if (countCondition==0) {
				return whereCondition.toString()+" where PROD_STATUS='上架'";
			} else {
				return whereCondition.toString()+" and PROD_STATUS='上架'";
			}
		}

		public static void main(String argv[]) {

			// 配合 req.getParameterMap()方法 回傳 java.util.Map<java.lang.String,java.lang.String[]> 之測試
			Map<String, String[]> map = new TreeMap<String, String[]>();
			map.put("empno", new String[] { "7001" });
			map.put("ename", new String[] { "KING" });
			map.put("job", new String[] { "PRESIDENT" });
			map.put("hiredate", new String[] { "1981-11-17" });
			map.put("sal", new String[] { "5000.5" });
			map.put("comm", new String[] { "0.0" });
			map.put("deptno", new String[] { "10" });
			map.put("action", new String[] { "getXXX" }); // 注意Map裡面會含有action的key

			String finalSQL = "select * from emp2 "
					          + jdbcUtil_CompositeQuery_Prod.get_WhereCondition(map)
					          + "order by empno";
			System.out.println("●●finalSQL = " + finalSQL);

		}
	}

