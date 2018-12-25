package jdbc.util.CompositeQuery;

import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class jdbcUtil_CompositeQuery_RscMsg {
	public static String get_aCondition_For_Oracle(String columnName, String value) {

		String aCondition = null; 


		if("rsc_msg_id".equals(columnName) || "rsc_id".equals(columnName) || "rsc_msg_sper".equals(columnName)||"rsc_msg_status".equals(columnName))
			aCondition = columnName + " like '%" + value + "%'";
		else if ("rsc_msg_time".equals(columnName))                          // 用於Oracle的date
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
		map.put("rsc_msg_id", new String[] { "RM0000000000001" });
		map.put("rsc_id", new String[] { "R000000001" });
		map.put("rsc_msg_sper", new String[] { "M000000006" });
//		map.put("rsc_msg_time", new String[] { "2018-12-05 11:00:00" });
		map.put("action", new String[] { "getXXX" }); // 注意Map裡面會含有action的key
		String finalSQL = "select * from rsc_msg "
				          + jdbcUtil_CompositeQuery_RscMsg.get_WhereCondition(map)
				          + "order by rsc_msg_id";
		System.out.println("●●finalSQL = " + finalSQL);

	}
}
