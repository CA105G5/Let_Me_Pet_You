package jdbc.util.CompositeQuery;
import java.util.*;
public class jdbcUtil_CompositeQuery_Rescue {

	public static String get_aCondition_For_Oracle(String columnName, String value) {

		String aCondition = null; 

//		if ( "vlt_duty_day".equals(columnName) || "vlt_sta".equals(columnName) || "vlt_reg".equals(columnName)) // 用於其他
//			aCondition = columnName + "=" + value;
//		else if ("vlt_name".equals(columnName)||"vlt_id".equals(columnName)) // 用於varchar
//			aCondition = columnName + " like '%" + value + "%'";
//		else if ("hiredate".equals(columnName))                          // 用於Oracle的date
//			aCondition = "to_char(" + columnName + ",'yyyy-mm-dd')='" + value + "'";
		if("rsc_lat".equals(columnName) || "rsc_lon".equals(columnName) )
			aCondition = columnName + "=" + value;
		else if("rsc_id".equals(columnName) || "rsc_name".equals(columnName) || "rsc_add".equals(columnName)||"rsc_sta".equals(columnName)||"rsc_reg".equals(columnName)|| "rsc_sponsor".equals(columnName))
			aCondition = columnName + " like '%" + value + "%'";
		else if ("rsc_btime".equals(columnName))                          // 用於Oracle的date
			aCondition = "to_char(" + columnName + ",'yyyy-mm-dd HH24:MI:SS')='" + value + "'";
		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)) {
				count++;
				String aCondition = get_aCondition_For_Oracle(key, value.trim());

				if (count == 1)
					whereCondition.append(" where " + aCondition);
				else
					whereCondition.append(" and " + aCondition);

				System.out.println("有送出查詢資料的欄位數count = " + count);
			}
		}
		
		return whereCondition.toString();
	}

	public static void main(String argv[]) {

		// 配合 req.getParameterMap()方法 回傳 java.util.Map<java.lang.String,java.lang.String[]> 之測試
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("rsc_id", new String[] { "R000000001" });
		map.put("rsc_name", new String[] { "小貓" });
		map.put("rsc_add", new String[] { "中壢" });
		map.put("rsc_sta", new String[] { "完成救援" });
		map.put("rsc_reg", new String[] { "REG0000004" });
		map.put("rsc_btime", new String[] { "2018-12-01 10:10:00" });
		map.put("action", new String[] { "getXXX" }); // 注意Map裡面會含有action的key
		String finalSQL = "select * from rescue "
				          + jdbcUtil_CompositeQuery_Rescue.get_WhereCondition(map)
				          + "order by rsc_id";
		System.out.println("●●finalSQL = " + finalSQL);

	}
}
