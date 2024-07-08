window.addEventListener('turbo:load', () => {


const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  const fee = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = fee;

  const addTaxProf = document.getElementById("profit");
  const fii = Math.floor(inputValue * 0.9);
  addTaxProf.innerHTML = fii;

})

});