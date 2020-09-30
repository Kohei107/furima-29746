function price (){
  const item_price = document.getElementById("item-price");
  const add_tax = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  item_price.addEventListener('keyup', () => {
    const value = item_price.value;

    if (value >= 300 && value <= 9999999){
      let fee = value * 0.1
      let gains = value - fee
      add_tax.textContent = fee;
      profit.textContent = gains;
    } else{
      let fee = '-'
      let gains = '-'
      add_tax.textContent = fee;
      profit.textContent = gains;
    }
  });

}
window.addEventListener('load', price);

