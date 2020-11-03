const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    const chargeForm = document.getElementById("charge-form");
  chargeForm.addEventListener("submit",(e) => {
    e.preventDefault();

    const formData = new FormData(document.getElementById("charge-form"));

    const card = {
      number: formData.get("number"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
      cvc: formData.get("cvc")
    };
    Payjp.createToken(card,(status,response ) => {
      if (status == 200) {
       const token = response.id;
       const dom = document.getElementById("charge-form");
       const tokenObj = `<input value=${token} name='token' type="hidden">`;
       dom.insertAdjacentHTML("beforeend",tokenObj);
      }
      
      document.getElementById("card-number").removeAttribute("number");
      document.getElementById("card-exp-month").removeAttribute("exp_month");
      document.getElementById("card-exp-year").removeAttribute("exp_year");
      document.getElementById("card-cvc").removeAttribute("cvc");

      document.getElementById("charge-form").submit();
    });
  });
};
window.addEventListener("load", pay);