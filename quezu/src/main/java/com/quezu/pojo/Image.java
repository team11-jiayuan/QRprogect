package com.quezu.pojo;

import com.quezu.util.BasePojo;

public class Image extends BasePojo {

	private static final long serialVersionUID = 1L;

	//图片id
	private Integer id;
	//物品id
	private String productId;
	//图片url
	private String url;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
