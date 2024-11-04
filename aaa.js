const i = document.querySelectorAll("#i")[0];
      chrome.tabs.getCurrent(function(tab){
        i.innerHTML = tab.id+"hello";
      });
