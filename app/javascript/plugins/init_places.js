const list = document.querySelector('#results');


const searchAlgoliaPlaces = (query) => {
  fetch("https://places-dsn.algolia.net/1/places/${query}", {
    method: "POST",
    body: JSON.stringify({ query: event.currentTarget.value })
  })
    .then(response => response.json())
    .then((data) => {
      data.words.forEach((word) => {
        const country = `<li>
          <p>${word}</p>
        </li>`;
        list.insertAdjacentHTML("beforeend", country);
      });
    });
};

const input = document.querySelector(".search");
form.addEventListener("keyup", (event) => {
  event.preventDefault();
  list.innerHTML = "";
  searchAlgoliaPlaces(form.value);
});



// const list = document.querySelector('#results');

// const autoComplete = (query) => {
//   fetch(`https://wagon-dictionary.herokuapp.com/autocomplete/${query}`)
//     .then(response => response.json())
//     .then((data) => {
//       data.words.forEach((word) => {
//         const country = `<li>
//           <p>${word}</p>
//         </li>`;
//         list.insertAdjacentHTML("beforeend", country);
//       });
//     });
// };

// const form = document.querySelector(".search");
// form.addEventListener('keyup', (event) => {
//   event.preventDefault();
//   // results.innerHTML = '';
//   list.innerHTML = "";
//   autoComplete(form.value);
// });


export { searchAlgoliaPlaces };
