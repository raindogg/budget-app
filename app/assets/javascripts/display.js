$(document).ready( function() {
    var showButtons = document.querySelectorAll('.show-form');
    var hideButton = document.querySelector('.hide-form');
    var allForms = document.querySelectorAll('.entry-form');

    var location = window.location.pathname;
    if(location.match(/months\/\d/g) != null){
      setUpDisplay();
    }


  function setUpDisplay() {
    showButtons.forEach(function(button) {
      button.addEventListener('click', displayForm);
    });

    hideButton.addEventListener('click', hideForms);
  }

  function displayForm() {
    var form = "entry-" + this.dataset.name;
    document.querySelector('.' + form).style = "display:inline-block";
    showButtons.forEach(function(button) {
      button.style = "display:none";
    })
    hideButton.style = "display:inline-block";
  }

  function hideForms() {
    allForms.forEach(function(form) {
      form.style = "display:none";
    })
    showButtons.forEach(function(button) {
      button.style = "display:inline-block";
    })
    hideButton.style = "display:none";
  }

})
