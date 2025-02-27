package com.book.member.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.member.user.dao.UserDao;
import com.book.member.user.vo.User;

@WebServlet(name = "UserCheckNicknameServlet", urlPatterns = "/user/checkNickname")
public class UserCheckNicknameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        checkId(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        checkId(request, response);
    }

    private void checkId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nickname = request.getParameter("nickname");
        User checknickname = new UserDao().checknickname(nickname);
        System.out.println(nickname);
        if (checknickname != null) {
            response.getWriter().write("duplicate");
        } else {
            response.getWriter().write("available");
        }
    }
}