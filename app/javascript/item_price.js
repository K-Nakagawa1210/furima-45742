const price = () => {
  // 価格入力欄と表示要素を取得
  const priceInput = document.getElementById("item-price");
  const feeEl = document.getElementById("add-tax-price");
  const profitEl = document.getElementById("profit");

  // フォームが存在しない場合は終了
  if (!priceInput || !feeEl || !profitEl) return;

  // 入力時に計算して表示
  priceInput.addEventListener("input", () => {
    // 入力値を数字に変換
    const val = priceInput.value.replace(/,/g, "");
    const price = Number(val);

    // 価格が無効、もしくは範囲外の場合は空欄表示
    if (isNaN(price) || price < 300 || price > 9999999) {
      feeEl.textContent = "";
      profitEl.textContent = "";
      return;
    }

    // 手数料と利益を計算（小数点以下切り捨て）
    const fee = Math.floor(price * 0.10);
    const profit = Math.floor(price - fee);

    // HTMLに反映
    feeEl.textContent = fee.toLocaleString();      // 3桁区切り表示
    profitEl.textContent = profit.toLocaleString();
  });
};

// ページ初回ロードと render 両方で発火
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);