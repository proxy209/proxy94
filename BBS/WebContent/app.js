const navSlide =()=>{
    const burger = document.querySelector('.burger');
    const nav = document.querySelector('.nav-links');
    const navLinks = document.querySelectorAll('.nav-links li');
    burger.addEventListener('click',()=>{
        
        nav.classList.toggle('nav-active');
        
        navLinks.forEach((link, index)=>{
        if(link.style.animation){
            link.style.animation=''
            
        }else{
            
        link.style.animation=`navLinkFade 0.5s ease forwards ${index / 6+0.6}s`;
            
        }
    });
        
      burger.classList.toggle('toggle');
             
    });

}
navSlide();





const Slide=document.querySelector('.main-slide');
const Slideimg=document.querySelectorAll('.main-slide img');

const prveBtn=document.querySelector('#prevBtn');
const nextBtn=document.querySelector('#nextBtn');

let counter = 0;
const size = Slideimg[0].clientWidth;

Slide.style.transform='translateX(' +(-size * counter) + 'px)';


nextBtn.addEventListener('click',()=>{
    if(counter>=Slideimg.length-1) return;
    Slide.style.transition="transform 0.4s ease-in-out";
    counter++;
    Slide.style.transform='translateX(' +(-size * counter) + 'px)';
});


prveBtn.addEventListener('click',()=>{
    if(counter<=0) return;
    Slide.style.transition="transform 0.4s ease-in-out";
    counter--;
    Slide.style.transform='translateX(' +(-size * counter) + 'px)';
});


Slide.addEventListener('transitionend', ()=>{
    if(Slideimg[counter].id === 'lastClone'){
        Slide.style.transition = "none";
        Slide.style.transform='translateX(' +(-size * counter) + 'px)';
    }
     if(Slideimg[counter].id === 'firstClone'){
        Slide.style.transition = "none";
        Slide.style.transform='translateX(' +(-size * counter) + 'px)';
    }
    
});

   
