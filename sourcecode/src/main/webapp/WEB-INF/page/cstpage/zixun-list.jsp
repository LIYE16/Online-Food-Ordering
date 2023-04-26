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
        Info Management
        <span class="c-gray en">&gt;</span>
        Info list <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Refresh" ><i class="Hui-iconfont">&#xe68f;</i></a> </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="r">Total data：<strong>${totals}</strong></span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="10">Back-end Info list</th>
                </tr>
                <tr class="text-c">
                    <th width="">ID</th>
                    <th>Posted by</th>
                    <th>Content</th>
                    <th>Release time</th>
                    <th>Audit Status</th>
                    <th width="150">Operation</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="z">
                <tr class="text-c">
                    <td>${z.id}</td>
                    <td>${z.cstid}</td>
                    <td>${z.content}</td>
                    <td>${z.fabudate}</td>
                    <td>
                        <c:if test="${z.status==0}">
                            Unaudited
                        </c:if>
                        <c:if test="${z.status==1}">
                            Audited
                        </c:if>

                    </td>
                    <td>
                        <c:if test="${z.status==0}">
                            <a title="Audite" href="javascript:;"
                               onclick="zixunSH(${z.id})"
                               class="ml-5" style="text-decoration:none">
                                    <span class="label label-success radius">Pass</span>
                            </a>
                        </c:if>
                        <c:if test="${z.status==1}">
                            <span class="label radius">Passed</span>
                        </c:if>
                        <a deleteLink="true" title="Delete" href="/zixun/del?id=${z.id}"
                           class="ml-5" style="text-decoration:none">
                            <span class="label label-success radius">Delete</span>
                        </a>
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

    $(function(){
        $("a").click(function(){
            var deleteLink = $(this).attr("deleteLink");
            console.log(deleteLink);
            if("true"==deleteLink){
                var confirmDelete = confirm("Confirm to delete?");
                if(confirmDelete)
                    return true;
                return false;

            }
        });
    })
    /*资讯审核*/
    function zixunSH(zid){
        layer.confirm('Comfirm to pass the audite？',function(){
            $.get(
                "zixunshenhe",
                {"zid":zid},
                function (result) {
                    if("success"==result){

                        layer.msg('Audited!', {icon: 6,time:1000});
                        location.reload();
                    }
                }
            );
        });
    }


</script>

</body>
</html>
