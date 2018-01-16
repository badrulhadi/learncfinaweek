<cfscript>
	myPortfolio = [];

	arrayAppend(myPortfolio,{
		title='Title 1',
		website='http://www.website1.com',
		image='portfolio1.png',
		description='Lorem ipsum dolor, sit amet consectetur adipisicing elit. Illo aspernatur enim unde iusto? Illo, accusantium repellat maxime, asperiores, tenetur delectus aliquam consequatur dignissimos sapiente voluptas repudiandae nobis? Beatae, provident esse?'});
	arrayAppend(myPortfolio,{
		title='Title 2',
		website='http://www.website2.com',
		image='portfolio2.png',
		description='Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, non vel sit voluptatem soluta, incidunt qui corrupti odit facere exercitationem excepturi culpa neque quibusdam cupiditate, necessitatibus et provident? Illo, totam.'});
	arrayAppend(myPortfolio,{
		title='Title 3',
		website='http://www.website3.com',
		image='portfolio3.png',
		description='Lorem ipsum dolor sit amet consectetur adipisicing elit. Aliquid minima hic fugit aliquam. Voluptatibus, repudiandae sapiente blanditiis et, impedit itaque accusantium voluptas, a inventore amet laboriosam consectetur dolores natus earum.'});

	// writeDump(myPortfolio);
</cfscript>

<cfset section="Portfolio" />
<cfinclude template="includes/header.cfm" />

<!-- Content Start -->

<!--Card  -->
<div id="content">
    <div class="card-pattern">
        <!-- portfolio -->
        <div id="portfolio">
            <div class="clr">
                <div class="top-bg1">
                    <div class="top-left">
                        <div>
                            <h1>Portfolio</h1>
                        </div>
                    </div>
                </div>
                <div class="clr">
                    <div class="pat-bottomleft">&nbsp;</div>
                    <div class="pat-bottomright">&nbsp;</div>
                </div>
            </div>
            <div class="clr">
                <h6>
                    <span> I build great sites
                        <br />
                    </span>Hello, thanks for visiting this section. Here’s a collection of some of my work.
                </h6>
            </div>
            <div class="clr hline">&nbsp;</div>
            <div class="clr">
                <div>
                    <ul id="portfolio-list">
                        <!-- Start Portfolio -->
                        <cfoutput>
                            <cfloop array="#myPortfolio#" index="portfolio">
                                <li>
								<div class="left">
									<a href="#portfolio.website#" title="#portfolio.title#" class="viewDetail ">
										<img src="assets/images/portfolio/portfolio1.png" alt=" " border="0" />
										<h5>#portfolio.title#</h5>
									</a>
								</div>
								<div class="right">
									<p>
										#portfolio.description#
									</p>
								</div>
                                </li>
                            </cfloop>
                        </cfoutput>
                        <!-- End Portfolio -->
                    </ul>
                </div>
                <!-- demowrap end-->
            </div>
            <!-- clr end -->
            <div class="clr"></div>
        </div>
        <!-- portfolio end -->

        <div class="clr"></div>
    </div>
    <!--card pattern end -->
    <div class="clr "></div>
</div>
<!--content end -->

<cfinclude template="includes/footer.cfm" />