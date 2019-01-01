package jdbc.util.CompositeQuery;
import java.util.*;

public class jdbcUtil_CompositeQuery_Volunteer {
	
	public static String get_aCondition_For_Oracle(String columnName, String value) {

		String aCondition = null; 

//		if ( "vlt_duty_day".equals(columnName) || "vlt_sta".equals(columnName) || "vlt_reg".equals(columnName)) // 用於其他
//			aCondition = columnName + "=" + value;
//		else if ("vlt_name".equals(columnName)||"vlt_id".equals(columnName)) // 用於varchar
//			aCondition = columnName + " like '%" + value + "%'";
//		else if ("hiredate".equals(columnName))                          // 用於Oracle的date
//			aCondition = "to_char(" + columnName + ",'yyyy-mm-dd')='" + value + "'";
		if("vlt_duty_day".equals(columnName) || "vlt_sta".equals(columnName) || "vlt_reg".equals(columnName)||"vlt_name".equals(columnName)||"vlt_id".equals(columnName))
			aCondition = columnName + " like '%" + value + "%'";
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
//		map.put("vlt_id", new String[] { "V000000001" });
//		map.put("vlt_name", new String[] { "謙謙" });
		map.put("vlt_duty_day", new String[] { "每日||平日" });
		map.put("vlt_sta", new String[] { "在職志工" });
//		map.put("vlt_reg", new String[] { "REG0000004" });
		map.put("action", new String[] { "getXXX" }); // 注意Map裡面會含有action的key

		String finalSQL = "select * from volunteer "
				          + jdbcUtil_CompositeQuery_Volunteer.get_WhereCondition(map)
				          + "order by vlt_id";
		System.out.println("●●finalSQL = " + finalSQL);

	}

}
