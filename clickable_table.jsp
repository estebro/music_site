<!DOCTYPE html>
<html>

<head>
<title>Music</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
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
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#">Library</a></li>
				<li><a href="about_us.xml">About Us</a></li>

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

<div class="container">

	<div class="panel panel-default">
		
		<!-- default panel contents -->
		<div class="panel-heading">Music Library</div>
		<div class="panel-body">
			<p>Your paragraph text goes here.</p>
		
			<!-- creating the table -->
			<table class="table table-hover">

				<!-- contains all of the table headers -->
				<tr>
					<th>TRACK</th>
					<th>ARTIST</th>
					<th>ALBUM</th>
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
					
					// Start work
					Statement song_stm, album_stm, artist_stm;
					ResultSet song_rst, album_rst, artist_rst;
					String track, album, artist, query;

					song_stm = conn.createStatement();
					album_stm = conn.createStatement();
					artist_stm = conn.createStatement();

					query = "SELECT * FROM song	";
					song_rst = song_stm.executeQuery(query);

					while (song_rst.next()) {
						query = "SELECT aname,artistid FROM album WHERE albumid IN ('"+song_rst.getString("albumid")+"');";
						album_rst = album_stm.executeQuery(query);
						out.println(query);
						album_rst.next();

						query = "SELECT fname,lname FROM artist WHERE artistid IN ('"+album_rst.getString("artistid")+"');";
						artist_rst = artist_stm.executeQuery(query);
						artist_rst.next();

						track = song_rst.getString("sname");
						album = album_rst.getString("aname");
						artist = artist_rst.getString("fname") + " " + artist_rst.getString("lname");
				%>

				<!-- model for a standard table row -->
				<tr>
					<!-- model for a standard 'track' cell -->
					<td>
						<!-- clicking will show respective album info -->
						<a href="clickable_table.jsp?search_criteria=Song&search_value=<%=track%>"><%=track%></a>
					</td>

					<!-- model for a standard 'artist' cell -->
					<td>
						<!-- clicking will show all artist's albums -->
						<a href="clickable_table.jsp?search_criteria=Artist&search_value=<%=artist%>"><%=artist%></a>
					</td>

					<!-- model for a standard 'album' cell -->
					<td>
						<!-- clicking will show all artist's albums -->
						<a href="clickable_table.jsp?search_criteria=Album&search_value=<%=album%>"><%=album%></a>
					</td>

				</tr>

				<%		
					album_rst.close();
					}

				song_rst.close();
				song_stm.close();
				album_stm.close();
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

</body>

</html>