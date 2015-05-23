function shuffle(o){
for(var j, x, i = o.length; i; j = Math.floor(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x);
return o;
};

$(document).ready(function() {
  $('[data-movie-buttond="details"]').on('submit', function(event) {
    event.preventDefault();
    var movie = $(this).attr('action');

     var getMovie = $.ajax({
     type: "GET",

     url: movie,
     dataType: 'json',
   });
   getMovie.done(function(result){
     $('#movienav').fadeToggle();
     appendHTMLImages(result);
   });
   return false;
   });
});



function appendHTMLImages(result) {
  var infoHTML = [];
  infoHTML.push("<div class='match-page'>");
  infoHTML.push("<form class='new_pick' id='new_pick' action='/picks' accept-charset='UTF-8' method='post'>");
  infoHTML.push("<input name='utf8' type='hidden' value='✓'>");
  infoHTML.push("<input type='hidden' name='authenticity_token' value='HCVA9trz9QBwPzauflDYIkqDm2LEaJ/wdR/oOKGLJ3YIqRXHArXM2mzutUElhnLqLqTW0jzmF1XsezB/x61VKQ=='>");
  for (var i = 0; i< result.names.length; i++ ){
  infoHTML.push("<div class='small-2 columns'");
  infoHTML.push("<div class='actor-image'>");
  infoHTML.push("" + (i + 1) + " <img src='" + result.images[result.names[i]] + "'>");
  infoHTML.push("</div>");
  infoHTML.push("</div>");
  };
  infoHTML.push("</form>");
  infoHTML.push("</div>");

 $("#moviecontents").append(infoHTML.join(''));

 }

 // <div class="match-page">
 //
 // <%= form_for @picks do |f| %>
 //   <% image_counter = 1 %>
 //   <% name_image_hash = {} %>
 //   <div class="row">
 //     <% @actor_and_image.each do |name, image| %>
 //       <div class="small-2 columns">
 //         <div class="actor-image">
 //           <%= image_counter %>
 //           <% name_image_hash[name] = image_counter %>
 //           <img src="<%= image %>" height="100" width="100">
 //         </div>
 //       </div>
 //       <% image_counter += 1 %>
 //     <% end %>
 //   </div>
 //
 //   <div class="row">
 //     <% @actor_and_index.each do |name, index| %>
 //       <div class="small-2 columns">
 //         <%= name %><br>
 //         <% index += 1 %>
 //         <%= f.text_field "pick_number#{index}" %>
 //         <%= hidden_field_tag "user_guess#{index}", name_image_hash[name] %>
 //       </div>
 //     <% end %>
 //   </div>
 //   <%= hidden_field_tag 'movie_id', params[:id] %>
 //   <%= f.submit "Sign up" %>
 // <% end %>
 //
 // </div>
