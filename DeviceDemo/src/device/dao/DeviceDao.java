package device.dao;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.json.JSONException;
import org.json.JSONObject;
import device.dao.Db;

public class DeviceDao {
	public void showDebug(String msg){
		System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"][device/dao/Db]"+msg);
	}
	/*添加记录*/
	public void addDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException {
		//构造sql语句，根据传递过来的条件参数
		String deviceId=data.getParam().has("device_id")?data.getParam().getString("device_id"):null;
		String deviceName=data.getParam().has("device_name")?data.getParam().getString("device_name"):null;
		String Speed=data.getParam().has("speed")?data.getParam().getString("speed"):null;
		String capture_time=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
		if(deviceId!=null && deviceName!=null){
			String sql="insert into dzjc_capture_202410(record_id,capture_time,speed,vehicle_type)";
			sql=sql+" values('"+deviceId+"'";
			sql=sql+" , '"+capture_time+"' , '"+Speed+"' ";
			sql=sql+" ,'"+deviceName+"')";
			data.getParam().put("sql",sql);
			updateRecord(data,json);
		}
	}
	/*删除记录*/
	public void deleteDeviceRecord(Data data,JSONObject json) throws JSONException, SQLException{
		//构造sql语句，根据传递过来的条件参数
		String id=data.getParam().has("id")?data.getParam().getString("id"):null;
		if(id!=null){
			String sql="delete from dzjc_capture_202410 where id="+data.getParam().getString("id");
			data.getParam().put("sql",sql);
			updateRecord(data,json);
		}
	}
	/*修改记录*/
	public void modifyDeviceRecord(Data data,JSONObject json) throws JSONException, SQLException{
		//构造sql语句，根据传递过来的条件参数
		String id=data.getParam().has("id")?data.getParam().getString("id"):null;
		String deviceId=data.getParam().has("device_id")?data.getParam().getString("device_id"):null;
		String deviceName=data.getParam().has("device_name")?data.getParam().getString("device_name"):null;
		System.out.println("[DeviceDao：]"+deviceName);
		if(id!=null){
			String sql="update dzjc_capture_202410";
			sql=sql+" set record_id='"+deviceId+"'";
			sql=sql+" ,vehicle_type='"+deviceName+"'";
			sql=sql+" where id="+id;
			data.getParam().put("sql",sql);
			updateRecord(data,json);
		}
	}
	/*查询记录*/
	public void getDeviceRecord(Data data,JSONObject json) throws JSONException, SQLException{
		//构造sql语句，根据传递过来的查询条件参数
		String sql=createGetRecordSql(data);			//构造sql语句，根据传递过来的查询条件参数
		data.getParam().put("sql",sql);
		queryRecord(data,json);
	}
	/*
	 * 这是一个样板的函数，可以拷贝做修改用
	 */
	public void updateRecord(Data data,JSONObject json) throws JSONException, SQLException{
		/*--------------------获取变量 开始--------------------*/
		JSONObject param=data.getParam();
		int resultCode=0;
		String resultMsg="ok";
		/*--------------------获取变量 完毕--------------------*/
		/*--------------------数据操作 开始--------------------*/
		Db updateDb = new Db("test");
		String sql=data.getParam().getString("sql");
		showDebug("[updateRecord]"+sql);
		updateDb.executeUpdate(sql);
		updateDb.close();
		/*--------------------数据操作 结束--------------------*/
		/*--------------------返回数据 开始--------------------*/
		json.put("result_msg",resultMsg);															//如果发生错误就设置成"error"等
		json.put("result_code",resultCode);														//返回0表示正常，不等于0就表示有错误产生，错误代码
		/*--------------------返回数据 结束--------------------*/
	}
	public void queryRecord(Data data,JSONObject json) throws JSONException, SQLException{
		/*--------------------获取变量 开始--------------------*/
		String resultMsg = "ok";
		int resultCode = 0;
		List jsonList = new ArrayList();
		List jsonName =new ArrayList();
		/*--------------------获取变量 完毕--------------------*/
		/*--------------------数据操作 开始--------------------*/
		Db queryDb = new Db("test");
		String sql=data.getParam().getString("sql");
		String OrderBy="record_id desc";
		//OrderBy=data.getParam().has("order_by")?data.getParam().getString("order_by"):null;
		showDebug("看看order_by传过来没"+OrderBy);
		//实现排序
		sql=sql+" order by "+OrderBy;
		showDebug("[queryRecord]构造的SQL语句是：" + sql);
		try {
			ResultSet rs = queryDb.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int fieldCount = rsmd.getColumnCount();
			while (rs.next()) {
				Map map = new HashMap();
				for (int i = 0; i < fieldCount; i++) {
					map.put(rsmd.getColumnName(i + 1), rs.getString(rsmd.getColumnName(i + 1)));
				}
				jsonList.add(map);
			}
			rs.close();
			//加表头信息
			for(int i = 0;i < rsmd.getColumnCount();i++){
				String columnLabel=rsmd.getColumnLabel(i+1);
				jsonName.add(columnLabel);
			}
		} catch (Exception e) {
			e.printStackTrace();
			showDebug("[queryRecord]查询数据库出现错误：" + sql);
			resultCode = 10;
			resultMsg = "查询数据库出现错误！" + e.getMessage();
		}
		queryDb.close();
		/*--------------------数据操作 结束--------------------*/
		/*--------------------返回数据 开始--------------------*/
		json.put("aaData",jsonList);
		json.put("aaFieldName",jsonName);
		json.put("result_msg",resultMsg);															//如果发生错误就设置成"error"等
		json.put("result_code",resultCode);														//返回0表示正常，不等于0就表示有错误产生，错误代码
		/*--------------------返回数据 结束--------------------*/
	}

	public String createGetRecordSql(Data data) throws JSONException {
		String sql="select * from dzjc_capture_202410";
		String id=data.getParam().has("id")?data.getParam().getString("id"):null;
		if(id != null && !id.isEmpty())
			sql=sql+" where id="+id;
		String deviceId=data.getParam().has("device_id")?data.getParam().getString("device_id"):null;
		if(deviceId != null && !deviceId.isEmpty()) {
			if(sql.indexOf("where")>-1){
				sql=sql+" add record_id like '%"+deviceId+"%'";
			}
			else{
				sql=sql+" where record_id like '%"+deviceId+"%'";
			}
		}
		String deviceName=data.getParam().has("device_name")?data.getParam().getString("device_name"):null;

		if(deviceName != null && !deviceName.isEmpty()) {
			if(sql.indexOf("where")>-1){
				sql=sql+" add vehicle_type like '%"+deviceName+"%'";
			}
			else{
				sql=sql+" where vehicle_type like '%"+deviceName+"%'";
			}

		}
		return sql;

	}
	public void getGpsStatus(Data data,JSONObject json) throws JSONException, SQLException{
		/*--------------------获取变量 开始--------------------*/
		String resultMsg = "ok";
		int resultCode = 0;
		List jsonList = new ArrayList();
		String timeForm=(new SimpleDateFormat("yyyy-MM-dd 00:00:00")).format(new Date());
		String timeTo=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
		int totalGpsActiveCount=0;
		/*--------------------获取变量 完毕--------------------*/
		/*--------------------数据操作 开始--------------------*/
		DbRemote queryDb = new DbRemote("demo");
		String sql="select count(*) as total from gps_history where gps_time BETWEEN '"+timeForm+"' and '"+timeTo+"'";
		showDebug("[getGpsStatus]构造的SQL语句是：" + sql);
		try {
			ResultSet rs = queryDb.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			int fieldCount = rsmd.getColumnCount();
			while (rs.next()) {
				totalGpsActiveCount=rs.getInt("total");
				}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			showDebug("[getGpsStatus]查询数据库出现错误：" + sql);
			resultCode = 10;
			resultMsg = "查询数据库出现错误！" + e.getMessage();
		}
		queryDb.close();
		/*--------------------数据操作 结束--------------------*/
		/*--------------------返回数据 开始--------------------*/
		json.put("aaData",jsonList);
		json.put("gps_vehicle_active_number",totalGpsActiveCount);
		json.put("result_msg",resultMsg);															//如果发生错误就设置成"error"等
		json.put("result_code",resultCode);														//返回0表示正常，不等于0就表示有错误产生，错误代码
		/*--------------------返回数据 结束--------------------*/
	}


    public void getGpsReceiveCountByHour(Data data,JSONObject json) throws JSONException, SQLException{
        /*--------------------获取变量 开始--------------------*/
        String resultMsg = "ok";
        int resultCode = 0;
        List jsonList = new ArrayList();
        Calendar cal=Calendar.getInstance();
        cal.add(Calendar.DATE,-1);
        String timeForm=(new SimpleDateFormat("yyyy-MM-dd 00:00:00")).format(new Date());
        String timeTo=(new SimpleDateFormat("yyyy-MM-dd 23:59:59")).format(new Date());
        /*--------------------获取变量 完毕--------------------*/
        /*--------------------数据操作 开始--------------------*/
        DbRemote queryDb = new DbRemote("demo");
        String sql="select DATE_FORMAT(gps_time,\"%Y-%m-%d %H\") as time_interval,count(*) as total from gps_history";
        sql=sql+" where gps_time BETWEEN '"+timeForm+"' and '"+timeTo+"'";
        sql=sql+" group by DATE_FORMAT(gps_time,\"%Y-%m-%d %H\")";

        showDebug("[getGpsReceiveCountByHour]构造的SQL语句是：" + sql);
        try {
            ResultSet rs = queryDb.executeQuery(sql);
            ResultSetMetaData rsmd = rs.getMetaData();
            int fieldCount = rsmd.getColumnCount();
            while (rs.next()) {
                HashMap map=new HashMap();
                map.put("time_interval",rs.getString("time_interval"));
                map.put("total",rs.getInt("total"));
                jsonList.add(map);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
            showDebug("[getGpsReceiveCountByHour]查询数据库出现错误：" + sql);
            resultCode = 10;
            resultMsg = "查询数据库出现错误！" + e.getMessage();
        }
        queryDb.close();
        /*--------------------数据操作 结束--------------------*/
        /*--------------------返回数据 开始--------------------*/
		showDebug("[getGpsReceiveCountByHour]查看jsonList："+jsonList);
        json.put("aaData",jsonList);
        //json.put("gps_vehicle_active_number",totalGpsActiveCount);
        json.put("result_msg",resultMsg);															//如果发生错误就设置成"error"等
        json.put("result_code",resultCode);														//返回0表示正常，不等于0就表示有错误产生，错误代码
        /*--------------------返回数据 结束--------------------*/
    }

}

