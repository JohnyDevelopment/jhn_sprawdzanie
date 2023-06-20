const Container = document.getElementById("container");
const adminek = document.getElementById("kto");
window.addEventListener("message", function(event){
    let e = event.data;
    if(e.action=="show"){
        Container.style.display = "block";
        adminek.textContent = e.admin_name;
    }
    if(e.action=="close"){
        Container.style.display = "none";
    }
})