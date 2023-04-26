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

<section class="Hui-article-box">
    <div class="">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray">
                <span class="r">Total data：<strong>${total}</strong></span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr class="text-c">
                    <th width="">ID</th>
                    <th width="">Product name</th>
                    <th width="">Price</th>
                    <th width="">Quantity</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orderItems}" var="orderItem">
                    <tr class="text-c">
                        <td>${orderItem.id}</td>
                        <td>${orderItem.product.name}</td>
                        <td>${orderItem.product.price}</td>
                        <td>${orderItem.number}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="cl pd-5 bg-1 bk-gray">
                <span class="r">Total price<strong>${totalPrice}</strong>Yuan</span>
            </div>
        </article>
    </div>
</section>




</body>
</html>
