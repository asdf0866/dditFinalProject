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
				<span class="titleText">이력서</span>
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
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath }/resources/images/default/default_profile.png" id="profileImg">
							</c:otherwise>
						</c:choose>
					</label>
				</div>
			</div>		<!-- resumeTitle 끝 -->
			
			<hr class="resumeContour mb-3" />
			
			<div class="resumeContent">
				<div class="contentItem d-flex align-items-center">
					<label class="form-label col-2 text-center d-block contentTitle m-0" for="rsmTitle">이력서 제목 : </label>
					<p>${resume.rsmTitle }</p>
				</div>
	
				<hr class="resumeContour" />
				
				<div class="contentItem" id="eduContent">		<!-- contentItem(학력사항) -->
					<div class="contentHeader">
						<span class="contentTitle">학력사항</span>
					</div>
					<c:choose>
						<c:when test="${resume.educationList[0].eduNo == 0 or empty resume.educationList}">
							<div class="itemInputBox">
								<form class="educationForm" method="post" enctype="multipart/form-data">
									<div class="itemMenuBox">
										<div class="itemTitle">학력 구분</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">학교 소재</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">학교명</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<div class="itemTitle">졸업여부</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<div class="itemTitle">전공</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<div class="itemTitle">부전공</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<div class="itemTitle">기준학점</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<div class="itemTitle">평점</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">입학일자</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">졸업일자</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox btnBox">
										<div class="itemTitle">&nbsp;</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
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
											<p class="itemValueText">
											<c:forEach items="${schtypeList }" var="schtype">
												<c:if test="${education.eduDivision == schtype.commonCodeDetail}">
													${schtype.commonDetailName }
												</c:if>
											</c:forEach>
											</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">학교 소재</div>
										</c:if>
										<div class="itemValue">
											<p class="itemValueText">
											<c:forEach items="${regtypeList}" var="regtype">
												<c:if test="${education.eduLocation == regtype.commonCodeDetail }">
													${regtype.commonDetailName }
												</c:if>
											</c:forEach>
											</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">학교명</div>
										</c:if>
										<div class="itemValue">
											<p class="itemValueText">${education.schoolName }</p>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">졸업여부</div>
										</c:if>
										<div class="itemValue">
											<p class="itemValueText">
												<c:if test="${education.gradeType ne null and education.gradeType ne ''}">
													<c:forEach items="${grdtypeList }" var="grdtype">
														<c:if test="${education.gradeType == grdtype.commonCodeDetail}">
															${grdtype.commonDetailName }
														</c:if>
													</c:forEach>
												</c:if>
												<c:if test="${(education.gradeType eq null) or (education.gradeType eq '') }">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
											</p>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">전공</div>
										</c:if>
										<div class="itemValue">
											<p class="itemValueText">
												<c:if test="${education.major ne null and education.major ne ''}">
													${education.major }
												</c:if>
												<c:if test="${(education.major eq null) or (education.major eq '') }">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
											</p>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">부전공</div>
										</c:if>
										<div class="itemValue">
											<p class="itemValueText">
												<c:if test="${education.subMajor ne null and education.subMajor ne ''}">
													${education.subMajor }
												</c:if>
												<c:if test="${(education.subMajor eq null) or (education.subMajor eq '') }">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
											</p>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">기준학점</div>
										</c:if>
										<div class="itemValue">
											<p class="itemValueText">
												<c:if test="${education.gradeBasis ne null and education.gradeBasis ne ''}">
													<c:forEach items="${grdbaseList }" var="grdbase">
														<c:if test="${education.gradeBasis == grdbase.commonCodeDetail}">
															${grdbase.commonDetailName }
														</c:if>
													</c:forEach>
												</c:if>
												<c:if test="${(education.gradeBasis eq null) or (education.gradeBasis eq '') }">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
											</p>
										</div>
									</div>
									<div class="itemMenuBox universityBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">평점</div>
										</c:if>
										<div class="itemValue">
											<p class="itemValueText">
												<c:if test="${education.gradeAvg ne 0}">
													${education.gradeAvg }
												</c:if>
												<c:if test="${(education.gradeAvg eq null) or (education.gradeAvg eq 0) }">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
											</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">입학일자</div>
										</c:if>
										<div class="itemValue">
											<p class="itemValueText">
												<c:if test="${education.enterYmd ne null and education.enterYmd ne ''}">
													<c:set var="enterYmd" value="${education.enterYmd }" />
													<fmt:parseDate value="${enterYmd }" var="parseEnterYmd" pattern="yyyyMMdd"/>
													<fmt:formatDate value="${parseEnterYmd }" pattern="yyyy-MM-dd"/>
												</c:if>
												<c:if test="${education.enterYmd eq null or education.enterYmd eq ''}">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
											</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">졸업일자</div>
										</c:if>
										<div class="itemValue">
											<p class="itemValueText">
												<c:if test="${education.graduateYmd ne null and education.graduateYmd ne ''}">
													<c:set var="graduateYmd" value="${education.graduateYmd }" />
													<fmt:parseDate value="${graduateYmd }" var="parseGraduateYmd" pattern="yyyyMMdd"/>
													<fmt:formatDate value="${parseGraduateYmd }" pattern="yyyy-MM-dd"/>
												</c:if>
												<c:if test="${education.graduateYmd eq null or education.graduateYmd eq ''}">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</c:if>
											</p>
										</div>
									</div>
									<div class="itemMenuBox btnBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">&nbsp;</div>
										</c:if>
										<div class="itemValue">
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
					</div>
					<c:choose>
						<c:when test="${resume.careerList[0].careerNo == 0 or empty resume.careerList}">
							<div class="itemInputBox">
								<form class="careerForm">
									<div class="itemMenuBox">
										<div class="itemTitle">고용형태</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">회사명</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">직무명</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">입사일</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">퇴사일</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox btnBox">
										<div class="itemTitle">&nbsp;</div>
										<div class="itemValue">
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
											<c:if test="${stat.index == 0 }">
												<div class="itemTitle">고용형태</div>
											</c:if>
											<div class="itemValue">
												<p class="itemValueText">
													<c:forEach items="${wrktypeList }" var="wrktype">
														<c:if test="${career.workType == wrktype.commonCodeDetail }">
															${wrktype.commonDetailName }
														</c:if>
													</c:forEach>
												</p>
											</div>
										</div>
										<div class="itemMenuBox">
											<c:if test="${stat.index == 0 }">
												<div class="itemTitle">회사명</div>
											</c:if>
											<div class="itemValue">
												<p class="itemValueText">${career.companyName }</p>
											</div>
										</div>
										<div class="itemMenuBox">
											<c:if test="${stat.index == 0 }">
												<div class="itemTitle">직무명</div>
											</c:if>
											<div class="itemValue">
												<p class="itemValueText">${career.jobName }</p>
											</div>
										</div>
										<div class="itemMenuBox">
											<c:if test="${stat.index == 0 }">
												<div class="itemTitle">입사일</div>
											</c:if>
											<div class="itemValue">
												<p class="itemValueText">
													<c:if test="${career.jncmpYmd ne null and career.jncmpYmd ne ''}">
														<c:set value="${career.jncmpYmd }" var="jncmpYmd" />
														<fmt:parseDate value="${jncmpYmd }" var="parseJncmpYmd" pattern="yyyyMMdd"/>
														<fmt:formatDate value="${parseJncmpYmd }" pattern="yyyy-MM-dd"/>
													</c:if>
													<c:if test="${career.jncmpYmd eq null or career.jncmpYmd eq ''}">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</c:if>
												</p>
											</div>
										</div>
										<div class="itemMenuBox">
											<c:if test="${stat.index == 0 }">
												<div class="itemTitle">퇴사일</div>
											</c:if>
											<div class="itemValue">
												<p class="itemValueText">
													<c:if test="${career.rtrmYmd ne null and career.rtrmYmd ne ''}">
														<c:set value="${career.rtrmYmd }" var="rtrmYmd" />
														<fmt:parseDate value="${rtrmYmd }" var="parseRtrmYmd" pattern="yyyyMMdd"/>
														<fmt:formatDate value="${parseRtrmYmd }" pattern="yyyy-MM-dd"/>
													</c:if>
													<c:if test="${career.rtrmYmd eq null or career.rtrmYmd eq ''}">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</c:if>
												</p>
											</div>
										</div>
										<div class="itemMenuBox btnBox">
											<div class="itemTitle">&nbsp;</div>
											<div class="itemValue">
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
					</div>
					<c:choose>
						<c:when test="${resume.certList[0].certNo == 0 or empty resume.certList}">
							<div class="itemInputBox">
								<form class="certificateForm">
									<div class="itemBigMenuBox">
										<div class="itemTitle">자격 / 면허 종류</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemBigMenuBox">
										<div class="itemTitle">발급기관</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">취득일자</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox">
										<div class="itemTitle">만료일자</div>
										<div class="itemValue">
											<p class="itemValueText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
										</div>
									</div>
									<div class="itemMenuBox btnBox">
										<c:if test="${stat.index == 0 }">
											<div class="itemTitle">&nbsp;</div>
										</c:if>
										<div class="itemValue">
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
											<c:if test="${stat.index == 0 }">
												<div class="itemTitle">자격 / 면허 종류</div>
											</c:if>
											<div class="itemValue">
												<p class="itemValueText">${cert.certType }</p>
											</div>
										</div>
										<div class="itemBigMenuBox">
											<c:if test="${stat.index == 0 }">
												<div class="itemTitle">발급기관</div>
											</c:if>
											<div class="itemValue">
												<p class="itemValueText">${cert.certAgency }</p>
											</div>
										</div>
										<div class="itemMenuBox">
											<c:if test="${stat.index == 0 }">
												<div class="itemTitle">취득일자</div>
											</c:if>
											<div class="itemValue">
												<p class="itemValueText">
													<c:if test="${cert.certAcqulreYmd ne null and cert.certAcqulreYmd ne ''}">
														<c:set value="${cert.certAcqulreYmd }" var="certAcqYmd"/>
														<fmt:parseDate value="${certAcqYmd }" pattern="yyyyMMdd" var="fmtAcqYmd"/>
														<fmt:formatDate value="${fmtAcqYmd }" pattern="yyyy-MM-dd"/>
													</c:if>
													<c:if test="${cert.certAcqulreYmd eq null or cert.certAcqulreYmd eq ''}">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</c:if>
												</p>
											</div>
										</div>
										<div class="itemMenuBox">
											<c:if test="${stat.index == 0 }">
												<div class="itemTitle">만료일자</div>
											</c:if>
											<div class="itemValue">
												<p class="itemValueText">
													<c:if test="${cert.certExpiryYmd ne null and cert.certExpiryYmd ne ''}">
														<c:set value="${cert.certExpiryYmd }" var="certExpYmd"/>
														<fmt:parseDate value="${certExpYmd }" pattern="yyyyMMdd" var="fmtExpYmd"/>
														<fmt:formatDate value="${fmtExpYmd }" pattern="yyyy-MM-dd"/>
													</c:if>
													<c:if test="${cert.certExpiryYmd eq null or cert.certExpiryYmd eq ''}">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													</c:if>
												</p>
											</div>
										</div>
										<div class="itemMenuBox btnBox">
											<c:if test="${stat.index == 0 }">
												<div class="itemTitle">&nbsp;</div>
											</c:if>
											<div class="itemValue">
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
					</div>
					<div class="itemInputBox">
						<form class="militaryServiceForm">
							<div class="itemBigMenuBox">
								<div class="itemTitle">병역사항</div>
								<div class="itemValue">
									<p class="itemValueText">
										<c:forEach items="${miltypeList }" var="miltype">
											<c:if test="${resume.militaryService.militaryService == miltype.commonCodeDetail }">
												${miltype.commonDetailName }
											</c:if>
										</c:forEach>
									</p>
								</div>
							</div>
							<div class="itemMenuBox">
								<div class="itemTitle">입대일자</div>
								<div class="itemValue">
									<p class="itemValueText">
										<c:if test="${resume.militaryService ne null }">
											<c:set var="milBgngYmd" value="${resume.militaryService.milBgngYmd }"/>
											<fmt:parseDate value="${milBgngYmd }" var="parseBgngYmd" pattern="yyyyMMdd"/>
											<fmt:formatDate value="${parseBgngYmd }" pattern="yyyy-MM-dd"/>
										</c:if>
										<c:if test="${resume.militaryService eq null }">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</c:if>
									</p>
								</div>
							</div>
							<div class="itemMenuBox">
								<div class="itemTitle">전역일자</div>
								<div class="itemValue">
									<p class="itemValueText">
										<c:if test="${resume.militaryService ne null }">
											<c:set var="milEndYmd" value="${resume.militaryService.milEndYmd }"/>
											<fmt:parseDate value="${milEndYmd }" var="parseEndYmd" pattern="yyyyMMdd"/>
											<fmt:formatDate value="${parseEndYmd }" pattern="yyyy-MM-dd"/>
										</c:if>
										<c:if test="${resume.militaryService eq null }">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										</c:if>
									</p>
								</div>
							</div>
						</form>
					</div>
				</div>		<!-- contentItem(병역사항) 끝 -->
				
				<hr class="resumeContour" />
				
				<div class="contentItem">
					<div class="contentHeader">
						<span class="contentTitle">자기소개서</span>
					</div>
					
					<div class="itemInputBox">
						<div class="itemValue">
							<textarea class="contentTextarea" name="selfIntroduction" readonly="readonly">${resume.selfIntroduction }</textarea>
						</div>
						<div class="itemFooter">
						</div>
					</div>
					
					<div class="contentHeader">
						<span class="contentTitle">첨부파일</span>
					</div>
					<c:choose>
						<c:when test="${empty fileList or fileList == null}">
							<div class="itemInputBox">
								<div class="itemTitle">등록된 첨부파일이 없습니다.</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="itemInputBox" style="background : none;">
								<div class="itemValue row justify-content-start bg-secondary-subtle">
									<c:forEach items="${fileList }" var="file">
										<div class="border col-3 bg-light">
											<a href="/jobel/download?fileId=${file.fileId }&fileSerialNo=${file.fileSerialNo }" style="text-decoration: none;">
												<i class="bi bi-file-earmark-arrow-down fs-5 fw-bold"></i>
												<span style="color:black; text-decoration: none;">${file.fileOriginName }</span>
											</a>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
					
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
				<button type="button" class="resumeFooterBtn linkBtn" id="updateBtn">이력서 수정</button>
				<button type="button" class="resumeFooterBtn linkBtn" id="deleteBtn">이력서 삭제</button>
				<button type="button" class="resumeFooterBtn submitBtn" id="backListBtn">이력서 목록</button>
			</div>		<!-- resumeFooter 끝 -->
		</div>		<!-- resumeContainer 끝 -->
	</div>	<!-- container 끝 -->
	
	<script type="text/javascript">
		$(function(){
			var backListBtn = $('#backListBtn');
			var deleteBtn = $('#deleteBtn');
			var updateBtn = $('#updateBtn');
			
			//	이력서 목록 버튼 클릭 이벤트
			backListBtn.on('click', function(){
				location.href = "/jobel/myPage?menu=viewResume";		//	마이 페이지의 이력서 목록으로 되돌아감
			});		//	backListBtn onClick 이벤트 종료
			
			//	이력서 삭제 버튼 클릭 이벤트
			$('#deleteBtn').on('click', function(){
				if(confirm("정말로 삭제하시겠습니까?")){
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
			
			//	이력서 수정 버튼 클릭 이벤트
			updateBtn.on('click', function(){
				var rsmNo = $('#rsmNo').val();
				var updateUrl = "/jobel/resumeWrite?rsmNo="+rsmNo+"&trigger=Y";
				location.href = updateUrl
			});		//	updateBtn onClick 이벤트 종료
		});
	</script>
	