import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["🪴 Locawidz 🪴"],
    typeSpeed: 70,
    loop: false
  });
}

export { loadDynamicBannerText };
