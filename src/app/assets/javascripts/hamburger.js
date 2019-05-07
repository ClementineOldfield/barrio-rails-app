window.onload = function() {
  var button = document.getElementById('hamburger');
  button.addEventListener('click', function(e) {
    e.currentTarget.classList.toggle('on');
  });

  var dropdownButton = document.getElementById('dropdown-button')
  var dropdownContent = document.getElementById('dropdown-content');
  dropdownButton.addEventListener('click', function() {
    dropdownContent.classList.toggle('on');
  });
};


