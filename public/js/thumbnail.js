function swapImage(thumbnail) 
{
    let mainImage = document.getElementById('mainImage');
    let tempSrc = mainImage.src;
    mainImage.src = thumbnail.src;
    thumbnail.src = tempSrc;
}