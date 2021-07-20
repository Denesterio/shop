<template>
  <div class="not-found">
    <span class="status">404</span>
    <br />
    <span class="message text-muted">cтраница не найдена...</span>
  </div>
</template>

<style scoped>
.not-found {
  margin: 100px auto;
  width: 25vw;
  height: 25vh;
  text-align: center;
}
.status {
  font-size: 4rem;
  font-family: "BERNIER", "Nunito", "verdana", serif;
  /* Шрифт в navbar-component */
  color: #3490dc;
}
.message {
  font-size: 1.2rem;
  font-style: italic;
  font-weight: lighter;
}
</style>