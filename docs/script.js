function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
document.getElementById("listen").addEventListener("click", (e) => {
    e.preventDefault();
    new Audio('pronunciation.mp3').play();
})

var dragTime = 200;

const s1tw = document.getElementById("s1tw")
s1tw.addEventListener('mousemove', (e) => { sleep(dragTime).then(() => {
    const { x, y } = s1tw.getBoundingClientRect();
    s1tw.style.setProperty("--x", e.clientX - x);
    s1tw.style.setProperty("--y", e.clientY - y);
});});
const s1tw2 = document.getElementById("s1tw2")
s1tw2.addEventListener('mousemove', (e) => { sleep(dragTime).then(() => {
    const { x, y } = s1tw2.getBoundingClientRect();
    s1tw2.style.setProperty("--x", e.clientX - x);
    s1tw2.style.setProperty("--y", e.clientY - y);
});});
// s1tw.addEventListener("mouseenter",(e)=>{ s1tw.style.transition="0s"; });
// s1tw.addEventListener("mouseleave",(e)=>{ s1tw.style.transition=".35s"; });
// s1tw2.addEventListener("mouseenter",(e)=>{ s1tw2.style.transition="0s"; });
// s1tw2.addEventListener("mouseleave",(e)=>{ s1tw2.style.transition=".35s"; });
// lol
const var1 = [];