const form = document.getElementById("my-form");
const leftArrow = document.getElementsByClassName("left-arrow").item(0);
const rightArrow = document.getElementsByClassName("right-arrow").item(0);
const currPageNo = document.getElementById("currPageNo");

leftArrow.addEventListener("click", () => {
	currPageNo.setAttribute("value", Number(currPageNo.getAttribute("value")) - 1);
	form.submit();
})

rightArrow.addEventListener("click", () => {
	currPageNo.setAttribute("value", Number(currPageNo.getAttribute("value")) + 1);
	form.submit();
})