<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TACO LOCO</title>
<script type="text/javascript">
	var orderObj = '{"order":[]}';
	var orderJSONObj = JSON.parse(orderObj);
	var order_request;


function addItems(){

    var itemselectindx = document.getElementById("orderlist");
    var itemselect = itemselectindx.options[itemselectindx.selectedIndex].value;

    var itemquantity = document.getElementById("quantity").value;
    
	  var items = document.createElement("TR");
	  document.getElementById("order").appendChild(items);

	  var item = document.createElement("TD");
	  item.setAttribute("id", "item");
	  var itemselectnode = document.createTextNode(itemselect);
	  item.appendChild(itemselectnode);
	  
	  items.appendChild(item);

	  var quantity = document.createElement("TD");
	  quantity.setAttribute("id", "quantity");
	  var itmquantity = document.createTextNode(itemquantity);
	  quantity.appendChild(itmquantity);
	  
	  items.appendChild(quantity);
      
 		orderJSONObj['order'].push({"item":itemselect,"quantity":itemquantity});
 		order_request = JSON.stringify(orderJSONObj);
// 		alert(order_request);
}


function madeAjaxCall(){
	alert(">>"+order_request);
    $.ajax({
     type: "post",
     headers : {
         'Accept' : 'application/json',
         'Content-Type' : 'application/json'
     },
     url: "/total",
     cache: false,    
     data : order_request,
     success: function(response){
      var obj = JSON.parse(response);
	  alert('finallly:'+obj);
	  },
     error: function(){      
      alert('Error while request..');
     }
    });
   }
   
</script>
</head>
<body>
 
    HOME SCREEN<br> TACOLOCO <br>            
<select id="orderlist">
    <option value="VeggieTaco">Veggie Taco</option>
    <option value="ChickenTaco">Chicken Taco</option>
     <option value="BeefTaco">Beef Taco</option>
  <option value="ChorizoTaco">Chorizo Taco</option>
  </select>
  <input id="quantity" type="number" min="1">
  <button id="submitItem" onclick="addItems()">Add Item</button>
  
  
<%-- <form:form id = "getTotal" method="post" > --%>
<table id="order" border="1">
	</table>
  <button id="submitOrder" type="submit"  onclick="madeAjaxCall()" >Place Order</button>
<%-- </form:form> --%>

</body>
</html>