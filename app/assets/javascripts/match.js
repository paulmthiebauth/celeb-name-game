function shuffle(o){
for(var j, x, i = o.length; i; j = Math.floor(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x);
return o;
};

$(document).ready(function() {
  $('[data-movie-buttond="details"]').on('submit', function(event) {
    event.preventDefault();
    //  $form = $(event.currentTarget);
    //  var imdbid  = $form.attr('action').split("/")[2];
    //  var resturl = "http://www.omdbapi.com/?i=tt"+imdbid+"&plot=short&r=json";
    var movie = $(this).attr('action');

     var getMovie = $.ajax({
     type: "GET",
     url: movie,
     dataType: 'json',
    //  success: function(data){
    //  $('#movienav').fadeToggle();
     //
    //  var hash = {}
    //  var title = data["Title"];
    //  var actors = shuffle((data["Actors"]).split(","));
    //  debugger;
    //  $("#moviecontents").append(title + "<br>")
    //  $("#moviecontents").append(actors)
  //  }
   });
   getMovie.done(function(result){
     debugger;
   });
   return false;
   });
});





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
