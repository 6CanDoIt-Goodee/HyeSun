<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>6캔두잇</title>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous"
    />
    <style>
         * {
            font-family: 'Ownglyph_meetme-Rg';
        }
        .write_container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 2vw;
        }
        .form_write {
            display: flex;
            flex-direction: row;
            gap: 2vw;
            width: 80vw;
            border: 1px solid black;
            border-radius: 10px;
            padding: 2vw;
        }
        .form_left {
            flex: 2;
            display: flex;
            flex-direction: column;
            gap: 1.5vw;
        }
        .form_right {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .form_right img { 
            max-width: 100%;
            border-radius: 10px;
        }
        .input-field {
            height: 50px;
            border-radius: 10px;
            border: 2px solid #3232321f;
            padding: 0 10px;
            width: 100%;
        }
        textarea {
            width: 100%;
            height: 20rem;
            border-radius: 10px;
            border: 2px solid #3232321f;
            resize: none;
            padding: 10px;
        }
        .bw_btn {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
            width: 100%;
        }
        .btn {
            padding: 10px 20px;
            font-size: 16px;
            width: 100%;
        }
    </style>
</head>
<body>
    <%@ include file="../../include/header.jsp" %>
    <%@page import="com.book.member.book.vo.BookText, java.util.*" %>

    <section class="holeList">
        <div class="word">
            <h3>독후감 작성</h3>
        </div>
        <form class="form_write" name="create_account_form" id="create_account_form" action="/user/saveTextEnd" method="post">
            <div class="form_left">
                <div class="form_first">
                    <%
                    List<Map<String, String>> resultList = (List<Map<String, String>>) request.getAttribute("resultList");
                    Map<String, String> book = null;
                    if (resultList != null && !resultList.isEmpty()) {
                        book = resultList.get(0);
                    %>
                    <input type="hidden" name="save_no" id="save_no" value="<%= book.get("save_no") %>" />
                    <input type="hidden" name="bk_no" id="bk_no" value="<%= book.get("bk_no") %>" />
                    <input type="hidden" name="user_no" id="user_no" value="<%= book.get("user_no") %>" />
                    <div>
                        <label for="bk_title">도서이름</label>
                        <input type="text" name="bk_title" id="bk_title" value="<%= book.get("bk_title") %>" class="input-field" readonly />
                    </div>
                    <div>
                        <label for="bk_author">저자</label>
                        <input type="text" id="bk_author" name="bk_author" value="<%= book.get("bk_author") %>" class="input-field" readonly />
                    </div>
                    <div>
                        <label for="bk_publisher_name">출판사</label>
                        <input type="text" id="bk_publisher_name" name="bk_publisher_name" value="<%= book.get("bk_publisher_name") %>" class="input-field" readonly />
                    </div>
                    <div>
                        <label for="bk_category">카테고리</label>
                        <input type="text" id="bk_category" name="bk_category" value="<%= book.get("bk_category") %>" class="input-field" readonly />
                    </div>
                </div>
                <div class="form_second">
                    <div>
                        <label for="bk_recommendation">추천도</label>
                        <select name="bk_recommendation" id="bk_recommendation" class="input-field" required>
                            <option value="">추천도</option>
                            <option value="1" <%= "1".equals(book.get("recommendation_no")) ? "selected" : "" %>>별로</option>
                            <option value="2" <%= "2".equals(book.get("recommendation_no")) ? "selected" : "" %>>나쁘지 않음</option>
                            <option value="3" <%= "3".equals(book.get("recommendation_no")) ? "selected" : "" %>>보통</option>
                            <option value="4" <%= "4".equals(book.get("recommendation_no")) ? "selected" : "" %>>좋음</option>
                            <option value="5" <%= "5".equals(book.get("recommendation_no")) ? "selected" : "" %>>매우좋음</option>
                        </select>
                    </div>
                    <div>
                        <label for="bw_start_date">읽기시작</label>
                        <input type="date" id="bw_start_date" name="bw_start_date" class="input-field" value="<%= book.get("bw_start_date") %>" required />
                    </div>
                    <div>
                        <label for="bw_end_date">읽기종료</label>
                        <input type="date" id="bw_end_date" name="bw_end_date" class="input-field" value="<%= book.get("bw_end_date") %>" required />
                    </div>
                </div>
                <div class="form_third">
                    <label for="bw_content">내용</label>
                    <textarea name="bw_content" required><%= book.get("bw_content") %></textarea>
                </div>
            </div>
            <div class="form_right">
                <img src="<%= book.get("bk_img") %>" alt="Book Image" />
                <div class="bw_btn">
                    <button type="button" class="btn btn-secondary" onclick="saveForm();">임시저장</button>
                    <button type="button" class="btn btn-secondary" onclick="deleteForm();">삭제</button>
                    <button type="button" class="btn btn-primary" onclick="submitForm();">제출</button>
                </div>
            </div>
            <% } %>
        </form>
    </section>

    <script>
        function validateForm() {
            var form = document.getElementById('create_account_form');
            var inputs = form.querySelectorAll('input[required], select[required], textarea[required]');
            for (var i = 0; i < inputs.length; i++) {
                if (!inputs[i].value) {
                    alert('모든 필드를 작성해 주세요.');
                    return false;
                }
            }
            return true;
        }

        function submitForm() {
            if (validateForm()) {
                var form = document.getElementById('create_account_form');
                form.action = '/user/saveTextEnd?action=submit';
                form.submit();
            }
        }

        function saveForm() {
            var form = document.getElementById('create_account_form');
            form.action = '/user/saveTextEnd?action=save';
            form.submit();
        }

        function deleteForm() {
            var form = document.getElementById('create_account_form');
            form.action = '/user/saveTextEnd?action=delete';
            form.submit();
        }
    </script>
</body>
</html>
