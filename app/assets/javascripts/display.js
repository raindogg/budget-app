$(document).ready( function() {
    var showButtons = document.querySelectorAll('.show-form');
    var hideButton = document.querySelector('.hide-form');
    var allForms = document.querySelectorAll('.entry-form');
    var input = document.querySelector('.input-file');
    var detailButtons = document.querySelectorAll('.show-details');

    var location = window.location.pathname;
    if(location.match(/months\/\d/g) != null){
      setUpDisplay();
      input.addEventListener('change', inputStyle);
    }


  function setUpDisplay() {
    showButtons.forEach(function(button) {
      button.addEventListener('click', displayForm);
    });
    detailButtons.forEach(function(button) {
      button.addEventListener('click', showDetails);
    })


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

  function showDetails() {
    var catRow = this.parentElement;
    var otherCats = document.querySelectorAll('.expense-category');
    otherCats.forEach(function(box) {
      box.style = "flex:1";
      box.querySelector('.category-details').style = "display:none";
    })
    catRow.querySelector('.category-details').style = "display:inline-block";
    catRow.style = "flex:5";
  }

  function inputStyle() {
    document.querySelector('.form-label').innerHTML = this.files[0].name;
  }

})
