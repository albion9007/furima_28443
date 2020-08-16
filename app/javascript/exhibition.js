window.addEventListener('load', function(){

  const pricefield = document.getElementById("item-price")

  pricefield.addEventListener('keyup', function() {
    // value = 
    const pricefield = this.value;
    const taxfield = pricefield * 0.1;
    const profitfield = pricefield - taxfield;
    const addTaxfield = document.getElementById("add-tax-price")
    const addProfitfield = document.getElementById("profit")
    addTaxfield.innerHTML = taxfield
    addProfitfield.innerHTML = profitfield
  })
})


$(function () {
  $(document).on("mouseover", "h1", function () {
  }).on("mouseout", "h1", function () {
  })
});