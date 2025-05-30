//window.document.body.style.background = "#000";

let link = document.createElement('link');
// set the attributes for link element
link.rel = 'stylesheet';
link.type = 'text/css';
link.href = 'https://raw.githubusercontent.com/DELTADRON/tst/refs/heads/main/i.css';
// Get HTML head element to append
// link element to it
document.getElementsByTagName('HEAD')[0].appendChild(link);

//window.document.querySelectorAll('div').forEach(el => {
//  if (el.style.background==="#ffffff") el.style.background="#000";
//})
