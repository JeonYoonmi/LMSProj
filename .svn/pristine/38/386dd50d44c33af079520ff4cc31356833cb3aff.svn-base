<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
	#mailDetail{
    	min-height: 865px;
    	padding: 0 3%;
    }
    
    #mailCon{
    	min-height: 300px;
    }
    
    .mailWrap {
	    padding: 5% 7%;
	    background: #ffff;
	    border-radius: 1%;
	    width: 100%;
	    min-height: 750px;
	    border-top: 4px solid #112A63;
    }
    small{
    	font-size : 15pt;
    	display : inline-block;
    	margin-bottom : 10px;
    }
    .coloredFont {
    	color : #112a63;
    }
</style>
<div id="mailDetail">
	<div class="btn-group">
		<button type="button" class="btn btn-secondary" onclick="location.href='/mail/delete?mlCd=${ mailVO.mlCd }'">
			<i class="mdi mdi-delete-variant font-16"></i>
		</button>
	</div>
	<div class="mt-3 mailWrap">
		<span class="coloredFont" style="font-weight:bold;padding-left:10px;font-size:1.2em;">${ mailVO.mlTtl }</span>
		<span style="float:right;padding-right:10px;padding-top:20px;"><fmt:formatDate value="${ mailVO.mlTm }" pattern="yyyy-MM-dd (E) HH:mm" /></span>
		
		<hr style="border-color: #112a63;margin-top:30px;" />
		<div class="media-body" style="padding-left:10px;">
			<b class="coloredFont">보낸사람</b>&ensp;&ensp;${ mailVO.mlSennm } &lt;${ mailVO.mlSenml }>
			<div style="height:8px;"></div>
			<b class="coloredFont">받은사람</b>&ensp;&ensp;${ mailVO.mlRcpnm } &lt;${ mailVO.mlRcpml }>
		</div>
		<hr style="border-color: #112a63;margin-bottom:40px;" />
		
		<div id="mailCon" style="padding-left:10px;">
			${ mailVO.mlConDisplay }
		</div>
		<hr />
		<c:if test="${ not empty mailVO.mailFileVOList }">
			<h5 class="mb-3">Attachments</h5>
		</c:if>
	
		<div class="row">
			<c:forEach var="mailFileVO" items="${ mailVO.mailFileVOList }">
				<div class="col-xl-4">
					<div class="card mb-1 shadow-none border">
						<div class="p-2">
							<div class="row align-items-center">
								<div class="col-auto">
									<div class="avatar-sm">
										<span class="avatar-title bg-secondary rounded">${ fn:substring(mailFileVO.attachVO.attachNm, fn:indexOf(mailFileVO.attachVO.attachNm, '.') + 1, fn:length(mailFileVO.attachVO.attachNm)) }</span>
									</div>
								</div>
								<div class="col pl-0">
									<a href="javascript:void(0);" class="text-muted font-weight-bold">${ fn:substring(mailFileVO.attachVO.attachNm, fn:indexOf(mailFileVO.attachVO.attachNm, '_') + 1, fn:length(mailFileVO.attachVO.attachNm)) }</a>
								</div>
								<div class="col-auto">
									<!-- Button -->
									<a href="#" onclick="fn_download('${ mailFileVO.attachVO.attachNm }')"
										class="btn btn-link btn-lg text-muted"> <i
										class="dripicons-download"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- end .mt-4 -->
	<iframe id="ifrm" name="ifrm" style="display: none;"></iframe>
</div>
<script type="text/javascript" defer="defer">
	function fn_download(fileName){
// 		alert("fileName >> " + fileName);
		
		let vIfrm = document.getElementById("ifrm");
		
		vIfrm.src = "/mail/download?fileName=" + fileName;
	}
</script>

<!-- SimpleMDE js -->
<script
	src="/resources/Hyper/dist/saas/assets/js/vendor/simplemde.min.js"></script>

<!-- Page init js -->
<script src="/resources/Hyper/dist/saas/assets/js/pages/demo.inbox.js"></script>