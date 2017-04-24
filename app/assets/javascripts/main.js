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

})