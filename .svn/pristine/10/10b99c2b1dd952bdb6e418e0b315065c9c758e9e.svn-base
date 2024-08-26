<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<style>

.comSpan{
	display: inline-block;
	margin: 10px 0 10px 20px;
}

body{
	background : #f0f0f0;
}

searchComName1{
	width : 300px;
}

.searchForm{
	position: relative;
}

.companyList{
	background-color : white;
	
}

</style>

<div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px; margin-top:50px;">
				<h1 class="display-6">기업 비교</h1>
				<p class="text-primary fs-5 mb-5">고민되는 기업들이 있다면 비교해보세요!</p>
</div>
			
<div class="container-xxl py-5" style="margin-top:0;margin-bottom:0;padding-top:0;padding-bottom:0;" id="searchDiv">
	<div class="container">
		<div class="row">
		
			<div class="col-lg-6">
				<div class="input-group" id="searchForm">
					<input type="text" class="form-control comName" id="searchComName1" placeholder="기업명을 입력해주세요" >
					<button class="btn btn-primary searchBtn" type="button" id="searchBtn1">검색</button>
				</div>
				<div id="searchResult1"></div>
			</div>
			<div class="col-lg-6">
				<div class="input-group">
					<input type="text" class="form-control comName" id="searchComName2" placeholder="기업명을 입력해주세요">	
					<button class="btn btn-primary searchBtn" type="button" id="searchBtn2">검색</button>
				</div>
				<div id="searchResult2"></div>
			</div>
			<br>
			<div class="col-lg-12" style="margin-top:50px;">
				<div class="card" style="color:blue; background-color : rgb(222,239,255,0.5);">
					<div class="card-body">
					<p>기업명</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body" id="coName1"></div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body" id="coName2"></div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="card" style="color:blue; background-color : rgb(222,239,255,0.5);">
					<div class="card-body">
					<p>매출액</p>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body" id="coSales1"></div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body" id="coSales2"></div>
				</div>
			</div>
			
			<div class="col-lg-12">
				<div class="card" style="color:blue; background-color : rgb(222,239,255,0.5);">
					<div class="card-body">
					<p>기업정보</p>
					</div>
				</div>
			</div>
			<br>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<span>직&nbsp;&nbsp;&nbsp;군</span><span class="comSpan" id="coJobTypeName1"></span><br>
						<span>직원수</span><span class="comSpan" id="coEmployeeCount1"></span><br>
						<span>주&nbsp;&nbsp;&nbsp;소</span><span class="comSpan" id="address1"></span>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card">
					<div class="card-body">
						<span>직&nbsp;&nbsp;&nbsp;군</span><span class="comSpan" id="coJobTypeName2"></span> <br>
						<span>직원수</span><span class="comSpan" id="coEmployeeCount2"></span><br>
						<span>주&nbsp;&nbsp;&nbsp;소</span><span class="comSpan" id="address2"></span>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>


	
<script>
$(function(){
	
	var searchBtn1 = $("#searchBtn1");
	var searchBtn2 = $("#searchBtn2");
	var comName = $(".comName");
	var searchComName1 = $("#searchComName1");
	var searchComName2 = $("#searchComName2");
	
	var s = 1;
	
	
	comName.on("keyup", function(e){
		var keyCode = e.which?e.which:event.keyCode;
		if(keyCode == 13){
			var comName = "";
			if($(this).next().attr("id") == "searchBtn1"){
				comName = $("#searchComName1").val();
				s = 1;
			} else{
				comName = $("#searchComName2").val();
				s = 2;
			}
			
			$.ajax({
				url : "/comCompare/searchCompany.do?comName="+comName,
				type : "post",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				success : function(res){
					console.log("res", res);
					var html = "<div style='position:absolute; background: white; border-radious:10px; width: 565px; max-height:250px; overflow:auto;  z-index:99;'>";
					$.each(res, function(i,v){
						html += "<p class='companyList' data-no='"+v.coNo+"'>"+v.coName+"</p>"
					});
					html += "</div>";
					if(s == 1){
						//$("#searchComName1").parent().parent().html(html);
						$("#searchResult1").html(html);
					} else{
 						//$("#searchComName2").parent().parent().html(html);
						$("#searchResult2").html(html);
					}
				},
				error : function(xhr){
					alert("검색실패!");
					console.log("에러 코드 : " + xhr.status);
				}
			});
		}
	});
	
	$(".searchBtn").on('click', function(){
		var comName = "";
		if($(this).attr("id") == "searchBtn1"){
			comName = $("#searchComName1").val();
			s = 1;
		} else{
			comName = $("#searchComName2").val();
			s = 2;
		}
		
		$.ajax({
			url : "/comCompare/searchCompany.do?comName="+comName,
			type : "post",
			beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
				xhr.setRequestHeader(header, token);
			},
			success : function(res){
				console.log("res", res);
				var html = "<div style='position:absolute; background: white; border-radious:10px; width: 565px; max-height:250px; overflow:auto; z-index:99;'>";
				$.each(res, function(i,v){
					html += "<p class='companyList' data-no='"+v.coNo+"'>"+v.coName+"</p>"
				});
				html += "</div>";
				if(s == 1){
					//$("#searchComName1").parent().parent().html(html);
					$("#searchResult1").html(html);
				} else{
						//$("#searchComName2").parent().parent().html(html);
					$("#searchResult2").html(html);
				}
			},
			error : function(xhr){
				alert("검색실패!");
				console.log("에러 코드 : " + xhr.status);
			}
		});
		
	});
	
	$(document).on('click', '.companyList', function(){
		var comNo = $(this).attr("data-no");
		var comName = $(this).text();
		if($(this).parent().parent().parent().find('input').attr('id') == 'searchComName1'){
			$("#searchComName1").val(comName);
			s = 1;
		} else{
			$("#searchComName2").val(comName);
			s = 2;
		}
		$(this).parent().remove();
		
		$.ajax({
			url : "/comCompare/searchCompanyDetail.do?comNo="+comNo,
			type : "post",
			beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
				xhr.setRequestHeader(header, token);
			},
			success : function(res){
				console.log("res", res);
				
				var coSales = parseInt(res.coSales + "000000").toLocaleString('ko-KR') + "원";	
				var coJobTypeName = res.coJobTypeName;
				var coEmployeeCount = res.coEmployeeCount;
				var address = res.addressBasic + " " + res.addressDetail;
				var coName = res.coName;
				
				if(s == 1){		// s가 1이면 왼쪽 div
					$("#coSales1").html(coSales);
					$("#coJobTypeName1").html(coJobTypeName);
					$("#coEmployeeCount1").html(coEmployeeCount);
					$("#address1").html(address);
					$("#coName1").html(coName);
				} else{				// s가 2면 오른쪽 div
					$("#coSales2").html(coSales);
					$("#coJobTypeName2").html(coJobTypeName);
					$("#coEmployeeCount2").html(coEmployeeCount);
					$("#address2").html(address);
					$("#coName2").html(coName);
				}
			},
			error : function(xhr){
				alert("상세정보 가져오기 실패!");
				console.log("에러 코드 : " + xhr.status);
			}
		});
	});
	
});

</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	