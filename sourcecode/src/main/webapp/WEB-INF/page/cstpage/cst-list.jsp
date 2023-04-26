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
        User Management
        <span class="c-gray en">&gt;</span>
        User list <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Refresh" ><i class="Hui-iconfont">&#xe68f;</i></a> </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="r">Total data：<strong>${totals}</strong></span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="10">Back-end Order list</th>
                </tr>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="">ID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>User level</th>
                    <th>Operation</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="cst">
                    <tr class="text-c">
                        <td><input type="checkbox" value="1" name=""></td>
                        <td>${cst.id}</td>
                        <td>${cst.name}</td>
                        <td>${cst.password}</td>
                        <td>${cst.address}</td>
                        <td>${cst.phone}</td>
                        <td>
                            <c:if test="${cst.status==1}">Member</c:if>
                            <c:if test="${cst.status==0}">Normal</c:if>
                        </td>
                        <td>
                            <a title="Set as a Member" href="javascript:;"
                               onclick="shezhihuiyuan(this,${cst.id},${cst.status})"
                               class="ml-5" style="text-decoration:none">
                                <span class="label label-success radius">Set as Member</span>
                            </a>
                            <a deleteLink="true" title="Delete" href="/customer/del?id=${cst.id}"
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
    /*
       参数解释：
       title	标题
       url		请求的url
       id		需要操作的数据id
       w		弹出层宽度（缺省调默认值）
       h		弹出层高度（缺省调默认值）
   */
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

    /*自定义*/
    function shezhihuiyuan(obj,id,status) {
        if(status==1){
            layer.confirm("This user is already Member level!");
            return false;
        }
        layer.confirm('Confirm to set as Member？',function(){
            $.get(
                "shezhihuiyuan",
                {"id":id},
                function (result) {
                    if("success"==result){
                        layer.msg('Set as a Member!', {icon: 6,time:3000});
                        location.reload();
                    }
                }
            );
        });
    }

</script>

</body>
</html>
