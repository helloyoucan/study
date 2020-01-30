<script>
  import Inner from "./Inner.svelte";
  import Other from "./Other.svelte";
  import FancyButton from "./FancyButton.svelte";
  let m = { x: 0, y: 0 };

  function handleMousemove(event) {
    m.x = event.clientX;
    m.y = event.clientY;
  }
  function handleClickOnce() {
    alert("no more alerts");
  }
  /**
   * 绑定到子组件的事件
   */
  function handleMessage(event) {
    alert(event.detail.text);
  }
  function handleClick() {
    alert("clicked");
  }
</script>

<style>
  div {
    width: 100%;
    height: 200px;
  }
</style>

<div on:mousemove={handleMousemove}>The mouse position is {m.x} x {m.y}</div>
内联处理事件（引号是可选的）
<div on:mousemove={e => (m = { x: e.clientX, y: e.clientY })}>
  The mouse position is {m.x} x {m.y}
</div>
<p>事件修饰器</p>
<button on:click|once|self={handleClickOnce}>click me</button>
<p>
  preventDefault(阻止默认事件)|stopPropagation（阻止事件冒泡）|passive（改进触摸、滚动事件性能，svelte在安全的地方会自动添加）|capture（捕获节点处理）|once（执行一次）|self（自身触发）
</p>
<Inner on:message={handleMessage} />
<Other on:message={handleMessage} />
<FancyButton on:click={handleClick}/>