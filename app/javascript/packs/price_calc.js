document.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;

  const feeEl = document.getElementById("fee");
  const profitEl = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const val = priceInput.value.replace(/,/g, "");
    const price = Number(val);
    if (Number.isNaN(price) || price <= 0) {
      feeEl.textContent = 0;
      profitEl.textContent = 0;
      return;
    }
    const fee = Math.floor(price * 0.10);
    const profit = price - fee;
    feeEl.textContent = fee;
    profitEl.textContent = profit;
  });
});
