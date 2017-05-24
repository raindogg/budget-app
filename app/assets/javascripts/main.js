$(document).ready( function() {
  var entry_forms = document.querySelectorAll('.entry-forms')
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

  if(window.location.pathname === "/goals") {
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
})