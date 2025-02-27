package com.book.member.book.controller;

import com.book.member.book.dao.BookTextDao;
import com.book.member.book.vo.BookText;
import com.book.member.user.vo.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;
//회원별 개인 임시저장 목록
@WebServlet("/user/saveTextList")
public class BookTextSaveListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BookTextSaveListServlet() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            // 검색어를 받아옵니다.
            String content = request.getParameter("bk_content");
            User user_saveText = (User) session.getAttribute("user");
            System.out.println(user_saveText.getUser_no());
            // 추천도 값을 받아옵니다.
            String recommendation = request.getParameter("recommendation");

            if (content == null) {
                content = ""; // null 대신 빈 문자열로 설정
            }
            // 예외 처리: recommendation 값이 없을 경우 기본값 설정
            if (recommendation == null || recommendation.isEmpty()) {
                recommendation = "0"; // 기본값
            }

            // BookText 객체를 생성하고 현재 페이지를 설정합니다.
            BookText bt = new BookText();
            String nowPage = request.getParameter("nowPage");
            if (nowPage != null) {
                bt.setNowPage(Integer.parseInt(nowPage));
            }

            // 전체 목록 개수를 구하고 페이징바를 구성합니다.
            bt.setTotalData(new BookTextDao().saveBooktextCount(user_saveText.getUser_no(),bt, content, recommendation));

            // 검색어와 추천도를 이용해 책 목록을 조회합니다.
            List<Map<String, String>> list = new BookTextDao().selectSaveText(user_saveText.getUser_no(), bt, content, recommendation);

            // 요청 객체에 결과를 설정합니다.
            request.setAttribute("paging", bt);
            request.setAttribute("resultList", list);
            request.setAttribute("searchContent", content); // 검색어를 다시 JSP로 전달
            request.setAttribute("selectedRecommendation", recommendation); // 선택된 추천도를 다시 JSP로 전달
            System.out.println(list);
            // JSP로 포워딩합니다.
            RequestDispatcher rd = request.getRequestDispatcher("/views/member/book/booktextSaveList.jsp");
            rd.forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}
