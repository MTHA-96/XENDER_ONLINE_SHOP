var mainImg = document.getElementById('mainImage');
var smalling = document.getElementsByClassName('sub_one');

smalling[0].onclick = function(){
	mainImg.src = smalling[0].src;
}

smalling[1].onclick = function(){
	mainImg.src = smalling[1].src;
}

smalling[2].onclick = function(){
	mainImg.src = smalling[2].src;
}
smalling[3].onclick = function(){
	mainImg.src = smalling[3].src;
}