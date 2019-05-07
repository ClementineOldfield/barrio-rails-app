window.onload = function() {
  let button = document.getElementById('hamburger');
  button.addEventListener('click', function(e) {
    e.currentTarget.classList.toggle('on');
    console.log(button);
  });
};

