<%@ Control Language="C#" EnableViewState="False" Inherits="BlogEngine.Core.Web.Controls.CommentViewBase" %>
<%@ Import Namespace="BlogEngine.Core" %>

<div id="id_<%=Comment.Id %>" class="CommentArea<%= Post.Author.Equals(Comment.Author, StringComparison.OrdinalIgnoreCase) ? "Owner" : "" %>">
    <p class="author">
        <%= Comment.Website != null ? "<a title=\"" + Comment.Author + "\" rel=\"nofollow\" href=\"" + Comment.Website + "\">" + Comment.Author + "</a>" : Comment.Author %> <%= Flag %> said: <img class="CommentArrow" src="<%=Utils.AbsoluteWebRoot %>themes/<%=BlogSettings.Instance.Theme %>/img/spacer.gif" alt=" " align="bottom" style="border-width:0px;" />
    </p>
    <div class="CommentText">
        <div class="CommentText2">
            <div class="CommentText3">
                <p class="gravatar"><%= Gravatar(80)%></p>
                <p class="content"><%= Text %></p>
            </div>
        </div>
    </div>
    <div class="CommentFooter">
        <a href="<%=Post.RelativeLink %>#id_<%=Comment.Id %>">#</a> <%= Comment.DateCreated.ToString("MMMM dd yyyy, HH:mm", System.Globalization.CultureInfo.CurrentCulture)%> <%= AdminLinks %>
    </div>
</div>