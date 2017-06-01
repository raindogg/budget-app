$(document).on("turbolinks:load", function() {
  setUpJavascript();
})

var setUpJavascript = function() {
  // Month scripts 
    var showButtons = document.querySelectorAll('.show-form');
    var hideButton = document.querySelector('.hide-form');
    var allForms = document.querySelectorAll('.entry-form');
    var input = document.querySelector('.input-file');
    var detailButtons = document.querySelectorAll('.show-details');
    var hideDetailsButtons = document.querySelectorAll('.hide-details');
    var modal = document.querySelector("#modal");
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
    modal.style = "display:block";
    var catModal = document.querySelector("#modal-" + this.dataset.cat);
    catModal.style = "display:block;";
  }

  function hideDetails() {
    var catModal = this.parentElement.parentElement;
    catModal.style = "display:none";
    modal.style = "display:none";
  }

  function inputStyle() {
    document.querySelector('.form-label').innerHTML = this.files[0].name;
  }


  // Import scripts 

  var entry_forms = document.querySelectorAll('.entry-forms');
  if(entry_forms.length > 0) {
    handleEntries(entry_forms);
  }

function addEntry() {
  var entry = this.parentNode.parentNode;
  var name = entry.querySelector('input#name').value;
  var amount = entry.querySelector('input#amount').value;
  var category = entry.querySelector('select.categories').value;
  var month = entry.querySelector('input#month_id').value;

  $.ajax({
    type: "POST",
    contentType: "application/json; charset=utf-8",
    url: "/entries_bulk",
    dataType: "json",
    data: JSON.stringify({name: name, amount: amount, category_id: category, month_id: month}),
    success: function (result) {
      console.log("Success!");
      entry.innerHTML = "Saved!";
      entry.parentNode.style = "opacity:0";
      setTimeout(function() {
        entry.parentNode.style = "display:none";
      }, 1500);

    },
    error: function() {
      console.log("You fucked up");
    }
  });
}
  function deleteEntry() {
    var entryForm = this.parentNode.parentNode.parentNode;
    entryForm.style = "opacity:0";
    setTimeout(function() {
      entryForm.style = "display:none";
    }, 700);
  }
  
  function handleEntries(entries) {
    entries.forEach(function(entry) {
      var submit = entry.querySelector('.entry-form-submit');
      var close = entry.querySelector('.delete-entry');
      submit.addEventListener('click', addEntry);
      close.addEventListener('click', deleteEntry);
    })
  }

  // Goal scripts 

  if(location === "/goals") {
    var editButtons = document.querySelectorAll('.edit-goal');
    var saveGoals = document.querySelectorAll('.save-goal');
    var cancelGoals = document.querySelectorAll('.cancel-goal');

    editButtons.forEach(function(button) {
      button.addEventListener('click', editGoal);
    });

    saveGoals.forEach(function(button) {
      button.addEventListener('click', saveGoal);
    });

    cancelGoals.forEach(function(button) {
      button.addEventListener('click', cancelGoal);
    });

    function editGoal() {
      this.classList.add('hidden');
      var goalHolder = this.parentElement.parentElement;
      goalHolder.querySelector('.goal-form').classList.remove('hidden');
    }

    function saveGoal() {
      var goalHolder = this.parentElement.parentElement;
      var goalId = goalHolder.querySelector('.goal-id').innerHTML;
      var amount = goalHolder.querySelector('.new-goal').value;
      var errorSpace = goalHolder.querySelector('.error-message');
      var goalSpace = goalHolder.querySelector('.goal-button');

      if(!amount.match(/[^\d.]/)) {
        $.ajax({
          type: "PATCH",
          contentType: "application/json; charset=utf-8",
          url: "/goals/" + goalId + "/edit",
          dataType: "json",
          data: JSON.stringify({amount: amount}),
          success: function (result) {
            console.log("Success!");
            goalSpace.classList.remove('hidden');
            goalHolder.querySelector('.goal-form').classList.add('hidden');
            goalSpace.innerHTML = numberToCurrency(amount);
          },
          error: function() {
            console.log("You fucked up");
          }
        });
      } else {
        errorSpace.innerHTML = "Please enter a numerical value. (No dollar signs)";
        setTimeout(function() {
          errorSpace.innerHTML = '';
        }, 2000);
      }
    }

    function cancelGoal() {
      this.parentElement.classList.add('hidden');
      var goalHolder = this.parentElement.parentElement;
      goalHolder.querySelector('.edit-goal').classList.remove('hidden');
    }
  }
}