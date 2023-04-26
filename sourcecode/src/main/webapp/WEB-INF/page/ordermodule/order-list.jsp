<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/10/4
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../../include/publicMeta.jsp"%>
<%@include file="../../include/publicHeader.jsp"%>
<%@include file="../../include/publicMenu.jsp"%>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> Home
        <span class="c-gray en">&gt;</span>
        Order Management
        <span class="c-gray en">&gt;</span>
        Order list <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a> </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="r">Total data：<strong>${totals}</strong></span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="10">Post-stage order list</th>
                </tr>
                <tr class="text-c">
                    <th width="">ID</th>
                    <th>Address</th>
                    <th>Buyer</th>
                    <th>Total price</th>
                    <th>Status</th>
                    <th width="150">Operation</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${os}" var="order">
                <tr class="text-c">
                    <td>${order.id}</td>
                    <td>${order.address}</td>
                    <td>${order.customer.name}</td>
                    <td>${order.total}</td>
                    <td>
                        <c:if test="${order.status==0}">
                            Unpaid
                        </c:if>
                        <c:if test="${order.status==1}">
                            Not shipped
                        </c:if>
                        <c:if test="${order.status==2}">
                            Delivered
                        </c:if>
                        <c:if test="${order.status==3}">
                            Received
                        </c:if>
                    </td>
                    <td>
                        <a title="View" href="javascript:;"
                           onclick="orderIetm_list('Order details','seeOrderItem?oid=${order.id}','1','500','310')"
                           class="ml-5" style="text-decoration:none">
                            <span class="label label-success radius">View details</span>
                        </a>
                        <c:if test="${order.status==1}">
                            <a title="Ship" href="/order/orderDelivery?id=${order.id}"
                               class="ml-5" style="text-decoration:none">
                                    <span class="label label-success radius">Ship</span>
                            </a>
                        </c:if>
                        <c:if test="${order.status==2}">
                            <span class="label radius">Delivered</span>
                        </c:if>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </article>
        <article class="cl pd-20">
            <%@include file="../adminPage.jsp"%>
        </article>
    </div>
</section>

<%@include file="../../include/publicFooter.jsp"%>

<script type="text/javascript">
    /*
        参数解释：
        title	标题
        url		请求的url
        id		需要操作的数据id
        w		弹出层宽度（缺省调默认值）
        h		弹出层高度（缺省调默认值）
    */
    /*管理员-编辑*/
    function orderIetm_list(title,url,id,w,h){
        layer_show(title,url,w,h);
    }


</script>

</body>
</html>
