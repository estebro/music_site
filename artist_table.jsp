<!DOCTYPE html>
<html>

<head>
<title>Music</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="styles/tables.css">
<!-- Latest compiled and minified JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>


</head>

<body>
<%@ page import="java.sql.*" %>

<!-- top/fixed navigation bar -->
<div class="navbar navbar-inverse navbar-static-top">
	<div class="container">

		<!-- brand name/image -->
		<a href="index.jsp" class="navbar-brand">MUSIC</a>

		<!-- creates icon for mobile navbar -->
		<button class="navbar-toggle" data-toggle="collapse" data-target=".navHeaderCollapse">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>

		<!-- links/destinations within the navbar -->
		<div class="collapse navbar-collapse navHeaderCollapse">

			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="library.jsp">Library</a></li>

				<!-- include 'search' within navbar -->
				<li><form class="navbar-form navbar-left" role="search" action="loading_splash.jsp">

						<div class="form-group">
							<!-- drown down for search criteria -->
							<select class="form-control" name="search_criteria">
								<option value="Artist">Artist</option>
								<option value="Album">Album</option>
								<option value="Song">Song</option>
							</select>

							<!-- text input for search value -->
							<input type="text" class="form-control" name="search_value" placeholder="Search">
						</div>

						<!-- magnifying glass 'submit' button -->
						<button type="submit" class="btn btn-default">
	  						<i class="glyphicon glyphicon-search"></i>
	  					</button>
	  					
				</form></li>
			</ul>

		</div>
	</div>
</div>

<div class="container" id="content_body">

	<div class="panel panel-default">
		
		<!-- default panel contents -->
		<div class="panel-heading"><h4>Search Results</h4></div>
		<div class="panel-body">
		
			<!-- creating the table -->
			<table class="table table-hover">

				<!-- contains all of the table headers -->
				<tr>
					<th>ALBUM</th>
					<th>ARTIST</th>
					<th>GENRE</th>
					<th>YEAR</th>
					<th>PRICE</th>
				</tr>

				<%
				// Connection Information
				String username = "lib_manager";
				String password ="managewell";
				String url = "jdbc:mysql://localhost:3306/musiccds?user="+username+"&password="+password;
				Connection  conn = null;

				try {
					// Get the SQL Connection
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					conn = DriverManager.getConnection(url);
					
					Statement song_stm, album_stm, artist_stm;
					ResultSet song_rst, album_rst, artist_rst;
					String album, artist, year, price, query;

					String value = request.getParameter("search_value");
					String first = value.substring(0,value.indexOf(" "));
					String last = value.substring(value.indexOf(" ")+1);

					song_stm = conn.createStatement();
					album_stm = conn.createStatement();
					artist_stm = conn.createStatement();

					query = "SELECT fname,lname,artistid FROM artist WHERE (fname IN ('"+first+"') AND lname IN ('"+last+"'));";
					artist_rst = artist_stm.executeQuery(query);
					
					// iterate albums for given artist
					while (artist_rst.next()) {
						
						query = "SELECT aname,albumid,genre,year,price FROM album WHERE artistid IN ('"+artist_rst.getString("artistid")+"');";
						album_rst = album_stm.executeQuery(query);
						
						artist = artist_rst.getString("fname") + " " + artist_rst.getString("lname");

						while (album_rst.next()) {

							album = album_rst.getString("aname");
				%>

				<!-- model for a standard table row -->
				<tr>
					<!-- model for a standard 'album' cell -->
					<td>
						<!-- clicking will show all artist's albums -->
						<a href="album_table.jsp?search_value=<%=album%>"><%=album%></a>
					</td>

					<!-- model for a standard 'artist' cell -->
					<td>
						<!-- clicking will show all artist's albums -->
						<a href="artist_table.jsp?search_value=<%=artist%>"><%=artist%></a>
					</td>

					<!-- genre, year, price columns -->
					<td><%=album_rst.getString("genre")%></td>
					<td><%=album_rst.getString("year")%></td>
					<td>$<%=album_rst.getString("price")%></td>

				</tr>

				<%		
						}

						album_rst.close();
					}
				
					artist_rst.close();
					song_stm.close();
					album_stm.close();
					artist_stm.close();
					conn.close();

				} catch (Exception exc) {
					out.println(exc.toString());
				}
				%>
								
			</table>
		</div>

		<!-- now try to implement a clickable modal -->
		<div id="album_modal" class="modal fade" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- modal header with title and 'close' icon -->
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">ALBUM TITLE</h4>
					</div>

					<!-- modal body -->
					<div class="modal-body">

					</div>

					<!-- modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>

	</div>
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