window.addEventListener('load', function(){

const inputNumber = document.getElementById("item-price")
const addTaxprice = document.getElementById("add-tax-price")
const addProfit = document.getElementById("profit")

inputNumber.addEventListener('change', function(){

  var price_tax = inputNumber.value;
  var num = price_tax * 0.1
  addTaxprice.innerHTML = num

  var price_profit = inputNumber.value;
  var num2 = price_profit * 0.9
  addProfit.innerHTML = num2
})
})