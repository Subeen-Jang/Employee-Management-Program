package com.emp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.emp.dto.empDTO;

public class empDAOImple implements empDAO {
	
	private SqlSessionTemplate sql;
	
	public empDAOImple(SqlSessionTemplate sql) {
		this.sql = sql;
	}
	
	/*직원 등록*/
	 @Override
	public int empInsert(empDTO dto) {
		int count = sql.insert("empInsert",dto);
		return count;
	}
	 
	/*직원 리스트 출력*/ 
	@Override
	public List<empDTO> empList() {
		List<empDTO> list = sql.selectList("empList");
		return list;
	}
	
	/*직원 검색*/
	@Override
	public List<empDTO> empSearch(String category, String keyword) {
		Map map = new HashMap();

		map.put("category", category);
		map.put("keyword", keyword);
		
		List<empDTO> list = sql.selectList("empSearch",map);
		
		return list;
	}
	
	/*직원 정보 상세 보기*/
	@Override
	public empDTO empInfo(int idx) {
		empDTO dto = sql.selectOne("empInfo",idx);
		return dto;
	}
	
	
	/*직원 정보 수정*/
	@Override
	public int empUpdate(empDTO dto) {
		int count = sql.update("empUpdate",dto);
		return count;
	}
	
	/*직원 정보 삭제*/
	@Override
	public int empDelete(int idx) {
		int count = sql.delete("empDelete",idx);
		return count;
	}
}
