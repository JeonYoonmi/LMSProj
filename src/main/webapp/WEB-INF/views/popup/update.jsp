<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업 수정하기</title>
</head>
<body>
<div class="card-body">
    <h4 class="header-title">팝업 수정하기</h4>
    
    <br><br>

    <div class="tab-content">
        <div class="tab-pane show active" id="horizontal-form-preview">
            <form class="form-horizontal"
            action="/popup/updateAction"
            method="post"
            enctype="multipart/form-data">
                <div class="row mb-3">
                    <label for="popUpTitle" class="col-3 col-form-label">팝업 제목</label>
                    <div class="col-9">
                        <input type="text" class="form-control" id="popUpTitle" name="popUpTitle" 
                        value="${popupVO.popTtl}">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="popUpFile" class="col-3 col-form-label">파일 재등록</label>
                    <div class="col-9">
                        <input class="form-control" type="file" id="popUpFile" name="popUpFile"
                        value="${filePath}"><br>
                        <img alt="${popupVO.popFnm}" src="${filePath}" style="width:300px;">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="startDate" class="col-3 col-form-label">시작 일자</label>
                    <div class="col-9">
                        <input class="form-control" id="startDate" name="startDate" type="date" name="date"
                        value="<fmt:formatDate value='${popupVO.popSt}' pattern='yyyy-MM-dd'/>">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="endDate" class="col-3 col-form-label">종료 일자</label>
                    <div class="col-9">
                        <input class="form-control" id="endDate" name="endDate" type="date" name="date"
                        value="<fmt:formatDate value='${popupVO.popEt}' pattern='yyyy-MM-dd'/>">
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="popUpYn" class="col-3 col-form-label">팝업 사용 여부</label>
                    <div class="col-9">
                    	<c:choose>
                    		<c:when test="${popupVO.popYn == 1}">
                    			<input class="form-check-input" type="checkbox" name="popUpYn" value="1" checked="">
                    		</c:when>
                    		<c:when test="${popupVO.popYn == 0}">
                    			<input class="form-check-input" type="checkbox" name="popUpYn" value="1">
                    		</c:when>
                    	</c:choose>
                    </div>
                </div>
<!--                 <div class="row mb-3 justify-content-end"> -->
<!--                     <div class="col-9"> -->
<!--                         <div class="form-check"> -->
<!--                         	<label for="popUpYn" class="col-3 col-form-label">팝업 사용 여부</label> -->
<!--                             <input class="form-check-input" type="checkbox" name="popUpYn" value="1" checked=""> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
				<input type="hidden"
					 class="form-control"
					 id="popUpCode" name="popUpCode" 
	                 value="${popupVO.popCd}">
                <div class="justify-content-end row">
                    <div class="col-9">
                        <button type="submit" class="btn btn-info">팝업 등록하기</button>
                    </div>
                </div>
            </form>                                            
        </div>
     </div>
</div>
</body>
</html>