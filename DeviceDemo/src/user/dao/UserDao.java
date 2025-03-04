package user.dao;

import device.dao.Data;
import device.dao.Db;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class UserDao {
	public void showDebug(String msg){
		System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date())+"][device/dao/Db]"+msg);
	}
	private boolean checkParamValid(JSONObject param,String field) throws JSONException{
		boolean ok=false;
		ok=param.has(field) && param.getString(field)!=null && !param.getString(field).isEmpty() && !param.getString(field).equals("undefined") && !param.getString(field).equals("null");
		return ok;
	}
	/*添加记录*/
	public void addDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException {
		//构造sql语句，根据传递过来的条件参数
		String deviceId=data.getParam().has("device_id")?data.getParam().getString("device_id"):null;
		String deviceName=data.getParam().has("device_name")?data.getParam().getString("device_name"):null;
		String deviceType=data.getParam().has("device_type")?data.getParam().getString("device_type"):null;
		String createTime=(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
		if(deviceId!=null && deviceName!=null){
			String sql="insert into device_file(device_id,device_name,device_type,used_tag,creator_id,creator,create_time)";
			sql=sql+" values('"+deviceId+"'";
			sql=sql+" ,'"+deviceName+"','"+deviceType+"',1,'20220000000000001','student','"+createTime+"')";
			data.getParam().put("sql",sql);
			updateRecord(data,json);
		}
	}
	/*删除记录*/
	public void deleteDeviceRecord(Data data,JSONObject json) throws JSONException, SQLException{
		//构造sql语句，根据传递过来的条件参数
		String id=data.getParam().has("id")?data.getParam().getString("id"):null;
		if(id!=null){
			String sql="delete from device_file where id="+data.getParam().getString("id");
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
		if(id!=null){
			String sql="update device_file";
			sql=sql+" set device_id='"+deviceId+"'";
			sql=sql+" ,device_name='"+deviceName+"'";
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
	private void updateRecord(Data data,JSONObject json) throws JSONException, SQLException{
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
	private void queryRecord(Data data,JSONObject json) throws JSONException, SQLException{
		/*--------------------获取变量 开始--------------------*/
		String resultMsg = "ok";
		int resultCode = 0;
		List jsonList = new ArrayList();
		/*--------------------获取变量 完毕--------------------*/
		/*--------------------数据操作 开始--------------------*/
		Db queryDb = new Db("test");
		String sql=data.getParam().getString("sql");
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
		json.put("result_msg",resultMsg);															//如果发生错误就设置成"error"等
		json.put("result_code",resultCode);														//返回0表示正常，不等于0就表示有错误产生，错误代码
		/*--------------------返回数据 结束--------------------*/
	}

	private String createGetRecordSql(Data data) throws JSONException {
        String sql="select * from device_file";
        String id=data.getParam().has("id")?data.getParam().getString("id"):null;
        if(id!=null && !id.isEmpty())
            sql=sql+" where id="+id;

        String deviceId=data.getParam().has("device_id")?data.getParam().getString("device_id"):null;
        if(deviceId!=null && !deviceId.isEmpty()) {
            if(sql.indexOf("where")>-1){
                sql=sql+" add device_id like '%"+deviceId+"%'";
            }
            else{
                sql=sql+" where device_id like '%"+deviceId+"%'";
            }
        }
        String deviceName=data.getParam().has("device_name")?data.getParam().getString("device_name"):null;

        if(deviceName!=null && !deviceName.isEmpty()) {
            if(sql.indexOf("where")>-1){
                sql=sql+" add device_name like '%"+deviceName+"%'";
            }
            else{
                sql=sql+" where device_name like '%"+deviceName+"%'";
            }
        }
        return sql;
	}
	public void login(Data data,JSONObject json) throws JSONException,SQLException{
		int resultCode=0;
		String resultMsg="ok";
		List jsonList=new ArrayList();
		String userName=data.getParam().getString("username");
		String password=data.getParam().getString("password");
		String action=data.getParam().getString("action");
		Db queryDb=new Db("test");
		String sql="select * from user_file where user_login_id='"+userName+"' and password='"+password+"'";
		showDebug("[login]构造的SQL语句是：" + sql);
		try{
			ResultSet rs=queryDb.executeQuery(sql);
			ResultSetMetaData rsmd=rs.getMetaData();
			int fieldCount = rsmd.getColumnCount();
			if(!rs.next()){
				resultCode=10;
				resultMsg="登陆失败,请核对用户名和密码";
			}
			rs.close();
		}catch (Exception e){
			e.printStackTrace();
			showDebug("[login]查询数据库错误：" + sql);
			resultCode=10;
			resultMsg="查询数据库错误"+e.getMessage();
		}
		queryDb.close();
		json.put("aaData",jsonList);
		json.put("action",action);
		json.put("result_msg",resultMsg);
		json.put("result_code",resultCode);
	}


}
