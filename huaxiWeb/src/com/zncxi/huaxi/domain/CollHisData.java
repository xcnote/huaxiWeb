package com.zncxi.huaxi.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

/**
 * 采集历史数据
 * @author wangzz
 * 
 * 田块数据：
 * 田块1水位，田块2水位，田块3水位，田块4水位，土壤含湿量，片区#1进水管瞬时流量，片区#1进水管累计流量，片区#2进水管瞬时流量，片区#2进水管累计流量，片区#3进水管瞬时流量，片区#3进水管累计流量
 * 一站泵房（含水质数据）：
 * 	水源地水位，水泵出口压力，源水PH，源水浊度
 * 二站泵房（含气象数据）:
 * 	水源地水位，水泵出口压力，风速，风向，大气温度，大气湿度，照度，小时雨量，日雨量
 */
@Entity
@Table(name = "t_collHisData")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class CollHisData {
	
	@Id
	@GenericGenerator(name = "uuid", strategy = "org.hibernate.id.UUIDGenerator")
	@GeneratedValue(generator = "uuid")
	@Column(name = "c_id")
	private String id;
	
	/**
	 * 所属设备
	 */
	@ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
	@JoinColumn(name = "dtuDev_id")
	private DtuDev dtuDev;
	
	/**
	 * 采集时间
	 */
	@Column(name = "c_collTime")
	private Date collTime;
	
	/**
	 * 数据1
	 */
	@Column(name = "c_data1")
	private Double data1;
	
	/**
	 * 数据2
	 */
	@Column(name = "c_data2")
	private Double data2;
	
	/**
	 * 数据3
	 */
	@Column(name = "c_data3")
	private Double data3;
	
	/**
	 * 数据4
	 */
	@Column(name = "c_data4")
	private Double data4;
	
	/**
	 * 数据5
	 */
	@Column(name = "c_data5")
	private Double data5;
	
	/**
	 * 数据6
	 */
	@Column(name = "c_data6")
	private Double data6;
	
	/**
	 * 数据7
	 */
	@Column(name = "c_data7")
	private Double data7;
	
	/**
	 * 数据8
	 */
	@Column(name = "c_data8")
	private Double data8;
	
	/**
	 * 数据9
	 */
	@Column(name = "c_data9")
	private Double data9;
	
	/**
	 * 数据10
	 */
	@Column(name = "c_data10")
	private Double data10;
	
	/**
	 * 数据11
	 */
	@Column(name = "c_data11")
	private Double data11;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public DtuDev getDtuDev() {
		return dtuDev;
	}

	public void setDtuDev(DtuDev dtuDev) {
		this.dtuDev = dtuDev;
	}

	public Date getCollTime() {
		return collTime;
	}

	public void setCollTime(Date collTime) {
		this.collTime = collTime;
	}

	public Double getData1() {
		return data1;
	}

	public void setData1(Double data1) {
		this.data1 = data1;
	}

	public Double getData2() {
		return data2;
	}

	public void setData2(Double data2) {
		this.data2 = data2;
	}

	public Double getData3() {
		return data3;
	}

	public void setData3(Double data3) {
		this.data3 = data3;
	}

	public Double getData4() {
		return data4;
	}

	public void setData4(Double data4) {
		this.data4 = data4;
	}

	public Double getData5() {
		return data5;
	}

	public void setData5(Double data5) {
		this.data5 = data5;
	}

	public Double getData6() {
		return data6;
	}

	public void setData6(Double data6) {
		this.data6 = data6;
	}

	public Double getData7() {
		return data7;
	}

	public void setData7(Double data7) {
		this.data7 = data7;
	}

	public Double getData8() {
		return data8;
	}

	public void setData8(Double data8) {
		this.data8 = data8;
	}

	public Double getData9() {
		return data9;
	}

	public void setData9(Double data9) {
		this.data9 = data9;
	}

	public Double getData10() {
		return data10;
	}

	public void setData10(Double data10) {
		this.data10 = data10;
	}

	public Double getData11() {
		return data11;
	}

	public void setData11(Double data11) {
		this.data11 = data11;
	}
	
	
	
	
}
