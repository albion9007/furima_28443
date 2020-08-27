const pay = () => {
  var cardInfo = function(){
    document.getElementById("card-number").removeAttribute("name");
    document.getElementById("card-cvc").removeAttribute("name");
    document.getElementById("card-exp-month").removeAttribute("name");
    document.getElementById("card-exp-year").removeAttribute("name");
    document.getElementById("charge-form").submit();
    document.getElementById("charge-form").reset();
  }
  Payjp.setPublicKey("pk_test_f46c281a58254b2e6e8a78f0");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("buy_address[number]"),
      cvc: formData.get("buy_address[cvc]"),
      exp_month: formData.get("buy_address[exp_month]"),
      exp_year: `20${formData.get("buy_address[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        console.log(renderDom.get);
        cardInfo();
      } else {
        cardInfo();
      }
    });
  });
};
window.addEventListener("load", pay);
