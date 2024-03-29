<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/11/19
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Online Food Ordering</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon.ico">

    <!-- CSS
    ============================================ -->
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- FontAwesome CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet">

    <!-- Ionicons CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/ionicons.min.css" rel="stylesheet">

    <!-- Plugins CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/plugins.css" rel="stylesheet">

    <!-- Helper CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/helper.css" rel="stylesheet">

    <!-- Main CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">

    <!-- Modernizer JS -->
    <script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-2.8.3.min.js"></script>

</head>

<body class="grey-bg">

<!--=============================================
=            header container         =
=============================================-->

<div class="header-container header-container-home-4 header-sticky white-bg">

    <!--=============================================
    =            header top         =
    =============================================-->

    <div class="header-top pt-15 pb-15">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-6">
                    <div class="header-top-text text-center text-lg-left mb-0 mb-md-15 mb-sm-15">
                        <p><i class="icon ion-md-alarm"></i> It will be delivered within 15 mins after placing the order. Complaint phone number <span class="support-no">: 191 0039 2222</span></p>
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <!--=======  header top dropdowns  =======-->

                    <div class="header-top-dropdown d-flex justify-content-center justify-content-lg-end">


                        <!--=======  single dropdown  =======-->

                        <div class="single-dropdown">

                            <a href="/fore/foreIndex" id="changeLanguage"><span id="languageName">Home</span></a>

                        </div>

                        <span class="separator pl-15 pr-15">|</span>

                        <!--=======  End of single dropdown  =======-->
                        <c:if test="${cst!=null}">
                            <div class="single-dropdown">
                                <a href="#"><span>Welcome，${cst.name}
                                     <c:if test="${cst.status==1}">(Member)</c:if>
                                     <c:if test="${cst.status==0}">(Normal)</c:if>
                                    </span>
                                </a>
                            </div>
                            <span class="separator pl-15 pr-15">|</span>
                            <div class="single-dropdown">
                                <a href="/fore/foreCstLoginOut"><span>Logout</span></a>
                            </div>
                        </c:if>
                        <c:if test="${cst==null}">
                            <div class="single-dropdown">
                                <a href="foreLoginUI"><span>Login</span></a>
                            </div>
                            <span class="separator pl-15 pr-15">|</span>
                            <div class="single-dropdown">
                                <a href="foreRegisterUI"><span>Register</span></a>
                            </div>
                        </c:if>
                        <!--=======  End of single dropdown  =======-->
                    </div>
                    <!--=======  End of header top dropdowns  =======-->
                </div>
            </div>
        </div>
    </div>

    <!--=====  End of header top  ======-->

    <!--=============================================
    =            navigation menu top            =
    =============================================-->
    <div class="navigation-menu-top navigation-menu-top-home-4 pt-35 pb-35 pt-md-15 pb-md-15 pt-sm-15 pb-sm-15 mb-md-55 mb-sm-55">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-6 col-lg-2 col-md-6 col-sm-6 order-1 order-lg-1">
                    <!--=======  logo  =======-->
                    <div class="logo">
                        <a href="/fore/foreIndex">
                            <img src="${pageContext.request.contextPath}/assets/images/logo.png" class="img-fluid" alt="">
                        </a>
                    </div>
                    <!--=======  End of logo  =======-->
                </div>
                <div class="col-12 col-lg-8 col-md-12 col-sm-12 order-3 order-lg-2">
                    <!--=======  header feature container  =======-->

                    <div class="header-feature-container mt-md-15 mt-sm-15">
                        <!--=======  single feature  =======-->

                        <div class="single-feature d-flex">
                            <div class="image">
                                <i class="icon ion-md-globe"></i>
                            </div>
                            <div class="content">
                                <h5>Free Delivery</h5>
                                <p>Free shipping for all orders.</p>
                            </div>
                        </div>
                        <!--=======  End of single feature  =======-->
                        <!--=======  single feature  =======-->
                        <div class="single-feature d-flex">
                            <div class="image">
                                <i class="icon ion-md-checkmark-circle-outline"></i>
                            </div>
                            <div class="content">
                                <h5>Cancel</h5>
                                <p>Unconditional cancellation within 5 minutes of the order.</p>
                            </div>
                        </div>
                        <!--=======  End of single feature  =======-->
                        <!--=======  single feature  =======-->
                        <div class="single-feature d-flex mb-sm-0">
                            <div class="image">
                                <i class="icon ion-md-notifications-outline"></i>
                            </div>
                            <div class="content">
                                <h5>Member Discounts</h5>
                                <p>Each order exceeds ￥100</p>
                            </div>
                        </div>
                        <!--=======  End of single feature  =======-->
                    </div>
                    <!--=======  End of header feature container  =======-->
                </div>

            </div>
        </div>
    </div>

    <!--=======  End of navigation menu top  =======-->
    <!--=============================================
		=            navigation menu         =
		=============================================-->

    <div class="navigation-menu">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-12 col-lg-3 col-md-12 col-sm-12">
                    <!--=======  category menu  =======-->

                    <div class="hero-side-category">
                        <!-- Category Toggle Wrap -->
                        <div class="category-toggle-wrap">
                            <!-- Category Toggle -->
                            <button class="category-toggle" id="categorys"> <i class="fa fa-bars"></i> Food categories </button>
                        </div>

                        <!-- Category Menu -->
                        <nav class="category-menu">
                            <ul>
                                <c:forEach items="${categories}" var="category">
                                    <li><a href="foreFindCategory?id=${category.id}" >${category.name}</a></li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
                    <!--=======  End of category menu =======-->
                    <!--=======  sticky logo  =======-->
                    <div class="sticky-logo" style="margin-top: -33px">
                        <a href="/fore/foreIndex">
                            <img src="${pageContext.request.contextPath}/assets/images/logo.png" class="img-fluid" alt="">
                        </a>
                    </div>

                    <!--=======  End of sticky logo  =======-->

                    <!--=======  search icon for tablet  =======-->

                    <div class="search-icon-menutop-tablet text-right d-inline-block d-lg-none">
                        <a href="#" id="search-overlay-active-button">
                            <i class="icon ion-md-search"></i>
                        </a>
                    </div>

                    <!--=======  End of search icon for tablet  =======-->
                </div>
                <div class="col-12 col-lg-6">
                    <!-- navigation section -->
                    <div class="main-menu">
                        <nav>
                            <ul>
                                <li><a href="/fore/forecart">My shopping cart</a></li>
                                <li><a href="/fore/forebought">My Order</a></li>
                                <li><a href="/fore/foreZixuns">University Info</a></li>
                                <li><a href="/fore/faq">Common Questions</a></li>
                            </ul>
                        </nav>
                    </div>
                    <!-- end of navigation section -->
                </div>
                <div class="col-12 col-lg-3">
                    <!--=======  navigation search bar  =======-->

                    <div class="navigation-search d-none d-lg-block">
                        <form method="post" action="/fore/foreNameLike">
                            <input type="search" placeholder="Search product ..." name="pName" id="">
                            <button type="submit"><i class="icon ion-md-search"></i></button>
                        </form>
                    </div>

                    <!--=======  End of navigation search bar  =======-->
                </div>
                <div class="col-12 d-block d-lg-none">
                    <!-- Mobile Menu -->
                    <div class="mobile-menu"></div>
                </div>
            </div>
        </div>
    </div>

    <!--=====  End of navigation menu  ======-->
</div>

