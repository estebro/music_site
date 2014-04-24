<html>
<head>
    <title>Read File</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles/loading_splash.css">
</head>
<body>
<%@ page import="java.io.*" %>
<%
    String criteria = request.getParameter("search_criteria");
    String value = request.getParameter("search_value");
    String message = "Processing search results.";
    String url = "";

    if (value.equals("")) {

        // redirect to previous page
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        url = "3; URL=" + request.getHeader("Referer");
        response.setHeader("Refresh", url);
        message = "Invalid. Please provide search criteria.";

    } else if (criteria.equals("Artist")) {
        
        // to results by artist
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        url = "3; URL=artist_table.jsp?search_value=" + value;
        response.setHeader("Refresh", url);

    } else if (criteria.equals("Song")) {
        
        // to results by song
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        url = "3; URL=song_table.jsp?search_value=" + value;
        response.setHeader("Refresh", url);

    } else if (criteria.equals("Album")) {

        // to results by artist
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        url = "3; URL=album_table.jsp?search_value=" + value;
        response.setHeader("Refresh", url);
    }

%>

<div class="jumbotron">
    <!-- royalty free gif by www.pixelbuddha.net -->
    <img src="images/Preloader_2.gif" alt="loading...">
    <h3><%= message %></h3>
</div>
<div class="navbar navbar-default navbar-fixed-bottom">
	<div class="container">
		<p class="navbar-text pull-left">Site built by Esteban Porres</p>
		<a href="mailto:emp0013@auburn.edu" class="navbar-btn btn-danger btn pull-right">
            Email Us
        </a>
	</div>
</div>
</body>
</html>     