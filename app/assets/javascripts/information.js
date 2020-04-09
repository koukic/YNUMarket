var content = document.getElementById("dropdown-menu2");
var myDIV = document.getElementById("myDIV");
var tabContents = document.getElementsByClassName("tab-content");
console.log('hello');

for (var i = 0; i < tabContents.length; i++) {
  tabContents[i].addEventListener("click", function() {
    var current = document.getElementsByClassName("is-active");
    current[0].className = current[0].className.replace("is-active", "");
    this.className += "is-active";
  });
}
