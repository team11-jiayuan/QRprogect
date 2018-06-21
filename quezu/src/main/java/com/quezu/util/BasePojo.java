package com.quezu.util;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class BasePojo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Map<String, Object> extMap;
	
	public BasePojo() {
		this.extMap = new HashMap<String, Object>();
	}
	
	public Map<String, Object> getExtMap() {
		return extMap;
	}
	
	public void setExtMap(Map<String, Object> extMap) {
		this.extMap = extMap;
	}
}
