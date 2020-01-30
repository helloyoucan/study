<script>
  let promise = getRandomNumber();
  async function getRandomNumber() {
    await new Promise((resolve, reject) => {
      setTimeout(() => {
        const num = parseInt(Math.random() * 10, 10);
        if (num > 5) {
          resolve();
        } else {
          reject(num);
        }
      }, 2000);
    });
    return 555;
  }
  function handleClick() {
    promise = getRandomNumber();
  }
</script>

<button on:click={handleClick}>generate random number</button>
{#await promise}
  <p>waiting</p>
{:then num}
  <p>num({num})>5</p>
{:catch error}
  <p>{error}</p>
{/await}
省略的写法
{#await promise then value}
	<p>the value is {value}</p>
{/await}
