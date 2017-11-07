$(function() {

  var directories = [
    "rain",
    "terrain"
  ];

  var holder = $(document.createDocumentFragment());
  directories.forEach((d) => {
    var li = $('<li>');
    var a = $('<a>');
    var h1 = $('<h1>');
    var img = $('<img>');

    h1.html(d);
    a.attr("href", d + '/');
    img.attr("src", a.attr("href") + d + ".gif");
    a.append(h1, img);
    li.append(a);

    holder.append(li);
  })

  $('.showcase').append(holder);

});