<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
	<main>
		<div class="container">
			<section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
							<div class="d-flex justify-content-center py-4">
								<a href="/jobel/co_home" class="logo d-flex align-items-center w-auto">
									<img src="assets/img/logo.png" alt="">
									<span class="d-none d-lg-block">JOB을래</span>
								</a>
							</div>
							<!-- End Logo -->
							<div class="card mb-3">
								<div class="card-body">
									<div class="pt-4 pb-2">
										<h5 class="card-title text-center pb-0 fs-4">비밀번호 재확인</h5>
										<p class="text-center small">
											안전한 사용을 위해 비밀번호를 다시 한 번 입력해주세요.
										</p>
									</div>
									<form action="/jobel/co_mem_pw_check" method="post" class="row g-3 needs-validation" novalidate>
										<div class="col-12">
											<label for="checkPassword" class="form-label">비밀번호</label>
											<input type="password" name="password" class="form-control" id="checkPassword" required>
											<div class="invalid-feedback">비밀번호를 입력해주세요!</div>
										</div>
										<div class="col-12">
											<button class="btn btn-primary w-100" type="submit">확인</button>
										</div>
										<sec:csrfInput/>
									</form>
									<c:if test="${errors != null }">
										<script type="text/javascript">
											alert("${errors}");
											<c:remove var="errors" scope="request"/>
										</script>
									</c:if>
								</div>
							</div>
							<div class="credits position-absolute bottom-0">
								Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</main><!-- End #main -->
