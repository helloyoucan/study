<script>
  import { onMount, onDestroy, beforeUpdate, afterUpdate, tick } from "svelte";
  onMount(() => {
    console.log("onMount");

    return () => {
      console.log("若在onMount返回函数，则会在组件销毁时调用。");
    };
  });
  const interval = setInterval(() => {}, 1000);

  onDestroy(() => clearInterval(interval));

  beforeUpdate(() => {
    // determine whether we should auto-scroll
    // once the DOM is updated...
    console.log("DOM更新前");
  });

  afterUpdate(() => {
    // ...the DOM is now in sync with the data
    console.log("DOM已更新");
  });
  let msg = "";
  msg = "hello";
  console.log("DOM未更新");
  tick().then(() => {
    console.log("DOM更新了");
  });
  // 或者这样使用
</script>

{msg}
<h2>生命周期函数（需要在初始化时执行，不可在回调函数执行）</h2>
除了onDestroy,生命周期函数不会在SSR是执行
<p>onMount</p>
<p>onDestroy</p>
<p>beforeUpdate和afterUpdate（初次挂载（onMount）也会执行）</p>
<p>
  tick(可以随时调用，不必在初始化或顶层执行，return
  promise),类似vue的$nextTIck。 在下次 DOM
  更新循环结束之后执行延迟回调。在修改数据之后立即使用这个方法，获取更新后的
  DOM。
</p>
