console.log("Library Management System loaded.");
document.addEventListener("DOMContentLoaded", function() {
    var navbarHeight = document.querySelector('.navbar').offsetHeight;
    console.log(navbarHeight)
    document.body.style.paddingTop = navbarHeight + 'px';
});

