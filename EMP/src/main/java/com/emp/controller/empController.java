package com.emp.controller;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;


import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.emp.dao.empDAO;
import com.emp.dao.mailService;
import com.emp.dto.empDTO;
import com.emp.dto.mailDTO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

@Controller
public class empController {
	
	@Autowired empDAO dao;
	@Autowired mailService mailService;
	
	/*메인 페이지 이동*/
	@RequestMapping("/index.do")
	public String goMain() {
		return "/register";
	}
	
	/*직원 등록*/
	@RequestMapping("/register.do")
	public ModelAndView register(empDTO dto) {
		int count = dao.empInsert(dto);
		
		String msg = count>0? "직원 정보가 등록되었습니다":"직원 정보 등록에 실패하였습니다.\n다시 시도해주세요";
		String url = count>0? "list.do":"main.do";
				
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		
		mav.setViewName("/msg");
		
		return mav;
	}
	
	/*직원 리스트 출력*/
	@RequestMapping("/list.do")
	public ModelAndView empList() {
		
		List<empDTO> list = dao.empList();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	/*직원 검색*/
	@RequestMapping("/empSearch.do")
	public ModelAndView empSearch(@RequestParam("category")String category,
			@RequestParam("keyword")String keyword) {
		
		List<empDTO> list = dao.empSearch(category, keyword);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list", list);
		mav.setViewName("/list");
		return mav;
		
	}
	
	/*직원 정보 상세 보기*/
	@RequestMapping("/empInfo.do")
	public ModelAndView info(@RequestParam("idx")int idx) {
		empDTO dto = dao.empInfo(idx);
		
		ModelAndView mav  = new ModelAndView();
		
		mav.addObject("dto", dto);
		mav.setViewName("/info");
		
		return mav;
	}
	
	
	/*메일 페이지 이동*/
	@RequestMapping("/mail.do")
	public ModelAndView mail(@RequestParam("email")String email) {
		String userEmail = email;
		ModelAndView mav  = new ModelAndView();
		
		mav.addObject("email", userEmail);
		mav.setViewName("/mail");
		
		return mav;
	}
	
	/*메일 송부*/
	@RequestMapping("/mailSend.do")
	public String sendMail(mailDTO dto) {
		mailService.sendMail(dto);
		
		return "redirect:/list.do";
	}
	
	
	/*직원 정보 수정*/
	@RequestMapping("/update.do")
	public ModelAndView empUpdate(empDTO dto) {
		
		int count  = dao.empUpdate(dto);
		
		ModelAndView mav  = new ModelAndView();
		
		String msg = count>0? "직원 정보가 수정되었습니다":"직원 정보 수정에 실패하였습니다.\n다시 시도해주세요";
		String url = count>0? "list.do":"info.do?idx="+dto.getIdx();
		
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		
		mav.setViewName("/msg");
		return mav;
	}
	
	/*직원 정보 삭제*/
	@RequestMapping("/delete.do")
	public ModelAndView empDelete(@RequestParam("idx")int idx){
		int count = dao.empDelete(idx);
		
		ModelAndView mav  = new ModelAndView();
		
		String msg = count>0? "직원 정보가 삭제되었습니다":"직원 정보 삭제에 실패하였습니다.\n다시 시도해주세요";
		String url = count>0? "list.do":"info.do?idx="+idx;

		mav.addObject("msg", msg);
		mav.addObject("url",url);

		mav.setViewName("/msg");
		
		return mav;
	}
	
	/*csv 파일 다운*/
	@RequestMapping("/downCsv.do")
	public ResponseEntity<String> downCsv() {
		List<empDTO> list = dao.empList();
		
		 HttpHeaders header =  new HttpHeaders();
		 
		   header.add("Content-Type", "text/csv; charset=MS949");
		   header.add("Content-Disposition", "attachment; filename=\"" + "EMP_CSV.csv" + "\""); 
		   
		   return new ResponseEntity<String>(setContent(list), header, HttpStatus.OK);
	}
	
	public String setContent(List<empDTO> list) {
	
		String data ="";

		data += "직원번호, 직급, 이름, 전화번호, 이메일" +"\n";
		for(int i=0;i<list.size();i++) {
			data += list.get(i).getIdx() + ",";
			data += list.get(i).getRank()+ ",";
			data += list.get(i).getName()+ ",";
			data += list.get(i).getTel() + ",";
			data += list.get(i).getEmail()+ "\n";
		}
		return data;
	}
	
	/*엑셀 파일 다운*/
	@RequestMapping("downExcel.do")
	public void excelDownload(HttpServletResponse response) throws IOException {
	    List<empDTO> list = dao.empList();
	   
	    if (list != null&&list.size()!=0) {
	        XSSFWorkbook wb = new XSSFWorkbook();
	        XSSFSheet sheet = wb.createSheet("직원 정보");

	        // 폰트 및 스타일 설정
	        Font fontHeader = wb.createFont();
	        fontHeader.setFontName("맑은 고딕");
	        XSSFCellStyle headerStyle = wb.createCellStyle();
	        headerStyle.setAlignment(CellStyle.ALIGN_CENTER);
	        headerStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
	        headerStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
	        headerStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	        headerStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
	        headerStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	        headerStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
	        headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	        headerStyle.setFont(fontHeader);

	        XSSFCellStyle bodyStyle = wb.createCellStyle();
	        bodyStyle.setAlignment(CellStyle.ALIGN_LEFT);
	        bodyStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
	        bodyStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
	        bodyStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
	        bodyStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
	        bodyStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
	        
	        
	     
	        // 엑셀 헤더 셋팅
	        String[] headers = {"직원번호", "직급", "이름", "전화번호", "이메일"};
	        int[] columnWidths = {1000, 1000, 2000, 4000, 5000};
	        
	        Row headerRow = sheet.createRow(0);
	        for (int i = 0; i < headers.length; i++) {
	            Cell headerCell = headerRow.createCell(i);
	            headerCell.setCellValue(headers[i]);
	            headerCell.setCellStyle(headerStyle);
	            sheet.setColumnWidth(i, columnWidths[i]);
	        }

	        // 엑셀 바디 셋팅
	        int rowCnt = 1;
	        int cellCnt;
	        for (empDTO dto :list) {
				
	            Row row = sheet.createRow(rowCnt++);
	            
	            // 직원번호
	            Cell cell = row.createCell(0);
	            cell.setCellValue(dto.getIdx());
	            cell.setCellStyle(bodyStyle);
	            
	            // 직급
	            cell = row.createCell(1);
	            cell.setCellValue(dto.getRank());
	            cell.setCellStyle(bodyStyle);
	            
	            // 이름
	            cell = row.createCell(2);
	            cell.setCellValue(dto.getName());
	            cell.setCellStyle(bodyStyle);
	            
	            // 전화번호
	            cell = row.createCell(3);
	            cell.setCellValue(dto.getTel());
	            cell.setCellStyle(bodyStyle);
	            
	            // 이메일
	            cell = row.createCell(4);
	            cell.setCellValue(dto.getEmail());
	            cell.setCellStyle(bodyStyle);
	        }
	       
	        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	        response.setHeader("Content-Disposition", "attachment;filename=EMP_Excel.xlsx");

	        
	        try {
				wb.write(response.getOutputStream());
			}catch(IOException e) {
				e.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			}
	
	    }
	}
	
}
