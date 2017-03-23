package com.imut.journal.entity;

import java.io.Serializable;
import java.util.List;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;

@SuppressWarnings("serial")
@XmlRootElement(name="Result")
public class Result implements Serializable{

	private String error_code;
	private List<Object> data;
	
	public String getError_code() {
		return error_code;
	}
	@XmlAttribute(name="error_code")
	public void setError_code(String error_code) {
		this.error_code = error_code;
	}
	public List<Object> getData() {
		return data;
	}
	@XmlAttribute(name="data")
	public void setData(List<Object> data) {
		this.data = data;
	}

	
}