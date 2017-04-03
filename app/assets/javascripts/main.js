$(document).ready( function() {
  var entry_forms = document.querySelectorAll('.entry-forms')
  if(entry_forms.length > 0) {
    handleEntries(entry_forms);
  }
})

function handleEntries(entries) {
  entries.forEach(function(entry) {
    var submit = entry.querySelector('.entry-form-submit');
    submit.addEventListener('click', addEntry);
  })
}

function addEntry() {
  var entry = this.parentNode;
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

    },
    error: function() {
      console.log("You fucked up");
    }
  });
}