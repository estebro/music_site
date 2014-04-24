<HTML>
<HEAD>
<TITLE>Music</TITLE>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<!-- slight modification to theme colors -->
<link rel="stylesheet" href="styles/index.css">
</HEAD>
<BODY>

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
				<li class="active"><a href="index.jsp">Home</a></li>
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

<div class="jumbotron">
    <img src="images/music142.png" class="icon">
    <h2>Music Database</h2>
</div>
<div class="navbar navbar-default navbar-fixed-bottom">
	<div class="container">
		<p class="navbar-text pull-left">Site built by Esteban Porres</p>
		<a href="mailto:emp0013@auburn.edu" class="navbar-btn btn-danger btn pull-right">
            Email Us
        </a>
	</div>
</div>
</BODY>
</HTML>
