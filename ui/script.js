const Container = document.getElementById("container");
document.getElementById("close").addEventListener("click", function(e){
    Container.style.display = "none";
    fetch(`https://${GetParentResourceName()}/close`, {
        method: "POST",
        headers: {
            "Content_type": "application/json; charset=UTF-8"
        },
        body: JSON.stringify({})
    });
})

window.addEventListener("message", function(event){
    let e = event.data;
    if(e.action=="show"){
        Container.style.display = "block";
    }
    if(e.action=="close"){
        Container.style.display = "none";
    }
})