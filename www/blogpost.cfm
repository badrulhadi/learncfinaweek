<cfparam name="form.submitted" default="0" />
<cfset blogPost = EntityLoad('blogPost',url.id,true) />
<cfif form.submitted>
	<cfset comment = entityNew('blogComment') />
	<cfset comment.author = form.contactname />
	<cfset comment.comment = form.comment />
	<cfset comment.createdDateTime = now() />
	<cfset blogPost.addComment(comment) />
	<cfset EntitySave(blogPost) />
</cfif>		

<cfset section = "Blogpost" />
<cfinclude template="includes/header.cfm"/>
		
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
								<cfoutput>
								<!-- Blog Title -->
								<h2 class="big">
									#blogPost.title#
								</h2>
								<!-- Date Published -->
								<h5>
									<strong>Date Posted</strong>: #dateformat(blogPost.dateposted,'mm/dd/yyyy')#
								</h5>
								<!-- Blog Body -->
								<p>
									#blogPost.body#
								</p>
								<!-- Blog Export -->
								<p>
									<a href="ExportToPDF.cfm?id=#blogPost.id#" target="_new"><img src="assets/images/export_pdf.png" border="0"/></a>
								</p>
								<!-- Blog Comments Section -->
								<h3>
									Comments (#arrayLen(blogPost.getComments())#)
								</h3>
								<div class="clr hline">&nbsp;</div>
		
								<div class="clr comments">
									<ul>
										<!-- Start Comment -->
										<cfloop array="#blogPost.getComments()#" index="comment">
										<li>
											<p>
												<strong>Posted On:</strong> #dateFormat(comment.createdDateTime,'mm/dd/yyyy')# 
												at #timeformat(comment.createdDateTime,'short')# AM 
												By #comment.author#
											</p>
											<p>
												#comment.comment#
											</p>
											<div class="clr hline">&nbsp;</div>
										</li>
									</cfloop>
										<!-- End Comment -->
								
									</ul>
								</div>
								<h3>
									Post Comment
								</h3>
								<div class="clr hline">&nbsp;</div>
		
								<div class="clr postComment">
									<form action="blogpost.cfm?id=#blogPost.id#" method="post" id="form">
										<div>
											<label>Name <span class="font-11">(required)</span></label>
											<input name="contactname" type="text" class="required" />
										</div>
										<div class="textarea">
											<label>Comment <span class="font-11">(required)</span></label>				
											<textarea name="comment" rows="6" cols="60" class="required"></textarea>		
										</div>
										<div>
											<input id="submitBtn" value="Submit"  name="submit" type="submit" class="submitBtn" />
										</div>
										<input type="hidden" name="submitted" value="1" />
									</form>
								</div>	
							</cfoutput>							
							</div>
							<div class="right" >
								<h2>Categories</h2>
								<!-- Blog Specific Categories -->
								<div id="categories" align="center">
									<ul>
										<li><a href="#">ColdFusion</a></li>
										<li><a href="#">Development</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="clr"></div>
				</div> <!--blog end -->

				<div class="clr"></div>
			</div><!--card pattern end -->
			<div class="clr "></div>
		</div>		  <!--content end -->	

<cfinclude template="includes/footer.cfm"/>