				<cfif qpages.recordcount>
					<li class="nav-item"><a class="nav-link home-link hidemoments" href="#" id="home">Home</a></li>
					<cfoutput query="qpages">
  						<li class="nav-item"><a class="nav-link hidemoments pcl" href="##" id="load_#label#" title="#trim(charnews(page_h1))#">#charnews(page_name)#</a></li>
  					</cfoutput>
				</cfif>
				<cfif qmoments.recordcount>
					<cfoutput query="qmoments">
  						<li class="nav-item"><a class="nav-link mcl" href="##" id="toggle_m#numberformat(mkn, "0000000")#"><i class="fa fa-bolt" aria-hidden="true"></i> #charnews(titel)#</a></li>
  					</cfoutput>
				</cfif>