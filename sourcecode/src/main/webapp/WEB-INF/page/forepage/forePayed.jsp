<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/11/25
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../foreinclude/foreHander1.jsp"%>
<style type="text/css">
    #mydiv{width: 100%;height: 170px;}
    #mycart{width:450px;heiget:140px;margin: 135px auto;font-size: 25px}
</style>
<div id="mydiv" class="checkout-title">
    <div id="mycart">You have paid successfully, total${total}Yuan<a href="/fore/forebought" style="color: red">Check the order</a></div>
</div>
<%@ include file="../../foreinclude/foreFooter.jsp"%>
