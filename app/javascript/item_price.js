const price = () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  const fee = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = fee;

  const addTaxProf = document.getElementById("profit");
  const fii = ( inputValue - fee );
  addTaxProf.innerHTML = fii;
})
};


window.addEventListener('turbo:load', price) 
window.addEventListener("turbo:render", price)
