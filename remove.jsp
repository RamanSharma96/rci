<%@ page import="java.sql.*" errorPage="error.jsp" %>
<%@ include file="adminindex2.jsp"%>
<%  
    if(session.getAttribute("session")==null)
      {
        System.out.println("Unauthorized access!");
%>
<jsp:forward page="home.jsp"/>
<%
      }
    else{
      System.out.println("At welcome_admin jsp page");
    }
%>
<html>
<head>
  <title>Inventory Management</title>
  <link rel="stylesheet" href="css/welcome.css"/>
  <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
</head>
<body>
    <div id="page">
      <table id="tab" >
        <div id="nav">
          <tr>
         <td align="center" valign="center" id="img1"><div>
           <img src="images/rci.png" alt="ntg" width="75px" height="75px"/>
         </div>
       </td>
       <td id="heading">
          <div>
           <h1>Research Center Imarat</h1> 
         </div>
        </td>
        <td id="img2">
         <div>
           <img src="images/g.png" width="75px" height="75px" alt="asdasdasd"/>
         </div>
       </td>
      </tr>
    </div>
      </table><br><br>
<table width="100%" border="4">  
    <tr>
      <td>Part No.</td>
      <td>Date of Purchase/Date Item Received</td>
      <td>Part name</td>
      <td>Manufacturer</td>
      <td>Currency</td>
      <td>Material</td>
      <td>Inventory</td>
      <td>Quantity</td>
      <td>Price</td>
      <td>Status</td>
      <td>Location</td>
      <td>Remark</td>
    </tr>
    <form action="removeprocess.jsp">
  <%
      Connection con=(Connection)session.getAttribute("connection");
      PreparedStatement ps=con.prepareStatement("select * from main where invno=?");
      ps.setString(1,(String)session.getAttribute("invno"));
      ResultSet rs2=ps.executeQuery();
          int c=1;
          try{
            while(rs2.next()){
  %>
            <tr>
                      <td><input type="checkbox" name="partno<%=c%>" value="<%=rs2.getString(1)%>">
                      <%=rs2.getString(1)%></td>
                      <td><input type="checkbox" name="dop<%=c++%>" value="<%=rs2.getString(10)%>" checked hidden><%=rs2.getString(10)%></td>
                      <td><%=rs2.getString(2)%></td>
                      <td><%=rs2.getString(3)%></td>
                      <td><%=rs2.getString(4)%></td>
                      <td><%=rs2.getString(5)%></td>
                      <td><%=rs2.getString(6)%></td>
                      <td><%=rs2.getInt(7)%></td>
                      <td><%=rs2.getFloat(8)%></td>
                      <td><%=rs2.getString(9)%></td>
                      <td><%=rs2.getString(11)%></td>
                      <td><%=rs2.getString(12)%></td>
            </tr>
<%
        }
%>
        <input type="submit" value="Remove"/>
        </form>
<%
          }
          catch(Exception e)
          {
            e.printStackTrace();
          }
%> </table>
    </div>
    <input type="hidden" id="refreshed" value="no">
    <script type="text/javascript">
    onload=function(){
      var e=document.getElementById("refreshed");
      if(e.value=="no")
        e.value="yes";
      else{
        e.value="no";
        location.reload();
      }
    }
  </script>
</body> 
</html>