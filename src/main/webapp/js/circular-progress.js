let progressBar1 = document.querySelector(".circular-progress1");
let valueContainer1 = document.querySelector(".value-container1");
let progressBar2 = document.querySelector(".circular-progress2");
let valueContainer2 = document.querySelector(".value-container2");
let progressBar3 = document.querySelector(".circular-progress3");
let valueContainer3 = document.querySelector(".value-container3");

let progressValue1 = 0;
let progressValue2 = 0;
let progressValue3 = 0;
let progressEndValue1 = 95
let progressEndValue2 = 75
let progressEndValue3 = 10
let speed = 10;

let progress3 = setInterval(() => {
  progressValue3++;
  valueContainer3.textContent = `${progressValue3}%`;
  progressBar3.style.background = `conic-gradient(
      #6C4AB6 ${progressValue3 * 3.6}deg,
      #DEDCEE ${progressValue3 * 3.6}deg
  )`;
  if (progressValue3 == progressEndValue3) {
    clearInterval(progress3);
  }
}, speed);
let progress1 = setInterval(() => {
  progressValue1++;
  valueContainer1.textContent = `${progressValue1}%`;
  progressBar1.style.background = `conic-gradient(
      #6C4AB6 ${progressValue1 * 3.6}deg,
      #DEDCEE ${progressValue1 * 3.6}deg
  )`;
  if (progressValue1 == progressEndValue1) {
    clearInterval(progress1);
  }1
}, speed);
let progress2 = setInterval(() => {
  progressValue2++;
  valueContainer2.textContent = `${progressValue2}%`;
  progressBar2.style.background = `conic-gradient(
    #6C4AB6 ${progressValue2 * 3.6}deg,
    #DEDCEE ${progressValue2 * 3.6}deg
    )`;
    if (progressValue2 == progressEndValue2) {
      clearInterval(progress2);
 }1
}, speed);


let valueDisplays = document.querySelectorAll(".num");
let interval = 4000;

valueDisplays.forEach((valueDisplay) => {
  let startValue = 0;
  let endValue = parseInt(valueDisplay.getAttribute("data-val"));
  let duration = Math.floor(interval / endValue);
  let counter = setInterval(function () {
    startValue += 1;
    valueDisplay.textContent = startValue;
    if (startValue == endValue) {
      clearInterval(counter);
    }
  }, duration);
});
