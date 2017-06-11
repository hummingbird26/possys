<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<title>Main_POS SYSTEM</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="${pageContext.request.contextPath}/resources/main_assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main_assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main_assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main_assets/css/ie9.css" /><![endif]-->
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<h1>POS SYS</h1>
				<nav>
					<ul>
						<li><a href="#intro">Main</a></li>
						<li><a href="#one">발주관리</a></li>
						<li><a href="#two">메뉴관리</a></li>
						<li><a href="#admin">직원 및 회원 관리</a></li>
						<li><a href="#shop">매장관리</a></li>
					</ul>
				</nav>
			</header>

		<!-- 소개 -->
			<section id="intro" class="main style1 dark fullscreen">
				<div class="content">
					<header>
						<h2>팀 프로젝트 소개입니다.</h2>
					</header>
					<p>Welcome to <strong>POS SYS</strong></p>
					<footer>
						<a href="#one" class="button style2 down">More</a>
					</footer>
				</div>
			</section>

		<!-- 발주 -->
			<section id="one" class="main style2 right dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>발주관리 메뉴입니다.</h2>
					</header>
					<p>주요 기능: 메뉴 주문시 소진되는 식자재를 발주신청을 통해 신청가능하다
					  </p>
				</div>
				<a href="#two" class="button style2 down anchored">Next</a>
			</section>

		<!-- 메뉴 -->
			<section id="two" class="main style2 left dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>메뉴 관리</h2>
					</header>
					<p>주요기능:새로운 메뉴를 등록 및 관리가 가능하고 해당 메뉴에 필요한 식자재를 등록 할 수 있다</p>
				</div>
				<a href="#admin" class="button style2 down anchored">Next</a>
			</section>
		
		
		<!-- 직원 -->
					<section id="admin" class="main style2 right dark fullscreen">
						<div class="content box style2">
							<header>
								<h2>직원 및 회원관리 메뉴입니다.</h2>
							</header>
							<p>주요 기능: 회원 및 직원의 정보를 관리합니다.
							  </p>
						</div>
						<a href="#shop" class="button style2 down anchored">Next</a>
					</section>

		<!-- 매장 -->
			<section id="shop" class="main style2 left dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>매장 관리</h2>
					</header>
					<p>주요기능:매장의 매출현황 및 테이블 현황을 통해 매장에 관한 전반적인 상태를 확인할 수 있다.</p>
				</div>
				<a href="#work" class="button style2 down anchored">Next</a>
			</section>



		<!-- Work -->
			<section id="work" class="main style3 primary">
				<div class="content">
					<header>
						<h2>시작하기</h2>
						<p>시작하기 버튼을 클릭하시면 로그인 페이지로 이동합니다.</p>
					</header>
				<input type="button" value="시작하기" onclick="location.href='join'";/>
					<!-- Gallery  -->
		<%-- 				<div class="gallery">
							<article class="from-left">
								<a href="${pageContext.request.contextPath}/resources/main_images/fulls/01.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/main_images/thumbs/01.jpg" title="The Anonymous Red" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="${pageContext.request.contextPath}/resources/main_images/fulls/02.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/main_images/thumbs/02.jpg" title="Airchitecture II" alt="" /></a>
							</article>
							<article class="from-left">
								<a href="${pageContext.request.contextPath}/resources/main_images/fulls/03.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/main_images/thumbs/03.jpg" title="Air Lounge" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="${pageContext.request.contextPath}/resources/main_images/fulls/04.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/main_images/thumbs/04.jpg" title="Carry on" alt="" /></a>
							</article>
							<article class="from-left">
								<a href="${pageContext.request.contextPath}/resources/main_images/fulls/05.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/main_images/thumbs/05.jpg" title="The sparkling shell" alt="" /></a>
							</article>
							<article class="from-right">
								<a href="${pageContext.request.contextPath}/resources/main_images/fulls/06.jpg" class="image fit"><img src="${pageContext.request.contextPath}/resources/main_images/thumbs/06.jpg" title="Bent IX" alt="" /></a>
							</article>
						</div>
 --%>
				</div>
			</section>

		<!-- Contact -->
		<!-- 	<section id="contact" class="main style3 secondary">
				<div class="content">
					
					<div class="box">
						<form method="post" action="#">
							<div class="field half first"><input type="text" name="name" placeholder="Name" /></div>
							<div class="field half"><input type="email" name="email" placeholder="Email" /></div>
							<div class="field"><textarea name="message" placeholder="Message" rows="6"></textarea></div>
							<ul class="actions">
								<li><input type="submit" value="Send Message" /></li>
							</ul>
						</form>
					</div>
				</div>
			</section> -->

		<!-- Footer -->
			<footer id="footer">


			</footer>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/jquery.poptrox.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/jquery.scrollex.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/skel.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="${pageContext.request.contextPath}/resources/main_assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${pageContext.request.contextPath}/resources/main_assets/js/main.js"></script>

	</body>
</html>