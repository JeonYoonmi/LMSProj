<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />

        <title>인재대학교 사이버캠퍼스</title>
        
        <!-- App favicon -->
        <link rel="shortcut icon" href="/resources/images/logo.png">

		<script src="/resources/js/jquery-3.6.0.js"></script>

        <!-- third party css -->
        <link href="/resources/Hyper/dist/saas/assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- third party css end -->

        <!-- App css -->
        <link href="/resources/Hyper/dist/saas/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="/resources/Hyper/dist/saas/assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style" />
        <link href="/resources/Hyper/dist/saas/assets/css/app-dark.min.css" rel="stylesheet" type="text/css" id="dark-style" />
		
		<style type="text/css">
			.body{
				margin-left: 15%;
				margin-top: 2%;
			}
			
			.topnav{
				background: #001353;
			}
			
			.nav-item{
				padding-right: 5%; 
			}
			
			.nav-item:first-child{
				margin-left: 105%;
			}
		</style>
		
		

        
    </head>

    <body class="loading" data-layout="topnav" data-layout-config='{"leftSideBarTheme":"light","layoutBoxed":false,"leftSidebarCondensed":false, "leftSidebarScrollable":false,"darkMode":false,"showRightSidebarOnStart": true}'>
        <!-- Begin page -->
        <div class="wrapper">

			<!-- ============================== Left Sidebar Start ============================== -->
            <tiles:insertAttribute name="aside" />
            <!-- ============================== Left Sidebar End  ==============================-->
            
            <!-- ============================================================== -->
            <!-- Start Page Content here -->
            <!-- ============================================================== -->

            <div class="content-page">
                <div class="content">
                    <!-- Topbar Start -->
                    <tiles:insertAttribute name="topbar" />
                    <!-- end Topbar -->

					<!-- Topnav Start -->
                    <c:if test="${ memSession.studentVO.stuCd != null }">
                   		<tiles:insertAttribute name="stuTopnav" />
                   	</c:if>
					<c:if test="${ memSession.professorVO.proCd != null }">
                   		<tiles:insertAttribute name="proTopnav" />
					</c:if>
					<!-- End Topnav -->
                    
                    <!-- Start Content-->
                    <div class="container-fluid body">
						<tiles:insertAttribute name="body" />
                    </div>
                    <!-- container -->

                </div>
                <!-- content -->

            </div>

            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->


        </div>
        <!-- END wrapper -->

    </body>
    
        <!-- bundle -->
        <script src="/resources/Hyper/dist/saas/assets/js/vendor.min.js"></script>
        <script src="/resources/Hyper/dist/saas/assets/js/app.min.js"></script>

        <!-- third party js -->
<!--         <script src="/resources/Hyper/dist/saas/assets/js/vendor/apexcharts.min.js"></script> -->
<!--         <script src="/resources/Hyper/dist/saas/assets/js/vendor/jquery-jvectormap-1.2.2.min.js"></script> -->
<!--         <script src="/resources/Hyper/dist/saas/assets/js/vendor/jquery-jvectormap-world-mill-en.js"></script> -->
        <!-- third party js ends -->

        <!-- demo app -->
<!--         <script src="/resources/Hyper/dist/saas/assets/js/pages/demo.dashboard.js"></script> -->
        <!-- end demo js-->
</html>