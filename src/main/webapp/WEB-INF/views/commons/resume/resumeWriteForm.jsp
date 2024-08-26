<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

	<div class="content__">
		<div class="content__header__">
			<!-- 장식이 필요할 거 같으면 사용하고 아니면 없애면 될 영역 -->
		</div>
		
		<div class="resumeContainer">
			<div class="resumeTitle">
			<button type="button" class="btn btn-primary" id="explainBtn" style="position: absolute;right: 15%;top: 5%;">데이터 입력</button>
				<span class="titleText">지원서 작성</span>
				<div class="titleInfo">
					<p class="titleName">${member.name }</p>
					<p class="titleHumanInfo">
						<c:if test="${member.gender == 'W' }">여</c:if>
						<c:if test="${member.gender == 'M' }">남</c:if>,
						<c:set value="${member.brdt }" var="myBrdt" />
						${myBrdt.substring(0,4) }년 ${myBrdt.substring(4,6) }월 ${myBrdt.substring(6) }일
					</p>

					<hr/>
					
					<p class="titleBasicInfo">
						<i class="bx bx-envelope"></i>
						<span>${member.email }</span>
					</p>
					<p class="titleBasicInfo">
						<i class="bx bx-phone"></i>
						<c:set value="${member.telno }" var="myTelno" />
						<span>${myTelno.substring(0,3) }-${myTelno.substring(3,7) }-${myTelno.substring(7) }</span>
					</p>
					<p class="titleBasicInfo">
						<i class="bx bx-home"></i>
						<span>(${member.postcode }) ${member.addressBasic } ${member.addressDetail }</span>
					</p>
				</div>		<!-- titleInfo 끝 -->
				<div class="pictureBox">
					<label for="imgFile">
						<c:choose>
							<c:when test="${resume.rsmPhotoPath != null }">
								<img src="${pageContext.request.contextPath }${resume.rsmPhotoPath }" id="profileImg">
								<c:set var="rsmPhotoPath" value="${resume.rsmPhotoPath }" />
							</c:when>
							<c:when test="${(resume.rsmPhotoPath == null or resume.rsmPhotoPath == '' ) and member.profilePhotoPath != null }">
								<img src="${pageContext.request.contextPath }${member.profilePhotoPath }" id="profileImg">
								<c:set var="rsmPhotoPath" value="${member.profilePhotoPath }" />
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath }/resources/images/default/default_profile.png" id="profileImg">
							</c:otherwise>
						</c:choose>
						<input type="file" name="imgFile" id="imgFile" style="display:none;"/>
						<input type="hidden" value="${rsmPhotoPath }" name="rsmPhotoPath" id="rsmPhotoPath"/>
					</label>
				</div>
			</div>		<!-- resumeTitle 끝 -->
			
			<hr class="resumeContour mb-3" />

			<div class="resumeContent">
				<div class="contentItem d-flex align-items-center">
					<label class="form-label col-2 text-center d-block contentTitle m-0" for="rsmTitle">이력서 제목 : </label>
					<input type="text" class="form-control" name="rsmTitle" value="${resume.rsmTitle }"/>
				</div>
	
				<hr class="resumeContour" />
				
				<div class="contentItem" id="eduContent">		<!-- contentItem(학력사항) -->
					<div class="contentHeader">
						<span class="contentTitle">학력사항</span>
						<p class="contentTitleDesc"> * 학력은 고등학교에서부터 현 최종학력 순으로 순차적으로 기재하시기 바랍니다.</p>
						<p class="contentTitleDesc"> * 복수전공 및 이중 전공을 이수하신 분들은 부전공란에 입력해주세요.</p>
						<p class="contentTitleDesc"> * 졸업, 휴학, 재학을 제외한 경우 졸업 일자에 최종적으로 다닌 일자를 기입해주세요.</p>
					</div>
					<c:choose>
						<c:when test="${resume.educationList[0].eduNo == 0 or empty resume.educationList}">
							<div class="itemInputBox">
								<form class="educationForm" method="post" enctype="multipart/form-data">
									<div class="itemMenuBox">
										<div class="itemTitle">학력 구분</div>
										<div class="itemValue">
											<select class="resumeSelect eduSelect schSelect" name="eduDivision" id="eduDivision">
												<option value="" selected>학력 구분 선택</option>
												<c:forEach items="${schtypeList }" var="schtype">
													<c:if test="${schtype.commonCodeDetail != 'SCHTYPE000' }">	<!-- 학력 무관 코드 제외 -->
														<option value="${schtype.commonCodeDetail }">${schtype.commonDetailName }</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">학교 소재</div>
										<div class="itemValue">
											<select class="resumeSelect eduSelect eduColumn highSch" name="eduLocation" id="eduLocation" disabled="disabled">
												<option value="" selected="selected">소재지</option>
												<c:forEach items="${regtypeList }" var="regtype">
													<option value="${regtype.commonCodeDetail }">${regtype.commonDetailName }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">학교명</div>
										<div class="itemValue">
											<input class="resumeInput eduInput eduColumn highSch" type="text" name="schoolName" id="schoolName" placeholder="학교명" disabled="disabled"/>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<div class="itemTitle">졸업여부</div>
										<div class="itemValue">
											<select class="resumeSelect eduSelect eduColumn grdSelect" disabled="disabled" name="gradeType">
												<option value="" selected="selected" >졸업여부</option>
												<c:forEach items="${grdtypeList }" var="grdtype">
													<option value="${grdtype.commonCodeDetail }">${grdtype.commonDetailName }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<div class="itemTitle">전공</div>
										<div class="itemValue">
											<input class="resumeInput eduInput eduColumn" type="text" name="major" placeholder="학과명" disabled="disabled"/>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<div class="itemTitle">부전공</div>
										<div class="itemValue">
											<input class="resumeInput eduInput eduColumn" type="text" name="subMajor" placeholder="없을 시 공백" disabled="disabled"/>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<div class="itemTitle">기준학점</div>
										<div class="itemValue">
											<select class="resumeSelect eduSelect eduColumn" disabled="disabled" name="gradeBasis">
												<option value="" selected="selected">학점선택</option>
												<c:forEach items="${grdbaseList }" var="grdbase">
													<option value="${grdbase.commonCodeDetail }">${grdbase.commonDetailName }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<div class="itemTitle">평점</div>
										<div class="itemValue">
											<input class="resumeInput eduInput eduColumn" type="number" name="gradeAvg" disabled="disabled"/>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">입학일자</div>
										<div class="itemValue">
											<input class="resumeInput eduInput eduColumn highSch" type="date" name="enterYmd" disabled="disabled">
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">졸업일자</div>
										<div class="itemValue">
											<input class="resumeInput eduInput eduColumn highSch" type="date" name="graduateYmd" disabled="disabled">
										</div>
									</div>
									<div class="itemMenuBox btnBox">
										<div class="itemTitle">&nbsp;</div>
										<div class="itemValue">
											<button type="button" class="resumeBtn eduAddBtn"><i class="bx bx-plus"></i></button>
										</div>
									</div>
								</form>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${resume.educationList }" var="education" varStatus="stat">
							<div class="itemInputBox">
								<form class="educationForm" method="post" enctype="multipart/form-data">
									<div class="itemMenuBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">학력 구분</div>
										</c:if>
										<div class="itemValue">
											<select class="resumeSelect eduSelect schSelect" name="eduDivision">
												<option value="">학력 구분 선택</option>
												<c:forEach items="${schtypeList }" var="schtype">
													<c:if test="${schtype.commonCodeDetail != 'SCHTYPE000' }">	<!-- 학력 무관 코드 제외 -->
														<option value="${schtype.commonCodeDetail }" <c:if test="${education.eduDivision == schtype.commonCodeDetail}">selected</c:if>>
															${schtype.commonDetailName }
														</option>
													</c:if>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="itemMenuBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">학교 소재</div>
										</c:if>
										<div class="itemValue">
											<select class="resumeSelect eduSelect eduColumn highSch" name="eduLocation">
												<option value="">소재지</option>
												<c:forEach items="${regtypeList }" var="regtype">
													<option value="${regtype.commonCodeDetail }" <c:if test="${education.eduLocation == regtype.commonCodeDetail }">selected</c:if>>
														${regtype.commonDetailName }
													</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="itemMenuBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">학교명</div>
										</c:if>
										<div class="itemValue">
											<input class="resumeInput eduInput eduColumn highSch" type="text" name="schoolName" placeholder="학교명" value="${education.schoolName }"/>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">졸업여부</div>
										</c:if>
										<div class="itemValue">
											<select class="resumeSelect eduSelect eduColumn grdSelect" name="gradeType">
												<option value="">졸업여부</option>
												<c:forEach items="${grdtypeList }" var="grdtype">
													<option value="${grdtype.commonCodeDetail }" <c:if test="${education.gradeType == grdtype.commonCodeDetail }">selected</c:if>>
														${grdtype.commonDetailName }
													</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">전공</div>
										</c:if>
										<div class="itemValue">
											<input class="resumeInput eduInput eduColumn" type="text" name="major" placeholder="학과명" value="${education.major }" <c:if test="${education.eduDivision == 'SCHTYPE001' }">disabled</c:if>/>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">부전공</div>
										</c:if>
										<div class="itemValue">
											<input class="resumeInput eduInput eduColumn" type="text" name="subMajor" placeholder="없을 시 공백" value="${education.subMajor }" <c:if test="${education.eduDivision == 'SCHTYPE001' }">disabled</c:if>/>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">기준학점</div>
										</c:if>
										<div class="itemValue">
											<select class="resumeSelect eduSelect eduColumn" name="gradeBasis" <c:if test="${education.eduDivision == 'SCHTYPE001' }">disabled</c:if>>
												<option value="">학점선택</option>
												<c:forEach items="${grdbaseList }" var="grdbase">
													<option value="${grdbase.commonCodeDetail }" <c:if test="${education.gradeBasis == grdbase.commonCodeDetail }">selected</c:if>>
														${grdbase.commonDetailName }
													</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">평점</div>
										</c:if>
										<div class="itemValue">
											<input class="resumeInput eduInput eduColumn" type="number" name="gradeAvg" value="${education.gradeAvg }" <c:if test="${education.eduDivision == 'SCHTYPE001' }">disabled</c:if>/>
										</div>
									</div>
									<div class="itemMenuBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">입학일자</div>
										</c:if>
										<div class="itemValue">
											<c:set var="enterYmd" value="${education.enterYmd }" />
											<fmt:parseDate value="${enterYmd }" var="parseEnterYmd" pattern="yyyyMMdd"/>
											<input class="resumeInput eduInput eduColumn highSch" type="date" name="enterYmd" value='<fmt:formatDate value="${parseEnterYmd }" pattern="yyyy-MM-dd"/>'>
										</div>
									</div>
									<div class="itemMenuBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">졸업일자</div>
										</c:if>
										<div class="itemValue">
											<c:set var="graduateYmd" value="${education.graduateYmd }" />
											<fmt:parseDate value="${graduateYmd }" var="parseGraduateYmd" pattern="yyyyMMdd"/>
											<input class="resumeInput eduInput eduColumn highSch" type="date" name="graduateYmd" value='<fmt:formatDate value="${parseGraduateYmd }" pattern="yyyy-MM-dd"/>'>
										</div>
									</div>
									<div class="itemMenuBox btnBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">&nbsp;</div>
										</c:if>
										<div class="itemValue">
											<c:if test="${stat.index == 0 }">
												<button type="button" class="resumeBtn eduAddBtn"><i class="bx bx-plus"></i></button>
											</c:if>
											<c:if test="${stat.index != 0 }">
												<button type="button" class="resumeBtn eduDelBtn"><i class="bx bx-minus"></i></button>
											</c:if>
										</div>
									</div>
								</form>
							</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>		<!-- contentItem(학력사항) 끝 -->
				
				<hr class="resumeContour" />
				
				<div class="contentItem" id="wrkContent">		<!-- content(경력사항) -->
					<div class="contentHeader">
						<span class="contentTitle">경력사항</span>
						<p class="contentTitleDesc"> * 증명이 불가능한 경력 및 직무와 무관한 아르바이트 경력은 기재하지 않습니다.</p>
						<p class="contentTitleDesc"> * 최종 회사에 재직 중이면 퇴사일은 비워 두셔도 됩니다.</p>
					</div>
					<c:choose>
						<c:when test="${resume.careerList[0].careerNo == 0 or empty resume.careerList}">
							<div class="itemInputBox">
								<form class="careerForm">
									<div class="itemMenuBox">
										<div class="itemTitle">고용형태</div>
										<div class="itemValue">
											<select class="resumeSelect" name="workType">
												<option value="">고용형태</option>
												<c:forEach items="${wrktypeList }" var="wrktype">
													<option value="${wrktype.commonCodeDetail }">${wrktype.commonDetailName }</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">회사명</div>
										<div class="itemValue">
											<input class="resumeInput" type="text" name="companyName" placeholder="회사명" />
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">직무명</div>
										<div class="itemValue">
											<input class="resumeInput" type="text" name="jobName" placeholder="직무명" />
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">입사일</div>
										<div class="itemValue">
											<input class="resumeInput" type="date" name="jncmpYmd" />
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">퇴사일</div>
										<div class="itemValue">
											<input class="resumeInput" type="date" name="rtrmYmd" />
										</div>
									</div>
									<div class="itemMenuBox btnBox">
										<div class="itemTitle">&nbsp;</div>
										<div class="itemValue">
											<button type="button" class="resumeBtn wrkAddBtn"><i class="bx bx-plus"></i></button>
										</div>
									</div>
								</form>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${resume.careerList }" var="career" varStatus="stat">
								<div class="itemInputBox">
									<form class="careerForm">
										<div class="itemMenuBox">
											<div class="itemTitle">고용형태</div>
											<div class="itemValue">
												<select class="resumeSelect" name="workType">
													<option value="">고용형태</option>
													<c:forEach items="${wrktypeList }" var="wrktype">
														<option value="${wrktype.commonCodeDetail }" <c:if test="${career.workType == wrktype.commonCodeDetail }">selected</c:if>>
															${wrktype.commonDetailName }
														</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="itemMenuBox">
											<div class="itemTitle">회사명</div>
											<div class="itemValue">
												<input class="resumeInput" type="text" name="companyName" placeholder="회사명" value="${career.companyName }"/>
											</div>
										</div>
										<div class="itemMenuBox">
											<div class="itemTitle">직무명</div>
											<div class="itemValue">
												<input class="resumeInput" type="text" name="jobName" placeholder="직무명" value="${career.jobName }"/>
											</div>
										</div>
										<div class="itemMenuBox">
											<div class="itemTitle">입사일</div>
											<div class="itemValue">
												<c:set value="${career.jncmpYmd }" var="jncmpYmd" />
												<fmt:parseDate value="${jncmpYmd }" var="parseJncmpYmd" pattern="yyyyMMdd"/>
												<input class="resumeInput" type="date" name="jncmpYmd" value='<fmt:formatDate value="${parseJncmpYmd }" pattern="yyyy-MM-dd"/>'/>
											</div>
										</div>
										<div class="itemMenuBox">
											<div class="itemTitle">퇴사일</div>
											<div class="itemValue">
												<c:set value="${career.rtrmYmd }" var="rtrmYmd" />
												<fmt:parseDate value="${rtrmYmd }" var="parseRtrmYmd" pattern="yyyyMMdd"/>
												<input class="resumeInput" type="date" name="rtrmYmd" value='<fmt:formatDate value="${parseRtrmYmd }" pattern="yyyy-MM-dd"/>'/>
											</div>
										</div>
										<div class="itemMenuBox btnBox">
											<div class="itemTitle">&nbsp;</div>
											<div class="itemValue">
												<button type="button" class="resumeBtn wrkAddBtn"><i class="bx bx-plus"></i></button>
											</div>
										</div>
									</form>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>		<!-- contentItem(경력사항) 끝 -->
				
				<hr class="resumeContour" />
				
				<div class="contentItem" id="certContent">		<!-- contentItem(자격증) -->
					<div class="contentHeader">
						<span class="contentTitle">자격증</span>
						<p class="contentTitleDesc"> * 만료일이 없는 자격, 면허의 경우 만료일자를 비워 두셔도 됩니다.</p>
					</div>
					<c:choose>
						<c:when test="${resume.certList[0].certNo == 0 or empty resume.certList}">
							<div class="itemInputBox">
								<form class="certificateForm">
									<div class="itemBigMenuBox">
										<div class="itemTitle">자격 / 면허 종류</div>
										<div class="itemValue">
											<input type="text" class="resumeInput" name="certType" placeholder="자격 / 면허 종류"/>
										</div>
									</div>
									<div class="itemBigMenuBox">
										<div class="itemTitle">발급기관</div>
										<div class="itemValue">
											<input type="text" class="resumeInput" name="certAgency" placeholder="발급기관"/>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">취득일자</div>
										<div class="itemValue">
											<input type="date" class="resumeInput" name="certAcqulreYmd"/>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">만료일자</div>
										<div class="itemValue">
											<input type="date" class="resumeInput" name="certExpiryYmd"/>
										</div>
									</div>
									<div class="itemMenuBox btnBox">
										<div class="itemTitle">&nbsp;</div>
										<div class="itemValue">
											<button type="button" class="resumeBtn certAddBtn"><i class="bx bx-plus"></i></button>
										</div>
									</div>
								</form>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${resume.certList }" var="cert" varStatus="stat">
								<div class="itemInputBox">
									<form class="certificateForm">
										<div class="itemBigMenuBox">
											<div class="itemTitle">자격 / 면허 종류</div>
											<div class="itemValue">
												<input type="text" class="resumeInput" name="certType" placeholder="자격 / 면허 종류" value="${cert.certType }"/>
											</div>
										</div>
										<div class="itemBigMenuBox">
											<div class="itemTitle">발급기관</div>
											<div class="itemValue">
												<input type="text" class="resumeInput" name="certAgency" placeholder="발급기관" value="${cert.certAgency }"/>
											</div>
										</div>
										<div class="itemMenuBox">
											<div class="itemTitle">취득일자</div>
											<div class="itemValue">
												<c:set value="${cert.certAcqulreYmd }" var="certAcqYmd"/>
												<fmt:parseDate value="${certAcqYmd }" pattern="yyyyMMdd" var="fmtAcqYmd"/>
												<input type="date" class="resumeInput" name="certAcqulreYmd" value='<fmt:formatDate value="${fmtAcqYmd }" pattern="yyyy-MM-dd"/>'/>
											</div>
										</div>
										<div class="itemMenuBox">
											<div class="itemTitle">만료일자</div>
											<div class="itemValue">
												<c:set value="${cert.certExpiryYmd }" var="certExpYmd"/>
												<fmt:parseDate value="${certExpYmd }" pattern="yyyyMMdd" var="fmtExpYmd"/>
												<input type="date" class="resumeInput" name="certExpiryYmd" value='<fmt:formatDate value="${fmtExpYmd }" pattern="yyyy-MM-dd"/>'/>
											</div>
										</div>
										<div class="itemMenuBox btnBox">
											<div class="itemTitle">&nbsp;</div>
											<div class="itemValue">
												<c:if test="${stat.index == 0 }">
													<button type="button" class="resumeBtn certAddBtn"><i class="bx bx-plus"></i></button>
												</c:if>
												<c:if test="${stat.index != 0 }">
													<button type="button" class="resumeBtn certDelBtn"><i class="bx bx-minus"></i></button>
												</c:if>
											</div>
										</div>
									</form>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>		<!-- contentItem(자격증) 끝 -->
				
				<hr class="resumeContour" />
			
				<div class="contentItem">		<!-- contentItem(병역사항) -->
					<div class="contentHeader">
						<span class="contentTitle">병역사항</span>
						<p class="contentTitleDesc"> * 병사 생활 후 간부로 재입대한 경우 최종 병역사항만 작성해주세요.</p>
					</div>
					<div class="itemInputBox">
						<form class="militaryServiceForm">
							<div class="itemBigMenuBox">
								<div class="itemTitle">병역사항</div>
								<div class="itemValue">
									<select class="resumeSelect milSelect" id="milSelect" name="militaryService">
										<option value="" selected>병역사항</option>
										<c:forEach items="${miltypeList }" var="miltype">
												<option value="${miltype.commonCodeDetail }" <c:if test="${resume.militaryService.militaryService == miltype.commonCodeDetail }">selected</c:if>>
													${miltype.commonDetailName }
												</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="itemMenuBox">
								<div class="itemTitle">입대일자</div>
								<c:if test="${resume.militaryService eq null }">
									<c:set var="milDisabled" value="disabled='disabled'" />
								</c:if>
								<c:if test="${resume.militaryService ne null }">
									<c:set var="milBgngYmd" value="${resume.militaryService.milBgngYmd }"/>
									<fmt:parseDate value="${milBgngYmd }" var="parseBgngYmd" pattern="yyyyMMdd"/>
									<c:set var="milEndYmd" value="${resume.militaryService.milEndYmd }"/>
									<fmt:parseDate value="${milEndYmd }" var="parseEndYmd" pattern="yyyyMMdd"/>
								</c:if>
								<div class="itemValue">
									<input class="resumeInput milInput" type="date" name="milBgngYmd" id="milBgngYmd" value='<fmt:formatDate value="${parseBgngYmd }" pattern="yyyy-MM-dd"/>' ${milDisabled }/>
								</div>
							</div>
							<div class="itemMenuBox">
								<div class="itemTitle">전역일자</div>
								<div class="itemValue">
									<input class="resumeInput milInput" type="date" name="milEndYmd" id="milEndYmd" value='<fmt:formatDate value="${parseEndYmd }" pattern="yyyy-MM-dd"/>'  ${milDisabled }/>
								</div>
							</div>
						</form>
					</div>
				</div>		<!-- contentItem(병역사항) 끝 -->
				
				<hr class="resumeContour" />
				
				<div class="contentItem">
					<div class="contentHeader">
						<span class="contentTitle">자기소개서</span>
						<p class="contentTitleDesc"> * 채용과 무관한 개인정보는 제외해주세요.</p>
						<p class="contentTitleDesc"> * 공개가 어려운 대외비 자료 등은 제외해주세요.</p>
						<p class="contentTitleDesc"> * 본인에 대해 자유롭게 표현하는 문구나 자랑할 만한 프로젝트 또는 업무 경험에 대해서 서술해주세요.</p>
					</div>
					
					<div class="itemInputBox">
						<div class="itemValue">
							<textarea class="contentTextarea" name="selfIntroduction">${resume.selfIntroduction }</textarea>
						</div>
						<div class="itemFooter">
							<p class="charCalc">
								<span class="charTitle"> 총 글자수 </span>
								<span id="charLength"> 0 </span> 자 / 
								<span id="charByte"> 0 </span> byte
							</p>
						</div>
					</div>
					
					<div class="contentHeader">
						<span class="contentTitle">첨부파일</span>
						<p class="contentTitleDesc"> * 본인의 경력, 장점을 나타낼 수 있는 자료가 있다면 자유롭게 첨부해주세요.</p>
						<p class="contentTitleDesc"> * 보훈대상의 경우 보훈 서류 또한 첨부 바랍니다.</p>
						<p class="contentTitleDesc"> * 첨부파일은 임시 저장되지 않습니다. 이력서를 등록할 때 첨부 바랍니다.</p>
					</div>
					<div class="itemInputBox" style="background : none;">
						<input type="file" class="form-control border mx-3 mt-3" name="resumeFiles" id="resumeFiles" multiple="multiple"/>
					</div>
					
					<hr class="my-5" />

					<div class="itemInputBox">
						<div class="itemMenuBox itemCheckBox">
							<div class="itemTitle">보훈대상</div>
							<div class="itemValue">
								<div class="itemCheck">
									<input type="radio" class="form-check-input resumeCheck" name="pronunciationYn" value="N" <c:if test="${resume.pronunciationYn != 'Y' }">checked</c:if>/>
									<label class="form-check-label">해당없음</label>
								</div>
								<div class="itemCheck">
									<input type="radio" class="form-check-input resumeCheck" name="pronunciationYn" value="Y" <c:if test="${resume.pronunciationYn == 'Y' }">checked</c:if>/>
									<label class="form-check-label">해당</label>
								</div>
							</div>
						</div>
						<div class="itemMenuBox itemCheckBox">
							<div class="itemTitle">이력서 공개여부</div>
							<div class="itemValue">
								<div class="itemCheck">
									<input type="radio" class="form-check-input resumeCheck" name="rsmRlsYn" value="N" <c:if test="${resume.rsmRlsYn != 'Y' }">checked</c:if>/>
									<label class="form-check-label" for="rsmRlsYn">비공개</label>
								</div>
								<div class="itemCheck">
									<input type="radio" class="form-check-input resumeCheck" name="rsmRlsYn" value="Y" <c:if test="${resume.rsmRlsYn == 'Y' }">checked</c:if>/>
									<label class="form-check-label" for="rsmRlsYn">공개</label>
								</div>
							</div>
						</div>
					</div>
				</div>		<!-- contentItem(자기소개, 첨부파일, 체크박스) 끝 -->
			</div>		<!-- resumeContent 끝 -->
			
			<hr class="my-3" />
			
			<div class="resumeFooter">
				<input type="hidden" name="rsmNo" id="rsmNo" value="${resume.rsmNo }" />
				<c:if test="${trigger eq 'Y' }">
					<button type="button" class="resumeFooterBtn linkBtn" id="rsmBackBtn">돌아가기</button>
				</c:if>
				<c:if test="${trigger ne 'Y' }">
					<button type="button" class="resumeFooterBtn linkBtn" id="saveTempBtn">임시 저장</button>
				</c:if>
				<button type="button" class="resumeFooterBtn linkBtn" id="deleteBtn">이력서 삭제</button>
				<c:if test="${trigger eq 'Y' }">
					<button type="button" class="resumeFooterBtn submitBtn" id="updateBtn">이력서 수정</button>
				</c:if>
				<c:if test="${trigger ne 'Y' }">
					<button type="button" class="resumeFooterBtn submitBtn" id="submitBtn">이력서 등록</button>
				</c:if>
			</div>		<!-- resumeFooter 끝 -->
		</div>		<!-- resumeContainer 끝 -->
	</div>	<!-- container 끝 -->
	
	<script type="text/javascript">
		$(function(){
			/******************
			 *	학력사항 JS
			 ******************/
			//	학력 추가 버튼 클릭 이벤트
			$('.eduAddBtn').on('click', function(){
				var count = $('#eduContent').find('.itemInputBox').length;
				
				if(count < 5){		//	최대 5개 입력
					//	클론 생성
					var clone = $('#eduContent').find('.itemInputBox').eq(0).clone();
					
					//	클론 값 초기화
					clone.find("input").val("");
					clone.find("select").val("");
					
					//	타이틀 제거
					clone.find(".itemTitle").remove();
					
					//	클론 추가
					clone.appendTo('#eduContent');
					
					//	클론에 있는 추가 버튼을 삭제 버튼으로 변경
					$('.eduAddBtn').last().addClass('eduDelBtn');
					$('.eduAddBtn').last().html("<i class='bx bx-minus'></i>");
					$('.eduAddBtn').last().removeClass('eduAddBtn');
				} else {
					alert("더 이상 추가하실 수 없습니다.");
				}
			});		//	.eduBtn onClick 이벤트 종료
			
			
			//	학력 삭제 버튼 클릭 이벤트
			$(document).on('click', '.eduDelBtn', function(){
				$(this).parents('.itemInputBox').remove();
			});		//	eduDelBtn onClick 이벤트 종료

			
			//	학력 구분 변경시 이벤트
			$(document).on('change', '.schSelect', function(){
				var school = $(this).val();								//	학력 구분 값
				var location = $(this).parents('.itemInputBox');		//	select를 감싸고 있는 컨테이너 위치
				
				//	학력 구분 값이 변경되면 기존의 값들은 초기화
				location.find('.eduColumn').val("");
				
				if(school == "" || school == "SCHTYPE001"){
					if(school == "") {
						location.find('.eduColumn').attr('disabled', true);
					} else {
						location.find('.eduColumn').attr('disabled', true);
						location.find('.highSch').attr('disabled', false);
					}
				} else {
					location.find('.eduColumn').attr('disabled', false);
				}
				
			});		//	학력 구분 onChange 이벤트 종료
			
			
			//	졸업 구분 변경시 이벤트
			$(document).on('change', '.grdSelect', function(){
				var grd = $(this).val();								//	졸업 여부 구분 값
				var location = $(this).parents('.itemInputBox');		//	select를 감싸고 있는 컨테이너 위치
				
				if(grd == "GRDTYPE002" || grd == "GRDTYPE003") {		//	휴학 중이거나 재학 중인 경우
					location.find('input[name=graduateYmd]').attr('disabled', true);
				} else {
					location.find('input[name=graduateYmd]').attr('disabled', false);
				}
			});		//	졸업 구분 onChange 이벤트 종료

			
			/******************
			 *	경력사항 JS
			 ******************/
			//	경력 추가 버튼 클릭 이벤트
			$('.wrkAddBtn').on('click', function(){
				var count = $('#wrkContent').find('.itemInputBox').length;
				
				if(count < 5){		//	최대 5개 입력
					//	클론 생성
					var clone = $('#wrkContent').find('.itemInputBox').eq(0).clone();
						
					//	클론 값 초기화
					clone.find("input").val("");
					clone.find("select").val("");
					
					//	타이틀 제거
					clone.find(".itemTitle").remove();
					
					//	추가
					clone.appendTo('#wrkContent');
					
					$('.wrkAddBtn').last().addClass('wrkDelBtn');
					$('.wrkAddBtn').last().html("<i class='bx bx-minus'></i>");
					$('.wrkAddBtn').last().removeClass('wrkAddBtn');
				} else {
					alert("더 이상 추가하실 수 없습니다.");
				}
			});		//	wrkAddBtn onClick 이벤트 종료

			//	경력 삭제 버튼 클릭 이벤트
			$(document).on('click', '.wrkDelBtn', function(){
				$(this).parents('.itemInputBox').remove();
			});		//	wrkDelBtn onClick 이벤트 종료

			
			/******************
			 *	자격증 JS
			 ******************/
			//	자격증 추가 버튼 클릭 이벤트
			$('.certAddBtn').on('click', function(){
				var count = $('#certContent').find('.itemInputBox').length;
				
				if(count < 5){		//	최대 5개 입력
					//	클론 생성
					var clone = $('#certContent').find('.itemInputBox').eq(0).clone();
					
					//	클론 값 초기화
					clone.find("input").val("");
					clone.find("select").val("");
					
					//	타이틀 제거
					clone.find(".itemTitle").remove();
					
					//	추가
					clone.appendTo('#certContent');
					
					$('.certAddBtn').last().addClass('certDelBtn');
					$('.certAddBtn').last().html("<i class='bx bx-minus'></i>");
					$('.certAddBtn').last().removeClass('certAddBtn');
				} else {
					alert("더 이상 추가하실 수 없습니다.");
				}
			});		//	.certAddBtn onClick 이벤트 종료
			
			
			//	자격증 삭제 버튼 클릭 이벤트
			$(document).on('click', '.certDelBtn', function(){
				$(this).parents('.itemInputBox').remove();
			});		//	certDelBtn onClick 이벤트 종료
			
			
			/******************
			 *	병역사항 JS
			 ******************/
			//	병역사항 정보 변경 이벤트
			$('#milSelect').on('change', function(){
				var military = $(this).val();
				
				//	병역 사항이 '해당 없음', '미필', '면제' 인 경우 입대일자, 전역일자가 필요없다.
				if((military == 'MILTYPE008') || (military == 'MILTYPE007') ||  (military == 'MILTYPE006') || (military == "")){
					$('#milBgngYmd').attr('disabled', true);
					$('#milEndYmd').attr('disabled', true);
				} else {
					$('#milBgngYmd').attr('disabled', false);
					$('#milEndYmd').attr('disabled', false);
				}
			});
			
			
			/******************
			 *	자기소개 JS
			 ******************/
			//	자기소개서에 글자 입력시 글자 수, 바이트 계산 이벤트
			$('.contentTextarea').on('keyup', function(){
				var str = $(this).val();			//	textarea 에 입력한 값
				var strLength = str.length;			//	글자 길이(글자 수)	
				var strByte = 0;					//	byte 를 담을 변수 선언
				
				//	바이트 계산
				for(var i = 0; i < str.length; i++){
					var currentByte = str.charCodeAt(i);
					if(currentByte > 128){
						strByte += 3;
					} else {
						strByte++;
					}
				}
				
				//	계산 완료된 값 출력
				$('#charLength').html(strLength);
				$('#charByte').html(strByte);
			});
			
			
			/******************
			 *	이미지 등록 JS
			 ******************/
			var imgFile = $('#imgFile');			//	이력서 증명사진 입력 Input
			var profileImg = $('#profileImg');		//	이력서 이미지 태그
			var changeImg = false;					//	이력서 이미지를 변경한 경우
			
			//	프로필 사진 선택 이벤트(이미지 파일을 선택하여 등록, 변경 시 이벤트 발생)
			imgFile.on('change', function(event){
				var file = event.target.files[0];		//	내가 선택한 파일
				
				//	이미지 파일인지 검사
				if(isImageFile(file)){
					var reader = new FileReader();
					reader.onload = function(e){
						//	썸네일 이미지 태그에 src 경로로 result를 세팅
						//	이미지 파일의 데이터를 base64 인코딩 형태로 변형된 데이터로 src 경로에 설정
						profileImg.attr('src', e.target.result);
					}
					
					reader.readAsDataURL(file);
					changeImg = true;
				} else {
					alert("파일의 형식이 맞지 않습니다.")
					imgFile.val("");
					changeImg = false;
				}
			});		//	imgFile onChange 이벤트 종료
			 
			 
			/******************
			 *	하단부 버튼 JS
			 ******************/
			//	임시저장 버튼 클릭 이벤트
			$('#saveTempBtn').on('click', function(){

				var resumeData = createData();

				//	임시저장 비동기로 진행
				$.ajax({
					url : "/jobel/tempSave",
					type : "post",
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					data : JSON.stringify(resumeData),
					dataType : 'text',
					contentType: 'application/json; charset=utf-8',
					success : function(res){
						if(res == "SUCCESS"){
							alert("저장이 완료되었습니다.");
						}
					},
					error : function(xhr){
						alert("에러가 발생했습니다. 잠시 후, 다시 시도해주세요.");
						console.log("에러 코드 : " + xhr.status);
					}
				});		//	$.ajax() 종료

			});		//	saveTempBtn onClick 종료
			
			
			//	이력서 삭제 버튼 클릭 이벤트
			$('#deleteBtn').on('click', function(){
				if(confirm("정말로 삭제하시겠습니까? 작성 중인 내용이 모두 사라집니다.")){
					var rsmNo = $('#rsmNo').val();
					
					$.ajax({
						url : "/jobel/resumeDelete",
						type : "post",
						beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
							xhr.setRequestHeader(header, token);
						},
						data : {
							rsmNo : rsmNo
						},
						success : function(res){
							if(res == "SUCCESS"){
								alert("삭제가 완료되었습니다.");
								var referrer = document.referrer;
								location.href = referrer;
							}
						},
						error : function(xhr){
							console.log("에러 코드 : " + xhr.status);
						}
					});		//	$.ajax() 종료
				}		//	if(confirm()) 종료
			});		//	deleteBtn onClick 이벤트 종료
			
			
			//	이력서 등록 버튼 클릭 이벤트
			$('#submitBtn').on('click', function(){
				var resumeData = createData();
				
				//	저장할 정보를 담을 formData()
				var formData = createFormData(resumeData);
				
				//	이력서 등록하기 위한 ajax() 호출
				$.ajax({
					url : "/jobel/resumeSave",
					type : "post",
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					data : formData,
					contentType : false,
					processData: false,
					success : function(res){
						if(res == "SUCCESS"){
							alert("작성이 완료되었습니다.");
							location.href = "/jobel/myPage?menu=viewResume";
						}
					},
					error : function(xhr){
						console.log("에러 코드 : " + xhr.status);
					}
				});		//	$.ajax() 종료
			});		//	submitBtn onClick 이벤트 종료
			
			
			//	이력서 수정 버튼 클릭 이벤트
			$('#updateBtn').on('click', function(){
				var rsmNo = $('#rsmNo').val();
				var resumeData = createData();
				//	저장할 정보를 담을 formData()
				var formData = createFormData(resumeData);
				
				$.ajax({
					url : "/jobel/resumeUpdate",
					type : "post",
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					data : formData,
					contentType : false,
					processData: false,
					success : function(res){
						if(res == "SUCCESS"){
							alert("수정이 완료되었습니다.");
							location.href = "/jobel/resumeInfo?rsmNo=" + rsmNo;
						}
					},
					error : function(xhr){
						console.log("에러 코드 : " + xhr.status);
					}
				});		//	$.ajax() 종료
			});		//	updateBtn onClick 이벤트 종료
			
			//	수정 중 돌아가기 버튼 클릭 이벤트
			$('#rsmBackBtn').on('click', function(){
				var rsmNo = $('#rsmNo').val();
				var backUrl = "/jobel/resumeInfo?rsmNo=" + rsmNo; 
				location.href = backUrl;
			});		//	rsmBackBtn onClick 이벤트 종료
			
			//	이력서 정보를 JSON화하여 담아주는 함수
			function createData(){
				//	이력서 정보를 담을 JSON 객체
				var resumeData = {};
				
				//	이력서 번호
				var rsmNo = $('#rsmNo').val();
				resumeData["rsmNo"] = rsmNo;
				
				//	이력서 제목
				var rsmTitle = $('input[name=rsmTitle]').val();
				if(rsmTitle != null && rsmTitle != ""){
					resumeData["rsmTitle"] = rsmTitle;
				}
				
				//	이력서 프로필 사진
				var rsmPhotoPath = $('input[name=rsmPhotoPath]').val();
				if(rsmPhotoPath != null && rsmPhotoPath != ""){
					resumeData["rsmPhotoPath"] = rsmPhotoPath;
				}
				
				//	보훈대상
				var pronunciationYn = $('input[name=pronunciationYn]').val();
				resumeData["pronunciationYn"] = pronunciationYn;
				
				//	자기소개서
				var selfIntroduction = $('textarea[name=selfIntroduction]').val();
				if(selfIntroduction != null && selfIntroduction != ""){
					resumeData["selfIntroduction"] = selfIntroduction;
				}
				
				//	이력서 공개 여부
				var rsmRlsYn = $('input[name=rsmRlsYn]').val();
				resumeData["rsmRlsYn"] = rsmRlsYn;
				
				//	학력사항
				var educations = $('.educationForm');
				var educationList = [];
				$.each(educations, function(i, v){
					var eduData = $(v).serializeObject();
					var keyword = Object.keys(eduData)[0];
					
					if(eduData[keyword] != null && eduData[keyword] != ""){
						educationList.push(eduData);
					}
				});
				if(educationList.length > 0){
					resumeData["educationList"] = educationList;
				}
				
				//	경력사항
				var careers = $(".careerForm");
				var careerList = [];
				$.each(careers, function(i, v){
					var crrData = $(v).serializeObject();
					var keyword = Object.keys(crrData)[0];
					
					if(crrData[keyword] != null && crrData[keyword] != ""){
						careerList.push(crrData);
					}
				});
				if(careerList.length > 0){
					resumeData["careerList"] = careerList;
				}
				
				//	자격증
				var certs = $('.certificateForm');
				var certList = [];
				$.each(certs, function(i, v){
					var certData = $(v).serializeObject();
					var keyword = Object.keys(certData)[0];
					
					if(certData[keyword] != null && certData[keyword] != ""){
						certList.push(certData);
					}
				});
				if(certList.length > 0){
					resumeData["certList"] = certList;
				}
				
				//	병역사항
				var militaryService = $('.militaryServiceForm').serializeObject();
				var keyword = Object.keys(militaryService)[0];
				
				if(militaryService[keyword] != null && militaryService[keyword] != ""){
					resumeData["militaryService"] = militaryService;
				}
				
				return resumeData;
			}		//	function createData() 종료
			
			//	이력서 정보를 formData에 담아서 반환하는 함수
			function createFormData(resumeData){
				//	저장할 정보를 담을 formData()
				var formData = new FormData();
				
				formData.append("rsmNo", resumeData["rsmNo"]);								//	이력서 번호
				formData.append("rsmTitle", resumeData["rsmTitle"]);						//	이력서 제목
				formData.append("pronunciationYn", resumeData["pronunciationYn"]);			//	보훈대상 여부
				formData.append("rsmRlsYn", resumeData["rsmRlsYn"]);						//	이력서 공개 여부
				
				if(resumeData["selfIntroduction"] != null){		//	자기소개 문구를 작성했을 때
					formData.append("selfIntroduction", resumeData["selfIntroduction"]);
				}
				
				if(resumeData["educationList"] != null){		//	학력사항을 기재했을 때
					var educationList = resumeData["educationList"];
					for(var i = 0; i < educationList.length; i++){
						var keys = Object.keys(educationList[i]);
						for(var j = 0; j < keys.length; j++){
							var key = keys[j];
							var value = educationList[i][keys[j]];
							formData.append("educationList[" + i + "]." + key, value);
						}
					}
				}
				
				if(resumeData["careerList"] != null){		//	경력사항을 기재했을 때
					var careerList = resumeData["careerList"];
					for(var i = 0; i < careerList.length; i++){
						var keys = Object.keys(careerList[i]);
						for(var j = 0; j < keys.length; j++){
							var key = keys[j];
							var value = careerList[i][keys[j]];
							formData.append("careerList[" + i + "]." + key, value);
						}
					}
				}
				
				if(resumeData["certList"] != null){		//	자격증을 기재했을 때
					var certList = resumeData["certList"];
					for(var i = 0; i < certList.length; i++){
						var keys = Object.keys(certList[i]);
						for(var j = 0; j < keys.length; j++){
							var key = keys[j];
							var value = certList[i][keys[j]];
							formData.append("certList[" + i + "]." + key, value);
						}
					}
				}
				
				if(resumeData["militaryService"] != null){		//	병역사항을 기재했을 때
					var militaryService = resumeData["militaryService"];
					var keys = Object.keys(militaryService);
					for(var i = 0; i < keys.length; i++){
						var key = keys[i];
						var value = militaryService[keys[i]]
						formData.append("militaryService." + key, value);			//	병역사항
					}
				}
				
				//	프로필 사진을 변경했거나 기존의 사진 이미지가 존재할 경우
				if(changeImg ||	($('#rsmPhotoPath') != "" && $('#rsmPhotoPath') != null)){
					if(changeImg){		//	이미지를 변경한 경우
						formData.append("imgFile", $('#imgFile')[0].files[0]);
					}
					if(!changeImg){		//	이미지 변경 안 했으나 프로필 사진 경로가 존재할 경우
						formData.append("rsmPhotoPath", $('#rsmPhotoPath').val());
					}
				}
				
				var fileCheck = $('#resumeFiles').val();		//	첨부파일 존재 유무 확인
				if(fileCheck){		//	첨부파일이 존재한다면
					for(var i = 0; i < $('#resumeFiles')[0].files.length; i++){
						formData.append("resumeFiles", $('#resumeFiles')[0].files[i]);
					}
				}
				
				return formData;
			}		//	function createFormData() 종료
			
			//	데이터 입력 버튼 클릭 이벤트
			$('#explainBtn').on('click', function(){
				var nm = '${member.name }';
				//	이력서 제목
				$('input[name=rsmTitle]').val("누구보다 빛나고 누구보다 적극적인 " + nm + "입니다!");
				
				//	학력사항
				$('#eduDivision option:eq(1)').attr("selected", "selected");	//	학력 구분(고등학교)
				$('#eduDivision').parents('.itemInputBox').find('.eduColumn').attr('disabled', true);
				$('#eduDivision').parents('.itemInputBox').find('.highSch').attr('disabled', false);
				
				$('#eduLocation option:eq(7)').attr("selected", "selected");	//	학교 소재(대전)
				$('#schoolName').val("대전고등학교");				//	학교명
				$('input[name=enterYmd]').val("2009-03-06");		//	입학일자
				$('input[name=graduateYmd]').val("2012-02-10");		//	졸업일자
				
				//	경력사항
				$('select[name=workType] option:eq(1)').attr("selected", "selected");	//	고용 형태(정규직)
				$('input[name=companyName]').val("고려제빵");		//	회사명
				$('input[name=jobName]').val("제빵사");				//	직무명
				$('input[name=jncmpYmd]').val("2012-05-10");		//	입사일
				$('input[name=rtrmYmd]').val("2014-06-12");			//	퇴사일
				
				//	자격증
				$('input[name=certType]').val("자동차 운전면허증(2종 보통)");
				$('input[name=certAgency]').val("대전지방경찰청");
				$('input[name=certAcqulreYmd]').val("2016-02-04");
				
				//	병역사항
				$('#milSelect option:eq(1)').attr("selected", "selected");		//	병역구분(현역[병사])
				$('#milBgngYmd').val("2014-07-01");			//	입대일
				$('#milEndYmd').val("2015-12-18");			//	전역일
				
				//	자기소개서
				var introText = "어떤 일이든 최선을 다할 수 있습니다. 열정 그 자체인 저를 보여드리겠습니다.";
				$('textarea[name=selfIntroduction]').text(introText);
			});
		});		//	$(function())	종료
		
		
		//	이미지 파일인지 체크
		function isImageFile(file){
			//	파일명에서 확장자 추출
			var ext = file.name.split(".").pop().toLowerCase();
			
			//	반환값으로 true 또는 false를 반환한다.
			return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
		}
		
	</script>
	