document.querySelector("#menu-burger").addEventListener("click", toggleMenu);

function toggleMenu() {
	document.querySelector("#menu").style.display == "flex" ?
		document.querySelector("#menu").style.display = "none" :
		document.querySelector("#menu").style.display = "flex";
}
