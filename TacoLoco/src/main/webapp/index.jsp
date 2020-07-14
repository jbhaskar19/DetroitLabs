<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TACO LOCO</title>
<script>
	var orderObj = '{"order":[]}';
	 var orderJSONObj = JSON.parse(orderObj);

var order_request;

function addItems(){
	  
     var itemselectindx = document.getElementById("orderlist");
     var itemselect = itemselectindx.options[itemselectindx.selectedIndex].value;

     var itemquantity = document.getElementById("quantity").value;
          
       var order = document.getElementById("order");
       var mylist = document.createElement("li");
       var item = document.createTextNode("item:" + itemselect + ',quantity:' + itemquantity);
       mylist.appendChild(item);
       order.appendChild(mylist);
       
 	orderJSONObj['order'].push({"item":itemselect,"quantity":itemquantity});
 	order_request = JSON.stringify(orderJSONObj);

}


function myOrderFunction(){
	alert(order_request);
	$.ajax({
        type: "POST",
        url : 'total',
        data : order_request,
        contentType:"application/json; charset=utf-8",
        dataType:"json",
        success : function(resp){
           alert(resp);
        },
        error : function(resp){
            alert(resp);
        }
    });
}

</script>
</head>
<body>
 
    HOME SCREEN TACOLO            
<select id="orderlist">
    <option value="VeggieTaco">Veggie Taco</option>
    <option value="ChickenTaco">Chicken Taco</option>
     <option value="BeefTaco">Beef Taco</option>
  <option value="ChorizoTaco">Chorizo Taco</option>
  </select>
  <input id="quantity" type="number">
  <button id="submitItem" onclick="addItems()">Add Item</button>
  
<%-- <form:form method="POST" action="total" modelAttribute="Process"> --%>
 <ol style="list-style-type:none" id="order"></ol> 
  <button id="submitOrder" type="submit" onsubmit="myOrderFunction()">Place Order</button>
<%-- </form:form> --%>

</body>
</html>