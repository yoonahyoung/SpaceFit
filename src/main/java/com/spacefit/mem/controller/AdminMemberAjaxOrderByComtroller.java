package com.spacefit.mem.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.spacefit.mem.model.service.MemberService;
import com.spacefit.mem.model.vo.Member;

/**
 * Servlet implementation class AdminMemberAjaxOrderByComtroller
 */
@WebServlet("/orderByMem.me")
public class AdminMemberAjaxOrderByComtroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberAjaxOrderByComtroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	
		String orderBy = request.getParameter("orderBy");
		
		String search1 = "";
		String search2 = "";
		String searchText = request.getParameter("searchText");
		
		// 검색이 없을 경우제외
		if(searchText != null && !searchText.equals("")) {
			
			switch(request.getParameter("searchType")) {
				case "userId" : search1 += " WHERE MEM_ID LIKE '%"+ searchText + "%'"; 
								search2 += " AND MEM_ID LIKE '%"+ searchText + "%'";
								break;
				case "gradeName" : search1 += " WHERE GR_NAME LIKE '%"+ searchText + "%'";
								   search2 += " AND GR_NAME LIKE '%"+ searchText + "%'";
								   break;
			
			} 
			
		}
		
		ArrayList<Member> memList = new MemberService().selectMemberListOrderBy(orderBy, search1, search2);
		
		
		response.setContentType("application/json; charset=UTF-8");
		if(memList.isEmpty()) {
			new Gson().toJson(memList, response.getWriter());
		} else {
			new Gson().toJson(memList, response.getWriter());
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
