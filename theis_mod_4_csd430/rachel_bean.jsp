<%@ page import="coffeeBeans.ClothingItemBean" %>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--
Rachel Theis
Module 4 Assignment
CSD 430 
6.15.25
-->
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>What's for sale</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid #666; padding: 10px; text-align: center; }
        th { background-color: #f0f0f0; }
    </style>
</head>
<body>

<h2 style="text-align:center;">Items for sale at Rachel's Boutique</h2>
<p style="text-align:center;">Displaying all</p>

<table>
    <tr>
        <th>Name</th>
        <th>Category</th>
        <th>Sizes</th>
        <th>Color</th>
        <th>Price(USD)</th>
    </tr>

<%
    String[] names = {"Celeste Bikini Top", "Viv Tank Dress", "Donna Moto Jacket", "James Button Up", "Charli Sweater"};
    String[] categories = {"Swim", "Dresses", "Outerwear", "Blouses", "Tops"};
    String[] sizes = {"XS-L", "XS-XL", "S-L", "XS-XL", "S-XL"};
    String[] colors = {"Blue", "Black", "White", "Tan", "Light Blue"};
    double[] prices = {65.99, 52.99, 99.99, 45.99, 58.99};

    for (int i = 0; i < names.length; i++) {
        ClothingItemBean item = new ClothingItemBean();
        item.setName(names[i]);
        item.setCategory(categories[i]);
        item.setSize(sizes[i]);
        item.setColor(colors[i]);
        item.setPrice(prices[i]);
%>
    <tr>
        <td><%= item.getName() %></td>
        <td><%= item.getCategory() %></td>
        <td><%= item.getSize() %></td>
        <td><%= item.getColor() %></td>
        <td><%= String.format("%.2f", item.getPrice()) %></td>
    </tr>
<%
    }
%>
</table>

</body>
</html>
