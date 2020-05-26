package com.po;

import java.util.List;

public class Page {

	int start;		// ��ʼ���ݵ�����
	int count;		// ÿһҳ������
	int total;		// �ܹ���������
	
	public Page() {
	}
	/**
	 * �ṩһ�����췽��
	 * @param start
	 * @param count
	 */	
	public Page(int start, int count) {
		super();
		this.start = start;
		this.count = count;
	}

	/**
	 * �ж��Ƿ�����һҳ
	 * @return
	 */
	public boolean isHasPreviouse(){
		if(start==0)
			return false;
		return true;

	}
	
	/**
	 * �ж��Ƿ�����һҳ
	 * @return
	 */
	public boolean isHasNext(){
		if(start==getLast())
			return false;
		return true;
	}

	/**
	 * ����õ���ҳ��
	 * @return
	 */
	public int getTotalPage(){
		int totalPage;
		// ����������50�����ܹ���5�����ģ���ô����10ҳ
		if (0 == total % count)
			totalPage = total /count;
			// ����������51�����ܹ���5�����ģ���ô����11ҳ
		else
			totalPage = total / count + 1;

		if(0==totalPage)
			totalPage = 1;
		return totalPage;
	}

	/**
	 * ����õ�βҳ
	 * @return
	 */
	public int getLast(){
		int last;
		// ����������50�����ܹ���5�����ģ���ô���һҳ�Ŀ�ʼ����45
		if (0 == total % count)
			last = total - count;
			// ����������51�����ܹ���5�����ģ���ô���һҳ�Ŀ�ʼ����50
		else
			last = total - total % count;

		last = last<0?0:last;
		return last;
	}

	/* getter and setter */
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	


	
}