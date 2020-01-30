<script>
  import Keypad from "./Keypad.svelte";
  let questions = [
    { id: 1, text: `Where did you go to school?` },
    { id: 2, text: `What is your mother's name?` },
    {
      id: 3,
      text: `What is another personal fact that an attacker could easily find with Google?`
    }
  ];
  let selected = null;
  let selectArred = [];
  let answer = "";
  function handleSubmit() {
    alert(
      `answered question ${selected.id} (${selected.text}) with "${answer}"`
    );
  }

  let todos = [
    { done: false, text: "finish Svelte tutorial" },
    { done: false, text: "build an app" },
    { done: false, text: "world domination" }
  ];

  let canvas;
  let pin;
  $: view = pin ? pin.replace(/\d(?!$)/g, "•") : "enter your pin";

  function handleSubmit2() {
    alert(`submitted ${pin}`);
  }
</script>

<h2>bind:value也适用用select</h2>
<form on:submit|preventDefault={handleSubmit}>
  <select
    placeholder="请选择"
    bind:value={selected}
    on:change={() => (answer = '')}>
    {#each questions as question}
      <option value={question}>{question.text}</option>
    {/each}
  </select>
  <p>
    <input bind:value={answer} />
  </p>
  <button disabled={!answer} type="submit">submit</button>
</form>
<select value="">
  <option value="" disabled selected style="display:none;">请选择</option>
  <option value="1">1</option>
</select>
<p>selected question {selected ? selected.id : '[waiting...]'}</p>
<select multiple bind:value={selectArred}>
  {#each questions as question}
    <option value={question}>{question.text}</option>
  {/each}
</select>
{#each selectArred as question}
  <p>{question.text}</p>
{/each}

<p>bind语法可在each中使用</p>

{#each todos as todo}
  <div class:done={todo.done}>
    <input type="checkbox" bind:checked={todo.done} />
    <input placeholder="What needs to be done?" bind:value={todo.text} />
  </div>
{/each}
{#each todos as todo}
  <div class:done={todo.done}>
    {todo.done}
    <p>{todo.text}</p>
  </div>
{/each}
<h2>在video和audio中也可以使用bind:value绑定属性</h2>
<p>以下属性是只读</p>
<p>duration 视频总长（单位s）</p>
<p>buffered {'{start,end}'}对象数组</p>
<p>seekable 同上</p>
<p>played 同上</p>
<p>seeking 布尔值</p>
<p>edned 布尔值</p>
<p>videoWidth video的属性</p>
<p>videoHeight video的属性</p>
<hr />
<p>以下属性可双向绑定</p>
<p>currentTime —视频中的当前点，以秒为单位</p>
<p>playbackRate—播放视频的速度，1“正常” 在哪里</p>
<p>paused -这应该是不言自明的</p>
<p>volume — 0到1之间的值</p>

<h2>
  块级元素（display:block）可以使用bind绑定clientWidth，clientHeight，offsetWidth和offsetHeight
</h2>
<p>但是这几个都是只读，修改该值无效</p>
<p>不建议将其用于大量元素（需要一定的开销）</p>

<h2>使用bi nd:this可对dom或组件获取渲染元素的引用（vue中的ref）</h2>
<p>
  需要注意的是，必须在渲染后才能使用该应用（渲染完成前该值为undefined）,可在生命周期函数onMount内再使用
</p>
<canvas bind:this={canvas} width={32} height={32} />

<h2>在组件上也可以使用bind指令(子组件需要export)</h2>
<h1 style="color: {pin ? '#333' : '#ccc'}">{view}</h1>

<Keypad bind:aa={pin} on:submit={handleSubmit2} />
