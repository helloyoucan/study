<script>
  import CssClass from "./CssClass.svelte";
  import ContextAPI from "./ContextAPI.svelte";
  import Todo from "./Todo.svelte";
  const options = [
    { color: "red", component: CssClass },
    { color: "green", component: ContextAPI }
  ];

  let selected = options[0];
  let todos = [
    { id: 1, done: true, text: "wash the car" },
    { id: 2, done: false, text: "take the dog for a walk" },
    { id: 3, done: false, text: "mow the lawn" }
  ];

  function toggle(toggled) {
    todos = todos.map(todo => {
      if (todo === toggled) {
        // return a new object
        return {
          id: todo.id,
          text: todo.text,
          done: !todo.done
        };
      }

      // return the same object
      return todo;
    });
  }
</script>

<p>
  {#if false}
    <svelte:self />
    调用组件本身，只能在if或each中使用
  {/if}
</p>

<h2>svelte.component（类似vue的内置组件Component,即动态组件）</h2>
<select bind:value={selected}>
  {#each options as option}
    <option value={option}>{option.color}</option>
  {/each}
</select>
<svelte:component this={selected.component} />

<h2>svelte:window，在这个element上绑定事件，相当于在window上绑定事件</h2>
<svelte:window on:click={() => console.log('svelte:window')} />
<p>除了事件，svelte:window上还可以绑定其它属性</p>
<ul>
  <li>innerWidth</li>
  <li>innerHeight</li>
  <li>outerWidth</li>
  <li>outerHeight</li>
  <li>scrollX</li>
  <li>scrollY</li>
  <li>online —的别名 window.navigator.onLine</li>
</ul>
<p>除了scrollX和scrollY，其它都是只读</p>

<h2>svelte:body,与svelte:window相似，但监听的是document.body上的事件</h2>

<h2>svelte:head，可以往页面的head标签内插入内容</h2>
<svelte:head>
  <link rel="stylesheet" href="tutorial/dark-theme.css" />
</svelte:head>

<p>SSR下，该标签返回内容时与组件内的html内容分开返回</p>

<h2>svelte:options 可以指定元素的编译选项（需要放置到组件dom的顶部）</h2>
<p>
  应用：更新list数据的一个，会导致整个list重新渲染（即使其他选项没有修改），这时候可以用svelte:option的immutable属性来控制
</p>
{#each todos as todo}
  <Todo {todo} on:click={() => toggle(todo)} />
{/each}
<p>该自定义标签的属性有：</p>
<ul>
  <li>
    immutable={true}
    —您从不使用可变数据，因此编译器可以执行简单的引用相等性检查以确定值是否已更改
  </li>
  <li>immutable={false}—默认值。Svelte对于可变对象是否已更改将更加保守</li>
  <li>accessors={true} -为组件的props添加getter和setter</li>
  <li>accessors={false} —默认</li>
  <li>namespace="..." —最常使用此组件的名称空间 "svg"</li>
  <li>tag="..." —将此组件编译为自定义元素时使用的名称</li>
</ul>
