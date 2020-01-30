<script>
  import { longpress } from "./longpress.js";

  let pressed = false;
  let duration = 2000;
</script>

<h2>使用Action中的指令use函数时传递参数</h2>
<label>
  <input type="range" bind:value={duration} max={2000} step={100} />
  {duration}ms
</label>

<button
  use:longpress={duration}
  on:longpress={() => (pressed = true)}
  on:mouseenter={() => (pressed = false)}>
  press and hold
</button>

{#if pressed}
  <p>congratulations, you pressed and held for {duration}ms</p>
{/if}
