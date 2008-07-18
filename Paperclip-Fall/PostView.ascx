<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="false" Inherits="BlogEngine.Core.Web.Controls.PostViewBase" %>
<%@ Import Namespace="BlogEngine.Core" %>

    <div class="post xfolkentry">
	    <%if (Request.QueryString.Count == 0 && Request.RawUrl.ToLowerInvariant().EndsWith("/default.aspx")) {%>
        <h5 class="posthead"><a rel="bookmark" href="<%=Post.RelativeLink %>"><%=Server.HtmlEncode(Post.Title) %></a></h5>
	    <%} else {%>
        <h2 class="pageTitle"><%=Server.HtmlEncode(Post.Title) %></h2>
	    <%}%>
	    
        <asp:PlaceHolder ID="BodyContent" runat="server" />

        <div class="postfoot">	
            <span class="em">Posted:</span> <a rel="nofollow" href="<%=Post.RelativeLink %>"><%=Post.DateCreated.ToString("MMM dd yyyy, HH:mm", System.Globalization.CultureInfo.CurrentCulture)%></a> by 
            <a href="<%=VirtualPathUtility.ToAbsolute("~/") + "author/" + Post.Author %>.aspx"><%=Post.Author %></a> | 
            <a rel="nofollow" href="<%=Post.RelativeLink %>#comment"><%=Resources.labels.comments %> (<%=Post.ApprovedComments.Count %>)</a> 
            <a rel="nofollow" href="<%=CommentFeed %>"><img src="<%=VirtualPathUtility.ToAbsolute("~/pics/")%>rssButton.gif" alt="RSS comment feed" style="margin-left:3px" /></a> | 

	        <% if (BlogSettings.Instance.EnableRating) {%>
	        <span class="inline-rating">
	            <ul class="star-rating small-star">
                    <li class="current-rating" style="width:<%=Math.Round((float)(Post.Rating / 5 * 100), 0) %>%">Currently <%=Post.Rating %>/5 Stars.</li>
		            <li><a href="javascript:void(Rate('<%=Post.Id.ToString() %>', 1))" rev="vote-against" title="Poor" class="one-star">1</a></li>
		            <li><a href="javascript:void(Rate('<%=Post.Id.ToString() %>', 2))" rev="vote-against" title="Fair" class="two-stars">2</a></li>
		            <li><a href="javascript:void(Rate('<%=Post.Id.ToString() %>', 3))" rev="vote-abstain" title="Average" class="three-stars">3</a></li>
		            <li><a href="javascript:void(Rate('<%=Post.Id.ToString() %>', 4))" rev="vote-for" title="Good" class="four-stars">4</a></li>
		            <li><a href="javascript:void(Rate('<%=Post.Id.ToString() %>', 5))" rev="vote-for" title="Excellent" class="five-stars">5</a></li>
	            </ul>
	        </span>
            <%}%>
            <div class="em"><span class="em">Filed under:</span> <%=CategoryLinks(" | ") %></div>
            <% if (Page.User.Identity.IsAuthenticated){ %>
                <div class="em"><span class="em">Manage post:</span> <%=AdminLinks %> :)</div>
            <%} %>
            
        </div>
    </div>