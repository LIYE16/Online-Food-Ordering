<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/10/11
  Time: 17:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../../include/publicMeta.jsp"%>
<%@include file="../../include/publicHeader.jsp"%>
<%@include file="../../include/publicMenu.jsp"%>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> Home
        <span class="c-gray en">&gt;</span>
        Product management
        <span class="c-gray en">&gt;</span>
        Product list <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Refresh" ><i class="Hui-iconfont">&#xe68f;</i></a> </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l">
                    <a href="javascript:;" onclick="admin_add('Add product','productAddUI','800','500')" class="btn btn-primary radius">
                        <i class="Hui-iconfont">&#xe600;</i> Add product
                    </a>
                </span>
                <span class="r">Total data：<strong>${total}</strong></span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="12">Product list</th>
                </tr>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="">ID</th>
                    <th width="">Product name</th>
                    <th width="">Price</th>
                    <th width="">Popularity</th>
                    <th width="">Sales volume</th>
                    <th width="">Product description</th>
                    <th width="">Category</th>
                    <th width="">Sellers to belong</th>
                    <th width="">Image url</th>
                    <th width="">Is it online</th>
                    <th width="100">Operation</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="product">
                    <tr class="text-c">
                        <td><input type="checkbox" value="1" name=""></td>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.price}</td>
                        <td>${product.zan}</td>
                        <td>${product.number}</td>
                        <td>${fn:substring(product.miaoshu, 0, 5)}...</td>
                        <td>${product.category.name}</td>
                        <td>${product.user.name}</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/${product.imageurl}" width="100px" height="50px">
                            
                        </td>
                        <td class="td-status">
                            <c:if test="${product.status==1}">
                                <span class="label label-success radius">Online</span>
                            </c:if>
                            <c:if test="${product.status==0}">
                                <span class="label radius">Offline</span>
                            </c:if>

                        </td>
                        <c:if test="${subject.hasRole('admin')}">
                            <td class="td-manage" >
                                <c:if test="${product.status==0}">
                                    <a style="text-decoration:none" onclick="start(this,'${product.name}')" href="javascript:;">
                                        <i class="Hui-iconfont">
                                            &#xe631;
                                        </i>
                                    </a>
                                </c:if>
                                <c:if test="${product.status==1}">
                                    <a style="text-decoration:none" onclick="stop(this,'${product.name}')" href="javascript:;">
                                        <i class="Hui-iconfont">
                                            &#xe615;
                                        </i>
                                    </a>
                                </c:if>
                                <a title="Edit" href="javascript:;" onclick="admin_edit('Product edit','editProduct?id=${product.id}','1','800','500')" class="ml-5" style="text-decoration:none">
                                    <i class="Hui-iconfont">&#xe6df;</i>
                                </a>
                                <a deleteLink="true" title="Delete" href="/product/deleteProduct?id=${product.id}"  class="ml-5" style="text-decoration:none">
                                    <i class="Hui-iconfont">&#xe6e2;</i>
                                </a>
                            </td>
                        </c:if>
                        <c:if test="${!subject.hasRole('admin')}">
                            <td>No operation permission</td>
                        </c:if>
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


    function admin_add(title,url,w,h){
        layer_show(title,url,w,h);
    }


    function admin_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

    /*自定义*/
    function start(obj,name) {
        layer.confirm('Confirm to online?',function(){
            $.get(
                "enableStatus",
                {"name":name},
                function (result) {
                    if("success"==result){
                        // location.reload();
                        $(obj).parents("tr").find(".td-manage").prepend('<a onclick="start(this,\'${product.name}\')" href="javascript:;" title="Offline" style="text-decoration:none"></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">Online</span>');
                        //$(obj).remove();
                        layer.msg('Enabled', {icon: 6,time:1000});
                        location.reload();
                    }
                }
            );
        });
    }
    function stop(obj,name) {
        layer.confirm('Confirm to offline？',function(){
            $.get(
                "stopStatus",
                {"name":name},
                function (result) {
                    if("success"==result){
                        // location.reload();
                        $(obj).parents("tr").find(".td-manage").prepend('<a onclick="start(this,\'${product.name}\')" href="javascript:;" title="Online" style="text-decoration:none"></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">Offline</span>');
                        //$(obj).remove();
                        layer.msg('Offline!', {icon: 6,time:1000});
                        location.reload();
                    }
                }
            );
        });
    }



</script>

</body>
</html>
