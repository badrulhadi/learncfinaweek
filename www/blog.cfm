<!--- <cfquery name="myBlog">
	SELECT
		title,
		summary,
		datePosted
	FROM
		post
</cfquery> --->

<cfset blogPosts = EntityLoad('blogPost') />


<cfimport taglib="customTags/" prefix="layout" />
<layout:page section="blog">  		
<!-- Content Start -->

<!--Card  -->
<div id="content">
	<div class="card-pattern">
		<!-- blog -->
		<div id="blog">
			<div class="clr">
				<div class="top-bg1">
					<div class="top-left">
						<div><h1>Blog</h1></div>
					</div> 
				</div>
				<div class="clr">
					<div class="pat-bottomleft">&nbsp;</div>
					<div class="pat-bottomright">&nbsp;</div>
				</div>
			</div>
			<div class="blog-top">	
				<div class="clr">
					<div class="left">
						<!-- Blog Posts -->

						<cfoutput>				
						<cfloop array="#blogPosts#" index="blogPost">
							<!--- <cfdump var="#blogPost#" > <cfabort>	 --->
							<!-- Start Blog Post -->
							<h5>
								<span>#dateFormat(blogPost.datePosted,"mm/dd/yyyy")# </span>
							</h5>
							<h2>
								<a href="blogpost.cfm?id=#blogpost.id#">#blogPost.title#</a>
							</h2>
							<p>#blogPost.summary#</p>
							<p class="summary">
								<strong>Categories:</strong> #blogPost.CategoryNames# <strong>Comments:</strong> #arrayLen(blogPost.getComments())#
							</p>
							<!-- End Blog Post -->
						</cfloop>
						</cfoutput>
					</div>
					<div class="right" >
						<h2>Categories</h2>
						<!-- Blog Categories -->
						<div id="categories" align="center">
							<ul>
							<cfoutput>
							<cfset categories = EntityLoad('blogCategory')>
							<cfloop array="#categories#" index="category">
								<li><a href="##">#category.name#</a></li>
							</cfloop>
							</cfoutput>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="clr"></div>
		</div> <!--blog end -->
</layout:page>