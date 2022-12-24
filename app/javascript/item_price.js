window.addEventListener('load', function(){
 
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue*0.1)

  const profitTax = document.getElementById("profit");
  profitTax.innerHTML = Math.floor(inputValue*0.9)
})
})