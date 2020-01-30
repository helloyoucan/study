<script>
  import { createEventDispatcher } from "svelte";
/**
 * 需要再实例化组件时调用createEventDispatcher
 * 无法在函数内部调用
 */
  const dispath = createEventDispatcher();

  function sayHello() {
    // 触发父组件传递（绑定）到子组件上的事件
    dispath("message", {
      text: "hello!"
    });
  }
</script>

<button on:click={sayHello}>触发父组件绑定到子组件的事件</button>
