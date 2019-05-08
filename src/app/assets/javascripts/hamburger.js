window.onload = function() {
  var button = document.getElementById('hamburger');
  if(button != null) {
    button.addEventListener('click', function(e) {
      e.currentTarget.classList.toggle('on');
    });
  }

  var dropdownButton = document.getElementById('dropdown-button')
  var dropdownContent = document.getElementById('dropdown-content');
  if(dropdownButton != null) {
    dropdownButton.addEventListener('click', function() {
      dropdownContent.classList.toggle('on');
    });
  }
};


