$.setupJMPopups({
    screenLockerBackground: "#6D6B6B",
    screenLockerOpacity: "0.7"
});

function openReservePopup(id,type) {
    $.openPopupLayer({
        name: "reservePopup",
        // width: 550,
        // target: "reservePopupDiv" 
        url: "/products/"+id+"/reserve?t="+type
    });
}