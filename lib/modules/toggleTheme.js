(() => {
	"use strict";

	const setTheme = (bool) => {
		document.documentElement.setAttribute("dark", bool);
		localStorage.setItem("user:dark", bool);
	}

	const toggleTheme = (e) => {
		const classBtn = e.target;

		e.stopPropagation();

		if (classBtn.className === "off") {
			setTheme(true);
			classBtn.className = "on";
		} else {
			setTheme(false);
			classBtn.className = "off";
		}
	}

	const addButton = () => {
		if (ajaxify.data.loggedIn) {
			const toggleBtn = document.querySelector("#toggle-theme");
			isDark ? toggleBtn.classList.add("on") : toggleBtn.classList.add("off");

			toggleBtn.addEventListener("click", toggleTheme, false);
		} else {
			return null;
		}
	}

	const isDark = JSON.parse(localStorage.getItem("user:dark"));

	localStorage.getItem("user:dark") === null ? setTheme(false) : setTheme(isDark);

	$(window).on("action:ajaxify.end", addButton);
})()