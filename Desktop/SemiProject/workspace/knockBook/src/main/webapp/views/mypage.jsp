<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>6캔두잇</title> 
	<link href="../resources/css/header.css" rel="stylesheet" type="text/css">
	<link href="../resources/css/mypage.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="../resources/javascript/mypageSidebar.js"></script>
	<script type="text/javascript" src="../resources/javascript/calendar.js"></script>
<!--     <script type="text/javascript" src="../resources/javascript/jquery.js"></script> -->
    
</head>

<body>
    <section class="main_header">
        <header>
            <nav id="header_nav">
                <a href="#" id="main_logo">Knock Book</a>
                <ul>
                    <li><a href="#" class="header_list">도서 목록</a></li>
                    <li><a href="#" class="header_list">이벤트</a></li>
                    <li><a href="#" class="header_list" id="header_join">로그인</a></li>
                    <li><a href="#" class="header_list" id="header_join">회원가입</a></li> 
                </ul>
            </nav>
        </header>
    </section> 
        <div class="main_content">
        <!-- 이 선 위는 변경 X -->
        <!-- 아래에 추가 --> 
        <div class="section1">
            <ul class="menu">
                <li class="menu-item"><a href="#">나의 정보</a></li>
                <li class="menu-item"><a href="#">팔로잉 목록</a></li>
                <li class="menu-item">
                    <a href="#">독후감 목록</a>
                    <ul class="submenu">
                        <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp; 작성된 독후감</a></li>
                        <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp; 나만보기</a></li>
                    </ul>
                </li>
                <li class="menu-item"><a href="#">이벤트 참여 내역</a></li>
                <li class="menu-item"><a href="#">도서 신청</a></li>
                <li class="menu-item">
                    <a href="#">문의 사항</a>
                    <ul class="submenu">
                        <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp; 문의 사항 작성</a></li>
                        <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp; 문의 사항 목록</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="section2">
            <div class="profileForm">
                <div id="myProfile">나의 프로필</div>
                <div class="profileInfo">
                    <div>아이디  
                        <input type="text" id="id" value="user01">
                    </div>
                    <div>이메일  
                        <input type="text" id="email" value="dev@gmail.com">
                    </div>
                    <div>닉네임  
                        <input type="text" id="email" value="상냥한 복숭아">
                    </div>
                </div>
                <div class="updateProfile">
                    <a href="#" id="profileBtn">프로필 수정</a>
                </div>
            </div>
            <div class="underForm">
                <div class="calendarForm">
                    <div id="attend">출석</div>
                    <div class="sec_cal">
                        <div class="cal_nav">
                            <a href="javascript:;" class="nav-btn go-prev">prev</a>
                            <div class="year-month"></div>
                            <a href="javascript:;" class="nav-btn go-next">next</a>
                            </div>
                            <div class="cal_wrap">
                            <div class="days">
                                <div class="day">MON</div>
                                <div class="day">TUE</div>
                                <div class="day">WED</div>
                                <div class="day">THU</div>
                                <div class="day">FRI</div>
                                <div class="day">SAT</div>
                                <div class="day">SUN</div>
                            </div>
                            <div class="dates"></div>
                        </div>
                    </div>
                </div>
                <div class="sec3">
                    <div class="myRec">나의 활동</div>
                    <div class="myRecForm">
                        <div>팔로잉 수
                            <input type="text" id="followingCount" value="150">
                        </div>
                        <div>이벤트 참여 수
                            <input type="text" id="eventCount" value="10">
                        </div>
                        <div>독후감 수
                            <input type="text" id="btCount" value="50">
                        </div>
                        <div>문의사항 수
                            <input type="text" id="askCount" value="50">
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </div>
</body> 
</html>
