const buildHTML = (XHR) => {
  const item = XHR.response.message;
  const html = `
  <div class="message-set"> 
    <div class="message-name">
      ${item.user_nickname}
    </div>
    <div class="message-date">
      ${item.created_at.slice(0,19)}
    </div>
  </div>
  <div class="message">
    ${item.text}
  </div>`;
  return html;
};

function post (){
  const submit = document.getElementById("chat-submit-btn");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("message-form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/messages", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const list = document.getElementById("list");
      const formText = document.getElementById("message_text");
      list.insertAdjacentHTML("afterend", buildHTML(XHR));
      formText.value = "";
    };
  });

 };
 
 window.addEventListener('load', post);