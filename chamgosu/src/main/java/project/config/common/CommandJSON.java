package project.config.common;

import org.json.simple.JSONObject;

public class CommandJSON {
	JSONObject job = new JSONObject();
	
	
	public Object get(String key){
		return job.get(key);
	}
	
	
	public void jobPut(JSONObject jo){
		job = jo;
	}
	
	public void put(String key, Object value){
		job.put(key, value);
	}
	
	public JSONObject getJSON(){
		return job;
	}
}
