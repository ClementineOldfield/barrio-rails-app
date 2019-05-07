window.onload = function() {
  let button = document.getElementById('dropdown-button')
  let dropdown = document.getElementById('dropdown-content');
  button.addEventListener('click', function(e) {
    dropdown.classList.toggle('on');
  });
};
