window.addEventListener("load",function(){
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  const salesCommissionRate = 0.1
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const salesCommission = Math.floor(inputValue * salesCommissionRate)
    addTaxDom.innerHTML = salesCommission.toLocaleString();
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = (inputValue - salesCommission).toLocaleString();
  })
})