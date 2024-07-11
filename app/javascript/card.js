const pay = () => {
  const form = document.getElementById('button')
  form.addEventListener("submit", (e) => {
    console.log("フォーム送信時にイベント発火")
  });
};

window.addEventListener("turbo:load", pay);