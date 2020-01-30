<script>
  import { onDestroy } from "svelte";
  import Nested from "./components/Nested.svelte";
  import Info from "./components/Info.svelte";
  import App2 from "./components/App2.svelte";
  import App3 from "./components/App3.svelte";
  import Event from "./components/Event.svelte";
  import Form from "./components/Form.svelte";
  import Form2 from "./components/Form2.svelte";
  import Lifecycle from "./components/Lifecycle.svelte";
  import Stores from "./components/Stores.svelte";
  import Motion from "./components/Motion.svelte";
  import Transitions from "./components/Transitions.svelte";
  import Animations from "./components/Animations.svelte";
  import Action from "./components/Action.svelte";
  import Action2 from "./components/Action2.svelte";
  import CssClass from "./components/CssClass.svelte";
  import Slot from "./components/Slot.svelte";
  import ContextAPI from "./components/ContextAPI.svelte";
  import SpecialElements from "./components/SpecialElements.svelte";
  import ModuleContent from "./components/ModuleContent.svelte";
  import Debugging from "./components/Debugging.svelte";
  import { count as outCount, time, seconds } from "./stores/index.js";
  export let name;
  let xin = "Hello";
  let src =
    "https://pic2.zhimg.com/v2-60d792c2a2106f68fc1ccbd61ddc5bbd_180x120.jpg";
  let string = `<h1>this is html string<h1/>`;
  let count = 0;
  function handleClick() {
    count += 1;
  }
  $: doubled = count * 2; // 计算属性
  $: console.log(`the count is ${count}`); // watch钩子
  $: {
    console.log(`the count is ${count}`);
    // alert(`I said the count is ${count}`);
  }
  $: if (count >= 10) {
    alert(`count is adngerously high!`);
    count = 9;
  }
  let numbers = [1, 2, 3, 4];
  function addNum() {
    // pop shift unshift splice and object is save
    numbers.push(numbers.length + 1);
    numbers = numbers;
    // numbers = [...numbers, numbers.length];
  }
  $: sum = numbers.reduce((t, n) => t + n, 0);
  const pkg = {
    name: "svelte",
    version: 3,
    speed: "blazing",
    website: "website"
  };
  let count2;
  const unsubscribe = outCount.subscribe(val => {
    count2 = val;
    if (val >= 60) {
      unsubscribe(); //取消订阅
    }
  });
  onDestroy(() => {
    unsubscribe(); // 避免多次订阅，造成内存类型
  });
</script>

<style>
  h1 {
    color: red;
  }
</style>

<main>
  <h1>{xin} {name}!</h1>
  <img {src} alt="A man dances." />
  <img {src} alt="A man dances." />
  <Nested answer={999} />
  <Nested />
  <p>{string}</p>
  <p>
    {@html string}
  </p>
  <button on:click={handleClick}>
    点击了{count}{count === 1 ? 'time' : 'times'}
  </button>
  <p>{count} doubled is {doubled}</p>
  <p>{numbers.join(' + ')} = {sum}</p>
  <button on:click={addNum}>Add a number</button>
  <Info
    name={pkg.name}
    version={pkg.version}
    speed={pkg.speed}
    website={pkg.website} />
  <Info {...pkg} />
  <App2 />
  <App3 />
  <Event />
  <Form />
  <Form2 />
  <Lifecycle />
  <Stores />
  <p>stroes.count:{count2}</p>
  <p>
    不需要使用count.subscribe订阅，也不需要手动取消订阅（简写）:$count={$outCount}
    使用$count+=1相当于count.update(n=>n+1)
  </p>
  <p>动态订阅仅适用于在组件的顶级范围内声明（或导入）的存储变量</p>
  <p>只读的store(使用readable)time:{$time}</p>
  <p>derived,类似vuex的getter:{$seconds}</p>

  <Motion />
  <Transitions />
  <Animations />
  <Action />
  <Action2 />
  <CssClass />
  <Slot>Hello,i am slot.</Slot>
  <Slot />
  <Slot>
    hi
    <span slot="slotName">我是有name的slot</span>
    <p let:aa={bb} slot="slotValue">
      {bb},注意父组件变量声明位置.let指令只能在slot属性的元素上使用（可以是作为slot的组件上）
    </p>
  </Slot>
  <ContextAPI />
  <SpecialElements />
  <ModuleContent />
  <Debugging />
</main>
