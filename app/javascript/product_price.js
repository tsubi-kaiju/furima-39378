window.addEventListener("load",function(){
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const salesCommission = 0.1
    addTaxDom.innerHTML = Math.floor(inputValue * salesCommission).toLocaleString();
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(inputValue * (1 - salesCommission)).toLocaleString();
  })
})