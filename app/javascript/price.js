function money(){
  
  const price = document.getElementById("item-price")
  const add_tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  
  price.addEventListener('input', () => {
    const value = price.value
         
    if (value >= 300 && value <= 9999999){
      let fee = value * 0.1
      let gains = value - fee
      add_tax.textContent = fee
      profit.textContent = gains
    } else {
      let fee = '0'
      let gains = '0'
      add_tax.textContent = fee
      profit.textContent = gains
    }
  })
  
}

window.addEventListener('load', money)