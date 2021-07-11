import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  const banner = document.getElementById("banner-typed-text");

  if (banner) {
    new Typed('#banner-typed-text', {
      strings: ["Locawidz"],
      typeSpeed: 80,
      loop: false
    });
  }
}

export { loadDynamicBannerText };
