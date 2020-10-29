window.addEventListener('load', () => {
 const priceInput = document.getElementById("item-price");
 
 priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
   console.log(inputValue);

  // 販売手数料の計算
   const addTaxDom = document.getElementById("add-tax-price");
   const addTaxValue = (Math.floor(inputValue * 0.1));
   addTaxDom.innerHTML = addTaxValue
   Math.floor(addTaxDom);

  // 販売利益の計算
   const profit = document.getElementById("profit");
   const profitValue = (Math.floor(inputValue - (inputValue * 0.1)));
   profit.innerHTML = profitValue
   console.log(profit);
 }); 
});