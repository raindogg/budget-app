var numberToCurrency = function(number) {
  var digits = number.split('');
  var decimal = digits.indexOf('.');
  var length = digits.length;
  var start;

  decimal !== -1 ? start = digits.indexOf('.') - 1 : start = length - 1;

  var counter = 1;
  for(var i = start; i >= 0; i--) {
    if(counter === 3 && i !== 0) {
      digits.splice(i, 0, ',');
      counter = 1;
    } else {
      counter += 1;
    } 
  }

  if((length - 1) - decimal === 0) {
    return "$" + digits.join('') + "00";
  } else if ((length - 1) - decimal === 1) {
    return "$" + digits.join('') + "0";
  } else if (decimal === -1) {
    return "$" + digits.join('') + ".00";
  } else {
    return "$" + digits.join('');
  }
}