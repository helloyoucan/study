<script>
  import { count } from "../stores/index.js";

  function handleClick() {
    count.update(val => {
      return val + 1;
    });
    count.set(59);
  }
</script>

<button on:click={handleClick}>+</button>
