package com.myspring.daejeon30.board.vo;

public class PagingVO {
	
	// ���� ������ ��ȣ
	private int num;
	
	// �Խñ� �� ����
	private int count;
	
	// �� �������� ����� �Խù� ����
	private int postNum = 10;
	
	// �ϴ� ����¡ ��ȣ
	private int pageNum;
	
	// ����� �Խù�
	private int displayPost;
	
	// �ѹ��� ǥ���� ����¡ ��ȣ�� ����
	private int pageNumCnt = 10;
	
	// ǥ�õǴ� ������ ��ȣ �� ������ ��ȣ
	private int endPageNum;
	
	// ǥ�õǴ� ������ ��ȣ �� ù��° ��ȣ
	private int startPageNum;
	
	// ����/���� ǥ�� ����
	private boolean prev;
	private boolean next;
	
	
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public void setCount(int count) {
		this.count = count;
		
		dataCalc();
	}
	
	
	
	
	
	
	
	public int getCount() {
		return count;
	}
	public int getPostNum() {
		return postNum;
	}
	
	public int getPageNum() {
		return pageNum;
	}
	
	public int getDisplayPost() {
		return displayPost;
	}
	
	public int getPageNumCnt() {
		return pageNumCnt;
	}
	
	public int getEndPageNum() {
		return endPageNum;
	}
	
	public int getStartPageNum() {
		return startPageNum;
	}
	
	public boolean getPrev() {
		return prev;
	}
	
	public boolean getNext() {
		return next;
	}
	
	private void dataCalc() {
		
		//ǥ�õǴ� ������ ��ȣ�� ������ ��ȣ
				endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt)*pageNumCnt);
				
				// ǥ�õǴ� ������ ��ȣ �� ù��° ��ȣ
				startPageNum = endPageNum - (pageNumCnt -1);
				
				// ������ ��ȣ ����
				int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNumCnt));
				
				if(endPageNum > endPageNum_tmp) {
					endPageNum = endPageNum_tmp;
				}
				
				prev = startPageNum == 1? false : true;
				next = endPageNum * pageNumCnt >= count? false : true;
				
				displayPost = (num - 1) * postNum;
	}
}
