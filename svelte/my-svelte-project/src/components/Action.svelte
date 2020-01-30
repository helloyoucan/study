<script>
  import { spring } from "svelte/motion";
  import { pannable } from "./pannable.js";
  const coords = spring(
    { x: 0, y: 0 },
    {
      stiffness: 0.2,
      damping: 0.4
    }
  );

  function handlePanStart() {
    coords.stiffness = coords.damping = 1;
  }

  function handlePanMove(event) {
    coords.update($coords => ({
      x: $coords.x + event.detail.dx,
      y: $coords.y + event.detail.dy
    }));
  }

  function handlePanEnd(event) {
    coords.stiffness = 0.2;
    coords.damping = 0.4;
    coords.set({ x: 0, y: 0 });
  }
</script>

<style>
  .c {
    position: relative;
    height: 400px;
  }
  .box {
    --width: 100px;
    --height: 100px;
    position: absolute;
    width: var(--width);
    height: var(--height);
    left: calc(50% - var(--width) / 2);
    top: calc(50% - var(--height) / 2);
    border-radius: 4px;
    background-color: #ff3e00;
    cursor: move;
  }
</style>

<h2>使用Action提供的指令use</h2>
<p>Action本质上是元素的生命周期功能。可用于：</p>
<p>与第三方库对接</p>
<p>延迟加载图片</p>
<p>工具提示</p>
<p>添加自定义事件处理程序</p>
<div class="c">
  <div
    use:pannable
    class="box"
    on:panstart={handlePanStart}
    on:panmove={handlePanMove}
    on:panend={handlePanEnd}
    style="transform: translate({$coords.x}px,{$coords.y}px) rotate({$coords.x * 0.2}deg)" />
</div>
