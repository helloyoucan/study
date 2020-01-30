<script>
  import Inner from "./Inner.svelte";
  import { createEventDispatcher } from "svelte";
  const dispatch = createEventDispatcher();
  function forWard(event) {
    dispatch("message", event.detail);
  }
</script>
<p>手动向父组件传递事件（组件事件冒泡需要手动执行）</p>
<Inner on:message={forWard} />

<p>指令没有绑定值时，表示转发（冒泡）所以message事件</p>
<Inner on:message/>