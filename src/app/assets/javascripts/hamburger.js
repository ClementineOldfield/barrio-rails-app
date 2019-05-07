window.onload = function() {
  console.log("test")
  var button = document.getElementById('hamburger');
  button.addEventListener('click', function(e) {
    e.currentTarget.classList.toggle('on');
    console.log("test")
    console.log(button);
  });
};


