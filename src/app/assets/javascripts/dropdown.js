window.onload = function() {
  console.log("test dropdown")
  let dropdownButton = document.getElementById('dropdown-button')
  let dropdownContent = document.getElementById('dropdown-content');
  dropdownButton.addEventListener('click', function(e) {
    dropdownContent.classList.toggle('on');
  });
};
