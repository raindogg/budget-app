$(document).ready( function() {
    var showButtons = document.querySelectorAll('.show-form');
    var hideButton = document.querySelector('.hide-form');
    var allForms = document.querySelectorAll('.entry-form');
    var input = document.querySelector('.input-file');
    var detailButtons = document.querySelectorAll('.show-details');
    var hideDetailsButtons = document.querySelectorAll('.hide-details');

    var location = window.location.pathname;
    if(location.match(/months\/\d/g) != null){
      setUpDisplay();
    }


  function setUpDisplay() {
    showButtons.forEach(function(button) {
      button.addEventListener('click', displayForm);
    });
    detailButtons.forEach(function(button) {
      button.addEventListener('click', showDetails);
    })
    hideDetailsButtons.forEach(function(button) {
      button.addEventListener('click', hideDetails);
    })

    if(hideButton) {
      hideButton.addEventListener('click', hideForms);
      input.addEventListener('change', inputStyle);
    }
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

  function showDetails() {
    var catRow = this.parentElement;
    var otherCats = document.querySelectorAll('.expense-category');
    var hideButton = catRow.querySelector('.hide-details');
    var otherHideButtons = document.querySelectorAll('.hide-details');
    
    otherCats.forEach(function(box) {
      box.style = "flex:1";
      box.querySelector('.category-details').style = "display:none";
    })
    catRow.querySelector('.category-details').style = "display:inline-block";
    catRow.style = "flex:5";
    this.style = "display:none";
    hideButton.style = "display:inline-block";
  }

  function hideDetails() {
    var catRow = this.parentElement;
    var showButton = catRow.querySelector('.show-details');
    catRow.style = "flex:1";
    showButton.style = "display:inline-block";
    catRow.querySelector('.category-details').style = "display:none";
    this.style = "display:none";
  }

  function inputStyle() {
    document.querySelector('.form-label').innerHTML = this.files[0].name;
  }

})
