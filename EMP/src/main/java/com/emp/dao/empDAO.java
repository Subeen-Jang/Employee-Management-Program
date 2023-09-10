package com.emp.dao;

import java.util.List;

import com.emp.dto.empDTO;

public interface empDAO {
	/*직원 등록 */
	public int empInsert(empDTO dto);
	
	/*직원 리스트 출력*/ 
	public List<empDTO> empList();
	
	/*직원 검색*/
	/* public List<empDTO> empSearch(searchDTO sdto); */
	public List<empDTO> empSearch(String category, String keyword);
	
	/*직원 정보 상세 보기*/
	public empDTO empInfo(int idx);
	
	/*직원 정보 수정*/
	public int empUpdate(empDTO dto);
	
	/*직원 정보 삭제*/
	public int empDelete(int idx);
}
