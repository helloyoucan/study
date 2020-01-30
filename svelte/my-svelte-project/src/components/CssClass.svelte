<script>
  let current = "foo";
  let big = false;
</script>

<style>
  button {
    display: block;
  }
  .active {
    background-color: #ff3e00;
    color: white;
  }
  .big {
    font-size: 4em;
  }
</style>

<button
  class={current === 'foo' ? 'active' : ''}
  on:click={() => (current = 'foo')}>
  foo
</button>
<button
  class={current === 'bar' ? 'active' : ''}
  on:click={() => (current = 'bar')}>
  foo
</button>
<p>若控制class的属性名和css class一致，则可以:使用指令值的方式</p>

<label>
  <input type="checkbox" bind:checked={big} />
  big
</label>

<div class:big>some {big ? 'big' : 'small'} text</div>
